#include "defines.h"
#include "defines_battle.h"
#include "../include/random.h"
#include "../include/constants/items.h"
#include "../include/constants/pokedex.h"

#include "../include/new/battle_start_turn_start.h"
#include "../include/new/battle_util.h"
#include "../include/new/damage_calc.h"
#include "../include/new/util.h"
#include "../include/new/frontier.h"
#include "../include/new/item.h"
#include "../include/new/mega.h"
#include "../include/new/move_tables.h"

#define IS_BATTLE_CIRCUS (gBattleTypeFlags & BATTLE_TYPE_BATTLE_CIRCUS)

ability_t GetBankAbility(u8 bank)
{
	if (IsAbilitySuppressed(bank))
		return ABILITY_NONE;

	return gBattleMons[bank].ability;
}

ability_t GetRecordedAbility(u8 bank)
{
	if (IsAbilitySuppressed(bank))
		return ABILITY_NONE;

	if (BATTLE_HISTORY->abilities[bank] != ABILITY_NONE)
		return BATTLE_HISTORY->abilities[bank];

	u16 species = species;
	u8 ability1 = gBaseStats[species].ability1;
	u8 ability2 = gBaseStats[species].ability2;
	u8 hiddenAbility = gBaseStats[species].hiddenAbility;

	if (ability1 == ability2 && hiddenAbility == ABILITY_NONE)
		return ability1;

	if (ability1 == ability2 && ability1 == hiddenAbility)
		return ability1;

	return ABILITY_NONE; //We don't know which ability the target has
}

ability_t CopyAbility(u8 bank)
{
	if (IsAbilitySuppressed(bank))
		return gNewBS->SuppressedAbilities[bank];
	else if (gNewBS->DisabledMoldBreakerAbilities[bank])
		return gNewBS->DisabledMoldBreakerAbilities[bank];
	else
		return gBattleMons[bank].ability;
}

ability_t* GetAbilityLocation(u8 bank)
{
	if (IsAbilitySuppressed(bank))
		return &gNewBS->SuppressedAbilities[bank];
	else if (gNewBS->DisabledMoldBreakerAbilities[bank])
		return &gNewBS->DisabledMoldBreakerAbilities[bank];
	else
		return &gBattleMons[bank].ability;
}

void RecordAbilityBattle(u8 bank, u8 ability)
{
	BATTLE_HISTORY->abilities[bank] = ability;
}

void ClearBattlerAbilityHistory(u8 bank)
{
	BATTLE_HISTORY->abilities[bank] = ABILITY_NONE;
}

item_effect_t GetBankItemEffect(u8 bank)
{
	if (ABILITY(bank) != ABILITY_KLUTZ && !gNewBS->EmbargoTimers[bank] && !IsMagicRoomActive())
		return ItemId_GetHoldEffect(ITEM(bank));

	return 0;
}

item_effect_t GetMonItemEffect(struct Pokemon* mon)
{
	if (GetPartyAbility(mon) != ABILITY_KLUTZ && !IsMagicRoomActive())
		return ItemId_GetHoldEffect(GetMonData(mon, MON_DATA_HELD_ITEM, NULL));

	return 0;
}

item_effect_t GetRecordedItemEffect(u8 bank)
{
	if (GetRecordedAbility(bank) != ABILITY_KLUTZ
	&& !gNewBS->EmbargoTimers[bank]
	&& !IsMagicRoomActive()
	&& ITEM(bank) != ITEM_NONE) //Can't have an effect if you have no item
		return BATTLE_HISTORY->itemEffects[bank];

	return 0;
}

void RecordItemEffectBattle(u8 bank, u8 itemEffect)
{
	BATTLE_HISTORY->itemEffects[bank] = itemEffect;
}

void ClearBattlerItemEffectHistory(u8 bank)
{
	BATTLE_HISTORY->itemEffects[bank] = 0;
}

struct Pokemon* GetBankPartyData(u8 bank)
{
	u8 index = gBattlerPartyIndexes[bank];
	return (SIDE(bank) == B_SIDE_OPPONENT) ? &gEnemyParty[index] : &gPlayerParty[index];
}

u8 GetBankFromPartyData(struct Pokemon* mon)
{
	for (int i = 0; i < gBattlersCount; ++i)
	{
		if (SIDE(i) == B_SIDE_OPPONENT)
		{
			if ((u32) (&gEnemyParty[gBattlerPartyIndexes[i]]) == (u32) mon)
				return i;
		}

		if (SIDE(i) == B_SIDE_PLAYER)
		{
			if ((u32) (&gPlayerParty[gBattlerPartyIndexes[i]]) == (u32) mon)
				return i;
		}
	}

	return PARTY_SIZE;
}

bool8 CheckGrounding(u8 bank)
{
	if (gStatuses3[bank] & STATUS3_IN_AIR)
		return IN_AIR;

	if (IsGravityActive()
	|| GetBankItemEffect(bank) == ITEM_EFFECT_IRON_BALL
	|| (gStatuses3[bank] & (STATUS3_SMACKED_DOWN | STATUS3_ROOTED)))
		return GROUNDED;

	else if ((gStatuses3[bank] & (STATUS3_LEVITATING | STATUS3_TELEKINESIS | STATUS3_IN_AIR))
		   || ITEM_EFFECT(bank) == ITEM_EFFECT_AIR_BALLOON
		   || ABILITY(bank) == ABILITY_LEVITATE
		   || gBattleMons[bank].type3 == TYPE_FLYING
		   || gBattleMons[bank].type1 == TYPE_FLYING
		   || gBattleMons[bank].type2 == TYPE_FLYING)
				return IN_AIR;

	return GROUNDED;
}

bool8 NonInvasiveCheckGrounding(u8 bank)
{
	if (gStatuses3[bank] & STATUS3_IN_AIR)
		return IN_AIR;

	if (IsGravityActive()
	|| GetRecordedItemEffect(bank) == ITEM_EFFECT_IRON_BALL
	|| (gStatuses3[bank] & (STATUS3_SMACKED_DOWN | STATUS3_ROOTED)))
		return GROUNDED;

	else if ((gStatuses3[bank] & (STATUS3_LEVITATING | STATUS3_TELEKINESIS | STATUS3_IN_AIR))
		   || GetRecordedItemEffect(bank) == ITEM_EFFECT_AIR_BALLOON
		   || GetRecordedAbility(bank) == ABILITY_LEVITATE
		   || gBattleMons[bank].type3 == TYPE_FLYING
		   || gBattleMons[bank].type1 == TYPE_FLYING
		   || gBattleMons[bank].type2 == TYPE_FLYING)
				return IN_AIR;

	return GROUNDED;
}

bool8 CheckGroundingFromPartyData(struct Pokemon* mon)
{
	u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
	u16 item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);

	if (IsGravityActive()
	|| (ItemId_GetHoldEffect(item) == ITEM_EFFECT_IRON_BALL && GetPartyAbility(mon) != ABILITY_KLUTZ))
		return GROUNDED;

	else if  (GetPartyAbility(mon) == ABILITY_LEVITATE
		|| gBaseStats[species].type1 == TYPE_FLYING
		|| gBaseStats[species].type2 == TYPE_FLYING)
			return IN_AIR;
	return GROUNDED;
}

u8 ViableMonCountFromBank(u8 bank)
{
	return (SIDE(bank) == B_SIDE_PLAYER) ? ViableMonCount(gPlayerParty) : ViableMonCount(gEnemyParty);
}

u8 ViableMonCountFromBankLoadPartyRange(u8 bank)
{
	u8 count = 0;
	u8 firstMonId, lastMonId;
	struct Pokemon* party = LoadPartyRange(bank, &firstMonId, &lastMonId);

	for (int i = firstMonId; i < lastMonId; ++i)
	{
		if (party[i].species != SPECIES_NONE
		&& !GetMonData(&party[i], MON_DATA_IS_EGG, NULL)
		&& party[i].hp != 0)
			++count;
	}

	return count;
}

bool8 CheckContact(u16 move, u8 bank)
{
	if (!(gBattleMoves[move].flags & FLAG_MAKES_CONTACT)
	|| ITEM_EFFECT(bank) == ITEM_EFFECT_PROTECTIVE_PADS
	|| ABILITY(bank) == ABILITY_LONGREACH)
		return FALSE;

	return TRUE;
}

bool8 CheckHealingMove(move_t move)
{
	return gBattleMoves[move].flags & FLAG_TRIAGE_AFFECTED;
}

bool8 CheckSoundMove(move_t move)
{
	return CheckTableForMove(move, gSoundMoves);
}

bool8 SheerForceCheck(void)
{
	return ABILITY(gBankAttacker) == ABILITY_SHEERFORCE && CheckTableForMove(gCurrentMove, gSheerForceBoostedMoves);
}

bool8 IsOfType(u8 bank, u8 type)
{
	u8 type1 = gBattleMons[bank].type1;
	u8 type2 = gBattleMons[bank].type2;
	u8 type3 = gBattleMons[bank].type3;

	if (!IS_BLANK_TYPE(type1) && type1 == type)
		return TRUE;

	if (!IS_BLANK_TYPE(type2) && type2 == type)
		return TRUE;

	if (!IS_BLANK_TYPE(type3) && type3 == type)
		return TRUE;

	return FALSE;
}

bool8 LiftProtect(u8 bank)
{
	if (gProtectStructs[bank].protected
	|| gProtectStructs[bank].KingsShield
	|| gProtectStructs[bank].SpikyShield
	|| gProtectStructs[bank].BanefulBunker
	|| gSideAffecting[SIDE(bank)] & (SIDE_STATUS_CRAFTY_SHIELD | SIDE_STATUS_MAT_BLOCK | SIDE_STATUS_QUICK_GUARD | SIDE_STATUS_WIDE_GUARD))
	{
		gProtectStructs[bank].protected = 0;
		gProtectStructs[bank].KingsShield = 0;
		gProtectStructs[bank].SpikyShield = 0;
		gProtectStructs[bank].BanefulBunker = 0;
		gSideAffecting[SIDE(bank)] &= ~(SIDE_STATUS_CRAFTY_SHIELD | SIDE_STATUS_MAT_BLOCK | SIDE_STATUS_QUICK_GUARD | SIDE_STATUS_WIDE_GUARD);
		return TRUE;
	}

	return FALSE;
}

bool8 ProtectsAgainstZMoves(u16 move, u8 bankAtk, u8 bankDef)
{
	if (gProtectStructs[bankDef].protected
	|| gProtectStructs[bankDef].SpikyShield
	|| gProtectStructs[bankDef].BanefulBunker)
	{
		return TRUE;
	}
	else if ((gProtectStructs[bankDef].KingsShield || (gSideAffecting[SIDE(bankDef)] & SIDE_STATUS_MAT_BLOCK))
		 && SPLIT(move) != SPLIT_STATUS)
	{
		return TRUE;
	}
	else if (gSideAffecting[SIDE(bankDef)] & SIDE_STATUS_CRAFTY_SHIELD && bankAtk != bankDef && SPLIT(move) == SPLIT_STATUS)
	{
		return TRUE;
	}
	else if (gSideAffecting[SIDE(bankDef)] & (SIDE_STATUS_QUICK_GUARD) && PriorityCalc(bankAtk, ACTION_USE_MOVE, move) > 0)
	{
		return TRUE;
	}
	else if (gSideAffecting[SIDE(bankDef)] & (SIDE_STATUS_WIDE_GUARD)
		&& (gBattleMoves[move].target == MOVE_TARGET_BOTH || gBattleMoves[move].target == MOVE_TARGET_FOES_AND_ALLY))
	{
		return TRUE;
	}

	return FALSE;
}

bool8 StatsMaxed(u8 bank)
{
	for (u8 i = STAT_STAGE_ATK; i < BATTLE_STATS_NO; ++i)
	{
		if (STAT_STAGE(bank, i) < STAT_STAGE_MAX)
			return FALSE;
	}

	return TRUE;
}

bool8 MainStatsMaxed(u8 bank)
{
	for (u8 i = 0; i < STAT_ACC-1; ++i)
	{
		if (gBattleMons[bank].statStages[i] < STAT_STAGE_MAX)
			return FALSE;
	}

	return TRUE;
}

bool8 StatsMinned(u8 bank)
{
	for (u8 i = STAT_STAGE_ATK; i < BATTLE_STATS_NO; ++i)
	{
		if (STAT_STAGE(bank, i) > 0)
			return FALSE;
	}
	return TRUE;
}

bool8 AnyStatGreaterThan(u8 bank, u8 amount)
{
	for (u8 i = STAT_STAGE_ATK; i < BATTLE_STATS_NO; ++i)
	{
		if (STAT_STAGE(bank, i) > amount)
			return TRUE;
	}

	return FALSE;
}

u8 CountBoosts(u8 bank)
{
	u8 sum = 0;

	for (u8 i = STAT_STAGE_ATK; i < BATTLE_STATS_NO; ++i)
	{
		if (STAT_STAGE(bank, i) > 6)
			sum += gBattleMons[bank].statStages[i] - 6;
	}
	return sum;
}

u8 GetMoveTarget(u16 move, u8 useMoveTarget)
{
	u8 bankAtk = gBankAttacker;
	u8 bankDef = 0;
	u8 moveTarget;
	u8 atkSide, defSide;
	u8 chosen = FALSE;

	if (useMoveTarget)
		moveTarget = useMoveTarget - 1;
	else
		moveTarget = gBattleMoves[move].target;

	switch (moveTarget) {
	case MOVE_TARGET_SELECTED:
		defSide = SIDE(bankAtk) ^ BIT_SIDE;
		if (gSideTimers[defSide].followmeTimer && gBattleMons[gSideTimers[defSide].followmeTarget].hp && move != MOVE_SKYDROP)
			bankDef = gSideTimers[defSide].followmeTarget;

		else {
			if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE) {
				if (gBattleMons[defSide].hp == 0 && gBattleMons[defSide ^ BIT_FLANK].hp == 0) {
					bankDef = defSide; //Both targets are dead so either target on opposing side works
					chosen = TRUE;
				}
			}

			else if (gBattleMons[defSide].hp == 0) {
				bankDef = defSide; //Target is dead so no choice but to hit it
				chosen = TRUE;
			}

			if (!chosen) {
				atkSide = SIDE(bankAtk);
				do {
					bankDef = umodsi(Random(), gBattlersCount);
				} while (bankDef == bankAtk || atkSide == SIDE(bankDef) || gAbsentBattlerFlags & gBitTable[bankDef]);
			}

			if (NO_MOLD_BREAKERS(ABILITY(bankAtk), move))
			{
				u8 moveType = GetMoveTypeSpecial(bankAtk, move);
				switch (moveType) {
					case TYPE_WATER:
						if (ABILITY(bankDef) != ABILITY_STORMDRAIN)
						{
							if (ABILITY(SIDE(bankAtk) ^ BIT_SIDE) == ABILITY_STORMDRAIN)
							{
								bankDef = SIDE(bankAtk) ^ BIT_SIDE;
								RecordAbilityBattle(bankDef, ABILITY_STORMDRAIN);
								gSpecialStatuses[bankDef].lightningRodRedirected = 1;
							}
							else if (ABILITY(PARTNER(SIDE(bankAtk) ^ BIT_SIDE)) == ABILITY_STORMDRAIN)
							{
								bankDef = PARTNER(SIDE(bankAtk) ^ BIT_SIDE);
								RecordAbilityBattle(bankDef, ABILITY_STORMDRAIN);
								gSpecialStatuses[bankDef].lightningRodRedirected = 1;
							}
							else if (ABILITY(PARTNER(bankAtk)) == ABILITY_STORMDRAIN)
							{
								bankDef = PARTNER(bankAtk);
								RecordAbilityBattle(bankDef, ABILITY_STORMDRAIN);
								gSpecialStatuses[bankDef].lightningRodRedirected = 1;
							}
						}
						break;

					case TYPE_ELECTRIC:
						if (ABILITY(bankDef) != ABILITY_LIGHTNINGROD)
						{
							if (ABILITY(SIDE(bankAtk) ^ BIT_SIDE) == ABILITY_LIGHTNINGROD)
							{
								bankDef = SIDE(bankAtk) ^ BIT_SIDE;
								RecordAbilityBattle(bankDef, ABILITY_LIGHTNINGROD);
								gSpecialStatuses[bankDef].lightningRodRedirected = 1;
							}
							else if (ABILITY(PARTNER(SIDE(bankAtk) ^ BIT_SIDE)) == ABILITY_LIGHTNINGROD)
							{
								bankDef = PARTNER(SIDE(bankAtk) ^ BIT_SIDE);
								RecordAbilityBattle(bankDef, ABILITY_LIGHTNINGROD);
								gSpecialStatuses[bankDef].lightningRodRedirected = 1;
							}
							else if (ABILITY(PARTNER(bankAtk)) == ABILITY_LIGHTNINGROD)
							{
								bankDef = PARTNER(bankAtk);
								RecordAbilityBattle(bankDef, ABILITY_LIGHTNINGROD);
								gSpecialStatuses[bankDef].lightningRodRedirected = 1;
							}
						}
				}
			}
		}
		break;

	case MOVE_TARGET_DEPENDS:
	case MOVE_TARGET_BOTH:
	case MOVE_TARGET_FOES_AND_ALLY:
	case MOVE_TARGET_OPPONENTS_FIELD:
		bankDef = GetBattlerAtPosition((GetBattlerPosition(bankAtk) & BIT_SIDE) ^ BIT_SIDE);
		if (gAbsentBattlerFlags & gBitTable[bankDef])
			bankDef ^= BIT_FLANK;
		break;

	case MOVE_TARGET_RANDOM:
		defSide = SIDE(bankAtk) ^ BIT_SIDE;
		if (gSideTimers[defSide].followmeTimer && gBattleMons[gSideTimers[defSide].followmeTarget].hp)
			bankDef = gSideTimers[defSide].followmeTarget;

		else if (gBattleTypeFlags & BATTLE_TYPE_DOUBLE && moveTarget & 4) {
			if (SIDE(bankAtk) == B_SIDE_PLAYER) {
				if (Random() & 1)
					bankDef = GetBattlerAtPosition(B_POSITION_OPPONENT_LEFT);
				else
					bankDef = GetBattlerAtPosition(B_POSITION_OPPONENT_RIGHT);
			}
			else
			{
				if (Random() & 1)
					bankDef = GetBattlerAtPosition(B_POSITION_PLAYER_LEFT);
				else
					bankDef = GetBattlerAtPosition(B_POSITION_PLAYER_RIGHT);
			}
			if (gAbsentBattlerFlags & gBitTable[bankDef])
				bankDef ^= 2;
		}
		else
			bankDef = GetBattlerAtPosition((GetBattlerPosition(bankAtk) & BIT_SIDE) ^ BIT_SIDE);
		break;

	case MOVE_TARGET_USER_OR_PARTNER:
	case MOVE_TARGET_USER:
		bankDef = bankAtk;
		break;
	}

	if (!gNewBS->DancerInProgress && !gNewBS->InstructInProgress)
		gBattleStruct->moveTarget[bankAtk] = bankDef;

	return bankDef;
}

bool8 IsBattlerAlive(u8 bank)
{
	if (!BATTLER_ALIVE(bank)
	||	bank >= gBattlersCount
	||	gAbsentBattlerFlags & gBitTable[bank])
	{
		return FALSE;
	}

	return TRUE;
}

struct Pokemon* LoadPartyRange(u8 bank, u8* firstMonId, u8* lastMonId)
{
	struct Pokemon* party;

	party = (SIDE(bank) == B_SIDE_OPPONENT) ? gEnemyParty : gPlayerParty;

	if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER && SIDE(bank) == B_SIDE_PLAYER)
	{
		*firstMonId = 0;
		if (GetBattlerPosition(bank) == B_POSITION_PLAYER_RIGHT)
			*firstMonId = 3;

		*lastMonId = *firstMonId + 3;
	}
	else if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
	{
		//Two Human Trainers vs Two AI Trainers
		if (gBattleTypeFlags & BATTLE_TYPE_TOWER_LINK_MULTI)
		{
			if (SIDE(bank) == B_SIDE_PLAYER)
			{
				*firstMonId = 0;
				if (GetLinkTrainerFlankId(GetBattlerMultiplayerId(bank)) == TRUE)
					*firstMonId = 3;
			}
			else //B_SIDE_OPPONENT
			{
				if (bank == B_POSITION_OPPONENT_LEFT)
					*firstMonId = 0;
				else
					*firstMonId = 3;
			}
		}
		//Two Human Trainers vs Two Human Trainers
		else
		{
			*firstMonId = 0;
			if (GetLinkTrainerFlankId(GetBattlerMultiplayerId(bank)) == TRUE)
				*firstMonId = 3;
		}

		*lastMonId = *firstMonId + 3;
	}
	else if (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS && SIDE(bank) == B_SIDE_OPPONENT)
	{
		*firstMonId = 0;
		if (GetBattlerPosition(bank) == B_POSITION_OPPONENT_RIGHT)
			*firstMonId = 3;

		*lastMonId = *firstMonId + 3;
	}
	else //Single Battle // Regular Double Battle // Regular Double Against Two Trainers + PlayerSide // Wild Double Battle
	{
		*firstMonId = 0;
		*lastMonId = PARTY_SIZE;
	}

	return party;
}

bool8 UproarWakeUpCheck(unusedArg u8 bank)
{
	u32 i;

	for (i = 0; i < gBattlersCount; ++i)
	{
		if (gBattleMons[i].status2 & STATUS2_UPROAR)
		{
			gBattleScripting->bank = i;
			if (gBankTarget == 0xFF)
				gBankTarget = i;
			else if (gBankTarget == i)
				gBattleCommunication[MULTISTRING_CHOOSER] = 0;
			else
				gBattleCommunication[MULTISTRING_CHOOSER] = 1;

			break;
		}
	}

	return i < gBattlersCount;
}

bool8 IsUproarBeingMade(void)
{
	for (u32 i = 0; i < gBattlersCount; ++i)
	{
		if (gBattleMons[i].status2 & STATUS2_UPROAR)
			return TRUE;
	}

	return FALSE;
}

//Change to loop through battle modified party indexes
u8 GetIllusionPartyNumber(u8 bank)
{
	u8 firstMonId, lastMonId;

	if (gStatuses3[bank] & STATUS3_ILLUSION)
	{
		//Wild Pokemon can't diguise themselves
		if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER) && SIDE(bank) == B_SIDE_OPPONENT)
			return gBattlerPartyIndexes[bank];

		struct Pokemon* party = LoadPartyRange(bank, &firstMonId, &lastMonId);

		for (u32 i = lastMonId - 1; i >= firstMonId; --i) //Loop through party in reverse order
		{
			if (i == gBattlerPartyIndexes[bank]) //Finsihed checking mons after
				return gBattlerPartyIndexes[bank];

			if (party[i].species == SPECIES_NONE ||  party[i].hp == 0)
				continue;

			return i;
		}
	}

	return gBattlerPartyIndexes[bank];
}

struct Pokemon* GetIllusionPartyData(u8 bank)
{
	u8 firstMonId, lastMonId;
	struct Pokemon* party = LoadPartyRange(bank, &firstMonId, &lastMonId);

	return &party[GetIllusionPartyNumber(bank)];
}

bool8 BankMovedBefore(u8 bank1, u8 bank2)
{
	for (u32 i = 0; i < gBattlersCount; ++i)
	{
		if (gBanksByTurnOrder[i] == bank1)
			return TRUE;
		else if (gBanksByTurnOrder[i] == bank2)
			return FALSE;
	}

	return FALSE; //Should never be reached
}

bool8 IsFirstAttacker(u8 bank)
{
	for (u8 i = 0; i < gBattlersCount; ++i)
	{
		if (gActionsByTurnOrder[i] == ACTION_USE_ITEM
		||  gActionsByTurnOrder[i] == ACTION_SWITCH)
			continue;

		return gBanksByTurnOrder[i] == bank;
	}

	return FALSE; //Should never be reached
}

bool8 CanTransferItem(u16 species, u16 item)
{
	u16 dexNum = SpeciesToNationalPokedexNum(species);
	u8 effect = ItemId_GetHoldEffect(item);
	const struct Evolution* evolutions = gEvolutionTable[species];
	int i;

	if (IsMail(item))
		return FALSE;

	switch (effect) {
		case ITEM_EFFECT_Z_CRYSTAL:
			return FALSE;

		case ITEM_EFFECT_GRISEOUS_ORB:
			if (dexNum == NATIONAL_DEX_GIRATINA)
				return FALSE;
			break;

		case ITEM_EFFECT_PLATE:
			if (dexNum == NATIONAL_DEX_ARCEUS)
				return FALSE;
			break;

		case ITEM_EFFECT_MEMORY:
			if (dexNum == NATIONAL_DEX_SILVALLY)
				return FALSE;
			break;

		case ITEM_EFFECT_DRIVE:
			if (dexNum == NATIONAL_DEX_GENESECT)
				return FALSE;
			break;

		case ITEM_EFFECT_MEGA_STONE:
			for (i = 0; i < EVOS_PER_MON; ++i)
			{
				if ((evolutions[i].method == MEGA_EVOLUTION && evolutions[i].param == item) //Can Mega Evolve
				||  (evolutions[i].method == MEGA_EVOLUTION && evolutions[i].param == 0)) //Is Mega
					return FALSE;
			}
			break;

		case ITEM_EFFECT_PRIMAL_ORB:
			for (i = 0; i < EVOS_PER_MON; ++i)
			{
				if ((evolutions[i].method == MEGA_EVOLUTION && evolutions[i].unknown == MEGA_VARIANT_PRIMAL && evolutions[i].param == item) //Can Primal Evolve
				||  (evolutions[i].method == MEGA_EVOLUTION && evolutions[i].unknown == MEGA_VARIANT_PRIMAL && evolutions[i].param == 0)) //Is Primal
					return FALSE;
			}
			break;
	}

	return TRUE;
}

//Make sure the input bank is any bank on the specific mon's side
bool8 CanFling(u16 item, u16 species, u8 ability, u8 bankOnSide, u8 embargoTimer)
{
	u8 itemEffect = ItemId_GetHoldEffect(item);

	if (item == ITEM_NONE
	|| ability == ABILITY_KLUTZ
	|| IsMagicRoomActive()
	|| embargoTimer != 0
	|| !CanTransferItem(species, item)
	|| itemEffect == ITEM_EFFECT_PRIMAL_ORB
	|| itemEffect == ITEM_EFFECT_GEM
	|| itemEffect == ITEM_EFFECT_ABILITY_CAPSULE
	|| (IsBerry(item) && AbilityBattleEffects(ABILITYEFFECT_CHECK_OTHER_SIDE, bankOnSide, ABILITY_UNNERVE, 0, 0))
	|| GetPocketByItemId(item) == POCKET_POKE_BALLS)
		return FALSE;

	return TRUE;
}

bool8 SymbiosisCanActivate(u8 giverBank, u8 receiverBank)
{
	u16 item = ITEM(giverBank);

	if (!(gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
	||  ABILITY(giverBank) != ABILITY_SYMBIOSIS
	||  ITEM(receiverBank) != ITEM_NONE
	||  ITEM(giverBank) == ITEM_NONE
	|| !CanTransferItem(gBattleMons[giverBank].species, item)
	|| !CanTransferItem(gBattleMons[receiverBank].species, item))
		return FALSE;

	return TRUE;
}

//Sticky Hold also, but the boost ignores it
bool8 CanKnockOffItem(u8 bank)
{
	u16 item = ITEM(bank);

	if (item == ITEM_NONE)
		return FALSE;

	if (!(gBattleTypeFlags & BATTLE_TYPE_TRAINER) && SIDE(bank) == B_SIDE_PLAYER) //Wild mons can't knock off items
		return FALSE;

	if (!CanTransferItem(SPECIES(bank), item))
		return FALSE;

	return TRUE;
}

bool8 IsAffectedByPowder(u8 bank)
{
	return IsAffectedByPowderByDetails(gBattleMons[bank].type1, gBattleMons[bank].type2, gBattleMons[bank].type3, ABILITY(bank), ITEM_EFFECT(bank));
}

bool8 IsAffectedByPowderByDetails(u8 type1, u8 type2, u8 type3, u8 ability, u8 itemEffect)
{
	return ability != ABILITY_OVERCOAT
		&& itemEffect != ITEM_EFFECT_SAFETY_GOGGLES
		&& type1 != TYPE_GRASS
		&& type2 != TYPE_GRASS
		&& type3 != TYPE_GRASS;
}

bool8 MoveIgnoresSubstitutes(u16 move, u8 bankAtk)
{
	return CheckSoundMove(move)
		|| ABILITY(bankAtk) == ABILITY_INFILTRATOR;
}

bool8 MoveBlockedBySubstitute(u16 move, u8 bankAtk, u8 bankDef)
{
	return gBattleMons[bankDef].status2 & STATUS2_SUBSTITUTE
		&& !MoveIgnoresSubstitutes(move, bankAtk);
}

bool8 IsMockBattle(void)
{
	return (gBattleTypeFlags & BATTLE_TYPE_MOCK_BATTLE) != 0;
}

u8 CalcMoveSplit(u8 bank, u16 move)
{
	if (CheckTableForMove(move, gMovesThatChangePhysicality)
	&&  SPLIT(move) != SPLIT_STATUS)
	{
		u32 attack = gBattleMons[bank].attack;
		u32 spAttack = gBattleMons[bank].spAttack;

		attack = attack * gStatStageRatios[gBattleMons[bank].statStages[STAT_STAGE_ATK-1]][0];
		attack = udivsi(attack, gStatStageRatios[gBattleMons[bank].statStages[STAT_STAGE_ATK-1]][1]);

		spAttack = spAttack * gStatStageRatios[gBattleMons[bank].statStages[STAT_STAGE_SPATK-1]][0];
		spAttack = udivsi(spAttack, gStatStageRatios[gBattleMons[bank].statStages[STAT_STAGE_SPATK-1]][1]);

		if (spAttack >= attack)
			return SPLIT_SPECIAL;
		else
			return SPLIT_PHYSICAL;
	}

	#ifdef OLD_MOVE_SPLIT
		if (gBattleMoves[move].type < TYPE_FIRE)
			return SPLIT_PHYSICAL;
		else
			return SPLIT_SPECIAL;
	#else
		return SPLIT(move);
	#endif
}

u8 CalcMoveSplitFromParty(struct Pokemon* mon, u16 move)
{
	if (CheckTableForMove(move, gMovesThatChangePhysicality))
	{
		if (mon->spAttack >= mon->attack)
			return SPLIT_SPECIAL;
		else
			return SPLIT_PHYSICAL;
	}

	return SPLIT(move);
}

u8 FindMovePositionInMoveset(u16 move, u8 bank)
{
	int i;

	for (i = 0; i < MAX_MON_MOVES; ++i)
	{
		if (gBattleMons[bank].moves[i] == move)
			break;
	}

	return i;
}

bool8 MoveInMoveset(u16 move, u8 bank)
{
	return FindMovePositionInMoveset(move, bank) < MAX_MON_MOVES;
}

u8 AttacksThisTurn(u8 bank, u16 move) // Note: returns 1 if it's a charging turn, otherwise 2
{
	u8 moveEffect = gBattleMoves[move].effect;

	// first argument is unused
	if (ITEM_EFFECT(bank) == ITEM_EFFECT_POWER_HERB)
		return 2;

	if (moveEffect == EFFECT_SOLARBEAM && (gBattleWeather & WEATHER_SUN_ANY) && WEATHER_HAS_EFFECT)
		return 2;

	if (moveEffect == EFFECT_SKULL_BASH
	||  moveEffect == EFFECT_RAZOR_WIND
	||  moveEffect == EFFECT_SKY_ATTACK
	||  moveEffect == EFFECT_SOLARBEAM
	||  moveEffect == EFFECT_SEMI_INVULNERABLE
	||  moveEffect == EFFECT_BIDE
	||	move == MOVE_GEOMANCY
	||  move == MOVE_SKYDROP)
	{
		if (gBattleMons[bank].status2 & STATUS2_MULTIPLETURNS)
			return 2;
		else
			return 1; //About to initiate attack.
	}

	return 2;
}

bool8 IsZMove(const u16 move)
{
	return move >= FIRST_Z_MOVE && move <= LAST_Z_MOVE;
}

void AddBankToPickupStack(const u8 bank)
{
	u32 i, j;
	u8 newStack[MAX_BATTLERS_COUNT];

	for (i = 0, j = 0; i < gBattlersCount; ++i)
	{
		if (gNewBS->pickupStack[i] != bank && gNewBS->pickupStack[i] != 0xFF)
			newStack[j++] = gNewBS->pickupStack[i];
	}

	newStack[j++] = bank;

	while (j < gBattlersCount)
		newStack[j++] = 0xFF;

	for (i = 0; i < gBattlersCount; ++i)
		gNewBS->pickupStack[i] = newStack[i];
}

void RemoveBankFromPickupStack(const u8 bank)
{
	u32 i, j;
	u8 newStack[MAX_BATTLERS_COUNT];

	for (i = 0, j = 0; i < gBattlersCount; ++i)
	{
		if (gNewBS->pickupStack[i] != bank && gNewBS->pickupStack[i] != 0xFF)
			newStack[j++] = gNewBS->pickupStack[i];
	}

	while (j < gBattlersCount)
		newStack[j++] = 0xFF;

	for (i = 0; i < gBattlersCount; ++i)
		gNewBS->pickupStack[i] = newStack[i];
}

u8 GetTopOfPickupStackNotIncludingBank(const u8 bank)
{
	u32 i;

	for (i = 0; i < gBattlersCount; ++i)
	{
		if (gNewBS->pickupStack[i] == 0xFF)
			break;
	}

	if (i == 0 //Stack is empty
	|| (i == 1 && gNewBS->pickupStack[0] == bank)) //Stack only contains ignored bank
		return 0xFF;

	if (gNewBS->pickupStack[i - 1] == bank)
		return gNewBS->pickupStack[i - 2];

	return gNewBS->pickupStack[i - 1];
}

void ClearBankStatus(u8 bank)
{
	if (gBattleMons[bank].status1 & (STATUS_POISON | STATUS_TOXIC_POISON))
		StringCopy(gBattleTextBuff1, gStatusConditionString_Poison);
	else if (gBattleMons[bank].status1 & STATUS_SLEEP)
		StringCopy(gBattleTextBuff1, gStatusConditionString_Sleep);
	else if (gBattleMons[bank].status1 & STATUS_PARALYSIS)
		StringCopy(gBattleTextBuff1, gStatusConditionString_Paralysis);
	else if (gBattleMons[bank].status1 & STATUS_BURN)
		StringCopy(gBattleTextBuff1, gStatusConditionString_Burn);
	else if (gBattleMons[bank].status1 & STATUS_FREEZE)
		StringCopy(gBattleTextBuff1, gStatusConditionString_Ice);

	gBattleMons[bank].status1 = 0;
	gBattleMons[bank].status2 &= ~(STATUS2_NIGHTMARE);
	gActiveBattler = bank;
	EmitSetMonData(0, REQUEST_STATUS_BATTLE, 0, 4, &gBattleMons[bank].status1);
	MarkBufferBankForExecution(gActiveBattler);
}

bool8 DoesSleepClausePrevent(u8 bank)
{
	if (gBattleTypeFlags & BATTLE_TYPE_FRONTIER)
	{
		switch (VarGet(BATTLE_TOWER_TIER)) {
			case BATTLE_TOWER_OU:
			case BATTLE_TOWER_UBER:
			case BATTLE_TOWER_LITTLE_CUP:
			case BATTLE_TOWER_MONOTYPE:
			case BATTLE_TOWER_CAMOMONS:
			case BATTLE_TOWER_UBER_CAMOMONS:
			case BATTLE_TOWER_LC_CAMOMONS:
			case BATTLE_TOWER_SCALEMONS:
			case BATTLE_TOWER_350_CUP:
			case BATTLE_TOWER_AVERAGE_MONS:
			case BATTLE_TOWER_BENJAMIN_BUTTERFREE: ;
				u8 firstId, lastId;
				struct Pokemon* party = LoadPartyRange(bank, &firstId, &lastId);

				for (int i = 0; i < PARTY_SIZE; ++i)
				{
					if (GetMonData(&party[i], MON_DATA_HP, NULL) != 0
					&& !GetMonData(&party[i], MON_DATA_IS_EGG, NULL)
					&& GetMonData(&party[i], MON_DATA_STATUS, NULL) & STATUS_SLEEP) //Someone on team is already asleep
						return TRUE;
				}
		}
	}

	return FALSE;
}

bool8 CanBeGeneralStatused(u8 bank, bool8 checkFlowerVeil)
{
	if (ABILITY(bank) == ABILITY_SHIELDSDOWN
	&&  GetBankPartyData(bank)->species == SPECIES_MINIOR_SHIELD) //Prevents Ditto from getting this benefit
		return FALSE;

	switch (ABILITY(bank)) {
		case ABILITY_COMATOSE:
			return FALSE;

		case ABILITY_LEAFGUARD:
			if (WEATHER_HAS_EFFECT && gBattleWeather & WEATHER_SUN_ANY)
				return FALSE;
			break;

		case ABILITY_FLOWERVEIL:
			if (checkFlowerVeil && IsOfType(bank, TYPE_GRASS))
				return FALSE;
	}

	if (checkFlowerVeil && ABILITY(PARTNER(bank)) == ABILITY_FLOWERVEIL && IsOfType(bank, TYPE_GRASS))
		return FALSE;

	if (gTerrainType == MISTY_TERRAIN && CheckGrounding(bank))
		return FALSE;

	if (gBattleMons[bank].status1 != STATUS1_NONE)
		return FALSE;

	if (gSideAffecting[SIDE(bank)] & SIDE_STATUS_SAFEGUARD)
		return FALSE;

	return TRUE;
}

bool8 CanBePutToSleep(u8 bank, bool8 checkFlowerVeil)
{
	if (!CanBeGeneralStatused(bank, checkFlowerVeil))
		return FALSE;

	switch (ABILITY(bank)) {
		case ABILITY_INSOMNIA:
		case ABILITY_VITALSPIRIT:
		case ABILITY_SWEETVEIL:
			return FALSE;
	}

	if (gTerrainType == ELECTRIC_TERRAIN && CheckGrounding(bank))
		return FALSE;

	if (DoesSleepClausePrevent(bank))
		return FALSE;

	return TRUE;
}

bool8 CanBePoisoned(u8 bankDef, u8 bankAtk, bool8 checkFlowerVeil)
{
	if (!CanBeGeneralStatused(bankDef, checkFlowerVeil))
		return FALSE;

	switch (ABILITY(bankDef)) {
		case ABILITY_IMMUNITY:
			return FALSE;
	}

	if (ABILITY(bankAtk) != ABILITY_CORROSION)
	{
		if (IsOfType(bankDef, TYPE_POISON) || IsOfType(bankDef, TYPE_STEEL))
			return FALSE;
	}

	return TRUE;
}

bool8 CanBeParalyzed(u8 bank, bool8 checkFlowerVeil)
{
	if (!CanBeGeneralStatused(bank, checkFlowerVeil))
		return FALSE;

	if (IsOfType(bank, TYPE_ELECTRIC))
		return FALSE;

	switch (ABILITY(bank)) {
		case ABILITY_LIMBER:
			return FALSE;
	}

	return TRUE;
}

bool8 CanBeBurned(u8 bank, bool8 checkFlowerVeil)
{
	if (!CanBeGeneralStatused(bank, checkFlowerVeil))
		return FALSE;

	if (IsOfType(bank, TYPE_FIRE))
		return FALSE;

	switch (ABILITY(bank)) {
		case ABILITY_WATERVEIL:
		case ABILITY_WATERBUBBLE:
			return FALSE;
	}

	return TRUE;
}

bool8 CanBeFrozen(u8 bank, bool8 checkFlowerVeil)
{
	if (!CanBeGeneralStatused(bank, checkFlowerVeil))
		return FALSE;

	if (IsOfType(bank, TYPE_ICE))
		return FALSE;

	switch (ABILITY(bank)) {
		case ABILITY_MAGMAARMOR:
			return FALSE;
	}

	if (WEATHER_HAS_EFFECT && gBattleWeather & WEATHER_SUN_ANY)
		return FALSE;

	return TRUE;
}

bool8 CanBeConfused(u8 bank)
{
	if (IsConfused(bank))
		return FALSE;

	if (gTerrainType == MISTY_TERRAIN && CheckGrounding(bank))
		return FALSE;

	if (ABILITY(bank) == ABILITY_OWNTEMPO)
		return FALSE;

	return TRUE;
}

bool8 IsTrickRoomActive(void)
{
	return gNewBS->TrickRoomTimer > 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_TRICK_ROOM);
}

bool8 IsMagicRoomActive(void)
{
	return gNewBS->MagicRoomTimer > 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_MAGIC_ROOM);
}

bool8 IsWonderRoomActive(void)
{
	return gNewBS->WonderRoomTimer > 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_WONDER_ROOM);
}

bool8 IsGravityActive(void)
{
	return gNewBS->GravityTimer > 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_GRAVITY);
}

bool8 IsIonDelugeActive(void)
{
	return gNewBS->IonDelugeTimer > 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_ION_DELUGE);
}

bool8 IsFairyLockActive(void)
{
	return gNewBS->FairyLockTimer > 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_FAIRY_LOCK);
}

bool8 IsMudSportActive(void)
{
	return gNewBS->MudSportTimer > 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_MUD_SPORT);
}

bool8 IsWaterSportActive(void)
{
	return gNewBS->WaterSportTimer > 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_WATER_SPORT);
}

bool8 IsInverseBattle(void)
{
	return FlagGet(INVERSE_FLAG)
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_INVERSE);
}

bool8 BankSideHasSeaOfFire(u8 bank)
{
	return gNewBS->SeaOfFireTimers[SIDE(bank)]
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_SEA_OF_FIRE);
}

bool8 BankSideHasRainbow(u8 bank)
{
	return gNewBS->RainbowTimers[SIDE(bank)]
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_RAINBOW);
}

bool8 BankSideHasSwamp(u8 bank)
{
	return SideHasSwamp(SIDE(bank));
}

bool8 SideHasSwamp(u8 side)
{
	return gNewBS->SwampTimers[side]
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_SWAMP);
}

bool8 IsConfused(u8 bank)
{
	return (gBattleMons[bank].status2 & STATUS2_CONFUSION) != 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_CONFUSED && ABILITY(bank) != ABILITY_OWNTEMPO);
}

bool8 IsTaunted(u8 bank)
{
	return gDisableStructs[bank].tauntTimer > 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_TAUNT && ABILITY(bank) != ABILITY_OBLIVIOUS);
}

bool8 IsTormented(u8 bank)
{
	return (gBattleMons[bank].status2 & STATUS2_TORMENT) != 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_TORMENT);
}

bool8 IsHealBlocked(u8 bank)
{
	return gNewBS->HealBlockTimers[bank] > 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_HEAL_BLOCK);
}

bool8 CantUseSoundMoves(u8 bank)
{
	return gNewBS->ThroatChopTimers[bank] > 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_THROAT_CHOP);
}

bool8 IsLaserFocused(u8 bank)
{
	return gNewBS->LaserFocusTimers[bank] > 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_ALWAYS_CRIT);
}

bool8 IsAbilitySuppressed(u8 bank)
{
	return (gStatuses3[bank] & STATUS3_ABILITY_SUPPRESS) != 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_ABILITY_SUPPRESSION);
}

bool8 CantScoreACrit(u8 bank, struct Pokemon* mon)
{
	if (mon != NULL)
		return FALSE;

	return (gStatuses3[bank] & STATUS3_CANT_SCORE_A_CRIT) != 0
		|| (IS_BATTLE_CIRCUS && gBattleCircusFlags & BATTLE_CIRCUS_NO_CRITS);
}