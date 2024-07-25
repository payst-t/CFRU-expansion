.thumb
.text
.align 2
/*
attack_description_table.s
	descriptions of battle moves
*/

.word DESC_NO_MOVE
.global gMoveDescriptions
gMoveDescriptions:
.word 0x8482834		@MOVE_POUND
.word 0x8482874		@MOVE_KARATECHOP
.word 0x84828bd		@MOVE_DOUBLESLAP
.word 0x84828ff		@MOVE_COMETPUNCH
.word 0x8482946		@MOVE_MEGAPUNCH
.word 0x8482985		@MOVE_PAYDAY
.word 0x84829c9		@MOVE_FIREPUNCH
.word DESC_ICEPUNCH
.word 0x8482a53		@MOVE_THUNDERPUNCH
.word 0x8482aa0		@MOVE_SCRATCH
.word 0x8482acd		@MOVE_VICEGRIP
.word 0x8482b00		@MOVE_GUILLOTINE
.word 0x8482b46		@MOVE_RAZORWIND
.word 0x8482b94		@MOVE_SWORDSDANCE
.word 0x8482bd5		@MOVE_CUT
.word 0x8482c16		@MOVE_GUST
.word 0x8482c4f		@MOVE_WINGATTACK
.word 0x8482c89		@MOVE_WHIRLWIND
.word 0x8482cd3		@MOVE_FLY
.word 0x8482d1d		@MOVE_BIND
.word 0x8482d66		@MOVE_SLAM
.word 0x8482d96		@MOVE_VINEWHIP
.word 0x8482dc8		@MOVE_STOMP
.word 0x8482e08		@MOVE_DOUBLEKICK
.word 0x8482e45		@MOVE_MEGAKICK
.word 0x8482e83		@MOVE_JUMPKICK
.word 0x8482ecc		@MOVE_ROLLINGKICK
.word 0x8482f0a		@MOVE_SANDATTACK
.word 0x8482f4c		@MOVE_HEADBUTT
.word 0x8482f8f		@MOVE_HORNATTACK
.word 0x8482fd0		@MOVE_FURYATTACK
.word 0x8483014		@MOVE_HORNDRILL
.word 0x848305c		@MOVE_TACKLE
.word 0x84830a2		@MOVE_BODYSLAM
.word 0x84830eb		@MOVE_WRAP
.word 0x8483130		@MOVE_TAKEDOWN
.word 0x8483178		@MOVE_THRASH
.word 0x84831bf		@MOVE_DOUBLEEDGE
.word 0x8483203		@MOVE_TAILWHIP
.word 0x8483249		@MOVE_POISONSTING
.word 0x848328b		@MOVE_TWINEEDLE
.word 0x84832d2		@MOVE_PINMISSILE
.word 0x8483314		@MOVE_LEER
.word 0x8483358		@MOVE_BITE
.word 0x8483397		@MOVE_GROWL
.word 0x84833dc		@MOVE_ROAR
.word 0x8483426		@MOVE_SING
.word 0x848346c		@MOVE_SUPERSONIC
.word 0x84834a8		@MOVE_SONICBOOM
.word 0x84834ed		@MOVE_DISABLE
.word 0x8483534		@MOVE_ACID
.word 0x8483580		@MOVE_EMBER
.word 0x84835c2		@MOVE_FLAMETHROWER
.word 0x8483606		@MOVE_MIST
.word 0x848364b		@MOVE_WATERGUN
.word 0x8483693		@MOVE_HYDROPUMP
.word 0x84836d6		@MOVE_SURF
.word DESC_ICEBEAM
.word DESC_BLIZZARD
.word 0x84837a1		@MOVE_PSYBEAM
.word 0x84837e3		@MOVE_BUBBLEBEAM
.word 0x848382a		@MOVE_AURORABEAM
.word 0x848386d		@MOVE_HYPERBEAM
.word 0x84838b3		@MOVE_PECK
.word 0x84838ea		@MOVE_DRILLPECK
.word 0x8483927		@MOVE_SUBMISSION
.word 0x848396e		@MOVE_LOWKICK
.word 0x84839ae		@MOVE_COUNTER
.word 0x84839f8		@MOVE_SEISMICTOSS
.word 0x8483a3a		@MOVE_STRENGTH
.word 0x8483a82		@MOVE_ABSORB
.word 0x8483ac5		@MOVE_MEGADRAIN
.word 0x8483b0c		@MOVE_LEECHSEED
.word DESC_GROWTH
.word 0x8483b94		@MOVE_RAZORLEAF
.word 0x8483bda		@MOVE_SOLARBEAM
.word 0x8483c22		@MOVE_POISONPOWDER
.word 0x8483c5d		@MOVE_STUNSPORE
.word 0x8483c9b		@MOVE_SLEEPPOWDER
.word 0x8483cdb		@MOVE_PETALDANCE
.word 0x8483d24		@MOVE_STRINGSHOT
.word 0x8483d6b		@MOVE_DRAGONRAGE
.word 0x8483db0		@MOVE_FIRESPIN
.word 0x8483dfe		@MOVE_THUNDERSHOCK
.word 0x8483e3e		@MOVE_THUNDERBOLT
.word 0x8483e80		@MOVE_THUNDERWAVE
.word 0x8483ec2		@MOVE_THUNDER
.word 0x8483f03		@MOVE_ROCKTHROW
.word 0x8483f44		@MOVE_EARTHQUAKE
.word 0x8483f89		@MOVE_FISSURE
.word 0x8483fc7		@MOVE_DIG
.word 0x848400f		@MOVE_TOXIC
.word 0x8484058		@MOVE_CONFUSION
.word 0x8484098		@MOVE_PSYCHIC
.word 0x84840df		@MOVE_HYPNOSIS
.word 0x8484123		@MOVE_MEDITATE
.word 0x8484165		@MOVE_AGILITY
.word 0x84841a8		@MOVE_QUICKATTACK
.word 0x84841e9		@MOVE_RAGE
.word 0x848422e		@MOVE_TELEPORT
.word 0x8484278		@MOVE_NIGHTSHADE
.word 0x84842c0		@MOVE_MIMIC
.word 0x848430a		@MOVE_SCREECH
.word 0x8484353		@MOVE_DOUBLETEAM
.word 0x8484398		@MOVE_RECOVER
.word 0x84843e5		@MOVE_HARDEN
.word 0x848442e		@MOVE_MINIMIZE
.word 0x8484476		@MOVE_SMOKESCREEN
.word 0x84844b5		@MOVE_CONFUSERAY
.word 0x84844f3		@MOVE_WITHDRAW
.word 0x848453c		@MOVE_DEFENSECURL
.word 0x8484580		@MOVE_BARRIER
.word 0x84845c5		@MOVE_LIGHTSCREEN
.word 0x8484606		@MOVE_HAZE
.word 0x8484647		@MOVE_REFLECT
.word 0x8484689		@MOVE_FOCUSENERGY
.word 0x84846d3		@MOVE_BIDE
.word 0x8484715		@MOVE_METRONOME
.word 0x848475e		@MOVE_MIRRORMOVE
.word 0x84847a2		@MOVE_SELFDESTRUCT
.word 0x84847e8		@MOVE_EGGBOMB
.word 0x848482d		@MOVE_LICK
.word 0x8484871		@MOVE_SMOG
.word 0x84848b5		@MOVE_SLUDGE
.word 0x84848f2		@MOVE_BONECLUB
.word 0x848493b		@MOVE_FIREBLAST
.word 0x8484986		@MOVE_WATERFALL
.word 0x84849ca		@MOVE_CLAMP
.word 0x8484a15		@MOVE_SWIFT
.word 0x8484a57		@MOVE_SKULLBASH
.word 0x8484aa2		@MOVE_SPIKECANNON
.word 0x8484ae1		@MOVE_CONSTRICT
.word 0x8484b27		@MOVE_AMNESIA
.word 0x8484b5b		@MOVE_KINESIS
.word 0x8484ba1		@MOVE_SOFTBOILED
.word 0x8484beb		@MOVE_HIGHJUMPKICK
.word 0x8484c27		@MOVE_GLARE
.word 0x8484c75		@MOVE_DREAMEATER
.word 0x8484cbb		@MOVE_POISONGAS
.word 0x8484d01		@MOVE_BARRAGE
.word 0x8484d42		@MOVE_LEECHLIFE
.word 0x8484d85		@MOVE_LOVELYKISS
.word 0x8484dcd		@MOVE_SKYATTACK
.word 0x8484e18		@MOVE_TRANSFORM
.word 0x8484e60		@MOVE_BUBBLE
.word 0x8484ea4		@MOVE_DIZZYPUNCH
.word 0x8484ee5		@MOVE_SPORE
.word 0x8484f20		@MOVE_FLASH
.word 0x8484f6a		@MOVE_PSYWAVE
.word 0x8484fb5		@MOVE_SPLASH
.word 0x8484ff8		@MOVE_ACIDARMOR
.word 0x848503f		@MOVE_CRABHAMMER
.word 0x848508b		@MOVE_EXPLOSION
.word 0x84850d4		@MOVE_FURYSWIPES
.word 0x8485114		@MOVE_BONEMERANG
.word 0x848515e		@MOVE_REST
.word 0x84851ad		@MOVE_ROCKSLIDE
.word 0x84851ef		@MOVE_HYPERFANG
.word 0x8485231		@MOVE_SHARPEN
.word 0x8485277		@MOVE_CONVERSION
.word DESC_TRIATTACK
.word 0x8485301		@MOVE_SUPERFANG
.word 0x848533c		@MOVE_SLASH
.word 0x8485382		@MOVE_SUBSTITUTE
.word 0x84853be		@MOVE_STRUGGLE
.word 0x8485405		@MOVE_SKETCH
.word 0x8485446		@MOVE_TRIPLEKICK
.word 0x848548b		@MOVE_THIEF
.word 0x84854d6		@MOVE_SPIDERWEB
.word 0x848551d		@MOVE_MINDREADER
.word 0x8485560		@MOVE_NIGHTMARE
.word 0x84855aa		@MOVE_FLAMEWHEEL
.word 0x84855e9		@MOVE_SNORE
.word 0x848562f		@MOVE_CURSE
.word 0x8485679		@MOVE_FLAIL
.word 0x84856c1		@MOVE_CONVERSION2
.word 0x848570c		@MOVE_AEROBLAST
.word 0x8485752		@MOVE_COTTONSPORE
.word 0x8485798		@MOVE_REVERSAL
.word 0x84857df		@MOVE_SPITE
.word DESC_POWDERSNOW
.word 0x8485857		@MOVE_PROTECT
.word 0x84858a1		@MOVE_MACHPUNCH
.word 0x84858e2		@MOVE_SCARYFACE
.word 0x8485923		@MOVE_FEINTATTACK
.word 0x848596b		@MOVE_SWEETKISS
.word 0x84859ae		@MOVE_BELLYDRUM
.word 0x84859f2		@MOVE_SLUDGEBOMB
.word 0x8485a30		@MOVE_MUDSLAP
.word 0x8485a7a		@MOVE_OCTAZOOKA
.word 0x8485ac1		@MOVE_SPIKES
.word 0x8485b0c		@MOVE_ZAPCANNON
.word 0x8485b55		@MOVE_FORESIGHT
.word 0x8485b9c		@MOVE_DESTINYBOND
.word 0x8485bde		@MOVE_PERISHSONG
.word 0x8485c24		@MOVE_ICYWIND
.word 0x8485c66		@MOVE_DETECT
.word 0x8485cb0		@MOVE_BONERUSH
.word 0x8485cf0		@MOVE_LOCKON
.word 0x8485d30		@MOVE_OUTRAGE
.word 0x8485d77		@MOVE_SANDSTORM
.word 0x8485dc1		@MOVE_GIGADRAIN
.word 0x8485e09		@MOVE_ENDURE
.word 0x8485e55		@MOVE_CHARM
.word 0x8485ea0		@MOVE_ROLLOUT
.word 0x8485ee1		@MOVE_FALSESWIPE
.word 0x8485f24		@MOVE_SWAGGER
.word 0x8485f6c		@MOVE_MILKDRINK
.word 0x8485fb6		@MOVE_SPARK
.word 0x8485ff5		@MOVE_FURYCUTTER
.word 0x848602b		@MOVE_STEELWING
.word 0x8486075		@MOVE_MEANLOOK
.word 0x84860b7		@MOVE_ATTRACT
.word 0x8486105		@MOVE_SLEEPTALK
.word 0x8486145		@MOVE_HEALBELL
.word 0x8486187		@MOVE_RETURN
.word 0x84861d1		@MOVE_PRESENT
.word 0x848621b		@MOVE_FRUSTRATION
.word 0x8486265		@MOVE_SAFEGUARD
.word 0x84862ab		@MOVE_PAINSPLIT
.word 0x84862f3		@MOVE_SACREDFIRE
.word 0x8486330		@MOVE_MAGNITUDE
.word 0x8486378		@MOVE_DYNAMICPUNCH
.word 0x84863c7		@MOVE_MEGAHORN
.word 0x848640b		@MOVE_DRAGONBREATH
.word 0x8486455		@MOVE_BATONPASS
.word 0x848649f		@MOVE_ENCORE
.word 0x84864e8		@MOVE_PURSUIT
.word DESC_RAPIDSPIN
.word 0x8486579		@MOVE_SWEETSCENT
.word 0x84865bf		@MOVE_IRONTAIL
.word 0x8486606		@MOVE_METALCLAW
.word 0x8486651		@MOVE_VITALTHROW
.word 0x8486693		@MOVE_MORNINGSUN
.word 0x84866de		@MOVE_SYNTHESIS
.word 0x8486729		@MOVE_MOONLIGHT
.word 0x8486774		@MOVE_HIDDENPOWER
.word 0x84867b7		@MOVE_CROSSCHOP
.word 0x84867fb		@MOVE_TWISTER
.word 0x848683a		@MOVE_RAINDANCE
.word 0x848687c		@MOVE_SUNNYDAY
.word 0x84868b8		@MOVE_CRUNCH
.word 0x84868fe		@MOVE_MIRRORCOAT
.word 0x8486941		@MOVE_PSYCHUP
.word 0x848698a		@MOVE_EXTREMESPEED
.word 0x84869cf		@MOVE_ANCIENTPOWER
.word 0x8486a1b		@MOVE_SHADOWBALL
.word 0x8486a62		@MOVE_FUTURESIGHT
.word 0x8486aa6		@MOVE_ROCKSMASH
.word 0x8486aef		@MOVE_WHIRLPOOL
.word 0x8486b36		@MOVE_BEATUP
.word 0x8486b7e		@MOVE_FAKEOUT
.word 0x8486bc7		@MOVE_UPROAR
.word 0x8486c10		@MOVE_STOCKPILE
.word 0x8486c55		@MOVE_SPITUP
.word 0x8486c95		@MOVE_SWALLOW
.word 0x8486cd4		@MOVE_HEATWAVE
.word 0x8486d1c		@MOVE_HAIL
.word 0x8486d64		@MOVE_TORMENT
.word 0x8486db1		@MOVE_FLATTER
.word 0x8486df2		@MOVE_WILLOWISP
.word 0x8486e37		@MOVE_MEMENTO
.word 0x8486e79		@MOVE_FACADE
.word 0x8486ebe		@MOVE_FOCUSPUNCH
.word 0x8486f04		@MOVE_SMELLINGSALTS
.word 0x8486f50		@MOVE_FOLLOWME
.word 0x8486f96		@MOVE_NATUREPOWER
.word 0x8486fd4		@MOVE_CHARGE
.word 0x8487014		@MOVE_TAUNT
.word 0x848705c		@MOVE_HELPINGHAND
.word 0x848709b		@MOVE_TRICK
.word 0x84870dd		@MOVE_ROLEPLAY
.word 0x848711e		@MOVE_WISH
.word 0x8487163		@MOVE_ASSIST
.word 0x84871a1		@MOVE_INGRAIN
.word 0x84871e9		@MOVE_SUPERPOWER
.word 0x8487234		@MOVE_MAGICCOAT
.word 0x8487276		@MOVE_RECYCLE
.word 0x84872aa		@MOVE_REVENGE
.word 0x84872f2		@MOVE_BRICKBREAK
.word 0x8487338		@MOVE_YAWN
.word 0x8487378		@MOVE_KNOCKOFF
.word 0x84873be		@MOVE_ENDEAVOR
.word 0x84873fb		@MOVE_ERUPTION
.word 0x848743c		@MOVE_SKILLSWAP
.word 0x848747f		@MOVE_IMPRISON
.word 0x84874c1		@MOVE_REFRESH
.word 0x848750d		@MOVE_GRUDGE
.word 0x8487558		@MOVE_SNATCH
.word 0x848759a		@MOVE_SECRETPOWER
.word 0x84875e5		@MOVE_DIVE
.word 0x8487628		@MOVE_ARMTHRUST
.word 0x848766b		@MOVE_CAMOUFLAGE
.word 0x84876a7		@MOVE_TAILGLOW
.word 0x84876e6		@MOVE_LUSTERPURGE
.word 0x848772d		@MOVE_MISTBALL
.word 0x8487771		@MOVE_FEATHERDANCE
.word 0x84877bb		@MOVE_TEETERDANCE
.word 0x84877f3		@MOVE_BLAZEKICK
.word 0x848783a		@MOVE_MUDSPORT
.word 0x848787a		@MOVE_ICEBALL
.word 0x84878bc		@MOVE_NEEDLEARM
.word 0x84878f5		@MOVE_SLACKOFF
.word 0x8487932		@MOVE_HYPERVOICE
.word 0x8487976		@MOVE_POISONFANG
.word 0x84879bc		@MOVE_CRUSHCLAW
.word 0x8487a07		@MOVE_BLASTBURN
.word 0x8487a53		@MOVE_HYDROCANNON
.word 0x8487a9e		@MOVE_METEORMASH
.word 0x8487aeb		@MOVE_ASTONISH
.word 0x8487b2f		@MOVE_WEATHERBALL
.word 0x8487b71		@MOVE_AROMATHERAPY
.word 0x8487bbf		@MOVE_FAKETEARS
.word 0x8487bff		@MOVE_AIRCUTTER
.word 0x8487c46		@MOVE_OVERHEAT
.word 0x8487c8b		@MOVE_ODORSLEUTH
.word 0x8487cd2		@MOVE_ROCKTOMB
.word 0x8487d1d		@MOVE_SILVERWIND
.word 0x8487d68		@MOVE_METALSOUND
.word 0x8487db0		@MOVE_GRASSWHISTLE
.word 0x8487def		@MOVE_TICKLE
.word 0x8487e30		@MOVE_COSMICPOWER
.word 0x8487e72		@MOVE_WATERSPOUT
.word 0x8487eb3		@MOVE_SIGNALBEAM
.word 0x8487ef6		@MOVE_SHADOWPUNCH
.word 0x8487f35		@MOVE_EXTRASENSORY
.word 0x8487f76		@MOVE_SKYUPPERCUT
.word 0x8487fb4		@MOVE_SANDTOMB
.word 0x8487ff9		@MOVE_SHEERCOLD
.word 0x8488041		@MOVE_MUDDYWATER
.word 0x848808a		@MOVE_BULLETSEED
.word 0x84880d0		@MOVE_AERIALACE
.word 0x8488111		@MOVE_ICICLESPEAR
.word 0x8488153		@MOVE_IRONDEFENSE
.word 0x848819a		@MOVE_BLOCK
.word DESC_HOWL
.word 0x848821f		@MOVE_DRAGONCLAW
.word 0x8488266		@MOVE_FRENZYPLANT
.word 0x84882b4		@MOVE_BULKUP
.word 0x84882fb		@MOVE_BOUNCE
.word 0x8488341		@MOVE_MUDSHOT
.word 0x8488383		@MOVE_POISONTAIL
.word 0x84883c9		@MOVE_COVET
.word 0x8488408		@MOVE_VOLTTACKLE
.word 0x848844b		@MOVE_MAGICALLEAF
.word 0x848848a		@MOVE_WATERSPORT
.word 0x84884c5		@MOVE_CALMMIND
.word 0x8488507		@MOVE_LEAFBLADE
.word 0x848854f		@MOVE_DRAGONDANCE
.word 0x8488597		@MOVE_ROCKBLAST
.word 0x84885d3		@MOVE_SHOCKWAVE
.word 0x8488614		@MOVE_WATERPULSE
.word 0x848865a		@MOVE_DOOMDESIRE
.word 0x84886a1		@MOVE_PSYCHOBOOST

.word DESC_LEECHFANG
.word DESC_AIRSLASH
.word DESC_AQUAJET
.word DESC_AQUATAIL
.word DESC_AURASPHERE
.word DESC_AVALANCHE
.word DESC_BRAVEBIRD
.word DESC_BUGBUZZ
.word DESC_BULLETPUNCH
.word DESC_CHARGEBEAM
.word DESC_CLOSECOMBAT
.word DESC_CROSSPOISON
.word DESC_DARKPULSE
.word DESC_DISCHARGE
.word DESC_DRACOMETEOR
.word DESC_DRAGONPULSE
.word DESC_DRAINPUNCH
.word DESC_EARTHPOWER
.word DESC_ENERGYBALL
.word DESC_FOCUSBLAST
.word DESC_FORCEPALM
.word DESC_GIGAIMPACT
.word DESC_GRASSKNOT
.word DESC_GUNKSHOT
.word DESC_HAMMERARM
.word DESC_HEADSMASH
.word DESC_ICESHARD
.word DESC_IRONHEAD
.word DESC_LAVAPLUME
.word DESC_MAGNETBOMB
.word DESC_MUDBOMB
.word DESC_NASTYPLOT
.word DESC_NIGHTSLASH
.word DESC_OMINOUSWIND
.word DESC_POWERGEM
.word DESC_POWERWHIP
.word DESC_PSYCHOCUT
.word DESC_ROCKCLIMB
.word DESC_ROCKPOLISH
.word DESC_ROCKWRECKER
.word DESC_ROOST
.word DESC_SEEDBOMB
.word DESC_SHADOWCLAW
.word DESC_SHADOWSNEAK
.word DESC_VACUUMWAVE
.word DESC_XSCISSOR
.word DESC_ZENHEADBUTT
.word DESC_SWITCHEROO
.word DESC_DRILLRUN
.word DESC_BULLDOZE
.word DESC_ELECTROWEB
.word DESC_FLAMECHARGE
.word DESC_FROSTBREATH
.word DESC_HEARTSTAMP
.word DESC_HONECLAWS
.word DESC_HORNLEECH
.word DESC_COIL
.word DESC_HURRICANE
.word DESC_ICICLECRASH
.word DESC_WORKUP
.word DESC_QUIVERDANCE
.word DESC_LEAFTORNADO
.word DESC_LOWSWEEP
.word DESC_SNARL
.word DESC_STRUGGLEBUG
.word DESC_STEAMROLLER
.word DESC_STORMTHROW
.word DESC_VENOSHOCK
.word DESC_WILDCHARGE
.word DESC_POISONJAB
.word DESC_ACIDSPRAY
.word DESC_FIERYDANCE
.word DESC_CLEARSMOG
.word DESC_LEAFSTORM
.word DESC_STONEEDGE
.word DESC_PAYBACK
.word DESC_FIREFANG
.word DESC_ICEFANG
.word DESC_THUNDERFANG
.word DESC_FLAREBLITZ
.word DESC_INFERNO
.word DESC_HEX
.word DESC_DUALCHOP
.word DESC_DOUBLEHIT
.word DESC_COTTONGUARD
.word DESC_ACROBATICS
.word DESC_FLAMEBURST
.word DESC_UTURN
.word DESC_VOLTSWITCH
.word DESC_DRAGONTAIL
.word DESC_CIRCLETHROW
.word DESC_MIRRORSHOT
.word DESC_WOODHAMMER
.word DESC_HEALPULSE
.word DESC_FLASHCANNON
.word DESC_BUGBITE
.word DESC_PLUCK
.word DESC_SHELLSMASH
.word DESC_RAGEPOWDER
.word DESC_WAKEUPSLAP
.word DESC_RAZORSHELL
.word DESC_COPYCAT
.word DESC_MIRACLEEYE
.word DESC_SUCKERPUNCH
.word DESC_SCALD
.word DESC_BRINE
.word DESC_FAIRYWIND
.word DESC_BABYDOLLEYES
.word DESC_PLAYROUGH
.word DESC_MOONBLAST
.word DESC_DRAININGKISS
.word DESC_DAZZLINGGLEAM
.word DESC_DISARMINGVOICE
.word DESC_STEALTHROCK
.word DESC_TOXICSPIKES
.word DESC_HEALINGWISH
.word DESC_LUNARDANCE
.word DESC_TAILWIND
.word DESC_BOOMBURST
.word DESC_INCINERATE
.word DESC_WORRYSEED
.word DESC_GASTROACID
.word DESC_GEOMANCY
.word DESC_FLOWERSHIELD
.word DESC_ROTOTILLER
.word DESC_SHIFTGEAR
.word DESC_STICKYWEB
.word DESC_STOREDPOWER
.word DESC_ACUPRESSURE
.word DESC_PUNISHMENT
.word DESC_ASSURANCE
.word DESC_DRAGONRUSH
.word DESC_DARKVOID
.word DESC_FEINT
.word DESC_PHANTOMFORCE
.word DESC_PETALBLIZZARD
.word DESC_PLAYNICE
.word DESC_ROAROFTIME
.word DESC_SPACIALREND
.word DESC_MAGMASTORM
.word DESC_FINALGAMBIT
.word DESC_SHADOWFORCE
.word DESC_NUZZLE
.word DESC_RETALIATE
.word DESC_STEELYHIT
.word DESC_JUDGMENT
.word DESC_FREEZEDRY
.word DESC_PSYSHOCK
.word DESC_ROUND
.word DESC_TAILSLAP
.word DESC_GEARGRIND
.word DESC_NATURALGIFT
.word DESC_CHIPAWAY
.word DESC_SMACKDOWN
.word DESC_HYPERSPACEHOLE
.word DESC_GYROBALL
.word DESC_HYPERSPACEFURY
.word DESC_ATTACKORDER
.word DESC_DEFENDORDER
.word DESC_HEALORDER
.word DESC_CAPTIVATE
.word DESC_DEFOG
.word DESC_ORIGINPULSE
.word DESC_PRECIPICEBLADES
.word DESC_GUARDSWAP
.word DESC_STEAMERUPTION
.word DESC_METALBURST
.word DESC_MEFIRST
.word DESC_POWERSWAP
.word DESC_POWERTRICK
.word DESC_PSYCHOSHIFT
.word DESC_WRINGOUT
.word DESC_KINGSSHIELD
.word DESC_PSYSTRIKE
.word DESC_AUTOTOMIZE
.word DESC_DIAMONDSTORM
.word DESC_SLUDGEWAVE
.word DESC_HEAVYSLAM
.word DESC_SYNCHRONOISE
.word DESC_ELECTROBALL
.word DESC_FOULPLAY
.word DESC_ENTRAINMENT
.word DESC_NIGHTDAZE
.word DESC_ECHOEDVOICE
.word DESC_LANDSWRATH
.word DESC_OBLIVIONWING
.word DESC_HEARTSWAP
.word DESC_CRUSHGRIP
.word DESC_SACREDSWORD
.word DESC_HEATCRASH
.word DESC_HEADCHARGE
.word DESC_TECHNOBLAST
.word DESC_RELICSONG
.word DESC_SECRETSWORD
.word DESC_GLACIATE
.word DESC_BOLTSTRIKE
.word DESC_BLUEFLARE
.word DESC_FREEZESHOCK
.word DESC_ICEBURN
.word DESC_VCREATE
.word DESC_FUSIONFLARE
.word DESC_FUSIONBOLT
.word DESC_FELLSTINGER
.word DESC_NOBLEROAR
.word DESC_DRAGONASCENT
.word DESC_PARTINGSHOT
.word DESC_TOPSYTURVY
.word DESC_COREENFORCER
.word DESC_CHATTER
.word DESC_CONFIDE
.word DESC_WATERSHURIKEN
.word DESC_MYSTICALFIRE
.word DESC_SPIKYSHIELD
.word DESC_EERIEIMPULSE
.word DESC_HOLDBACK
.word DESC_INFESTATION
.word DESC_POWERUPPUNCH
.word DESC_THOUSANDARROWS
.word DESC_THOUSANDWAVES
.word DESC_PARABOLICCHARGE
.word DESC_SEARINGSHOT
.word DESC_SEEDFLARE
.word DESC_ACCELEROCK
.word DESC_ANCHORSHOT
.word DESC_AURORAVEIL
.word DESC_BANEFULBUNKER
.word DESC_BEAKBLAST
.word DESC_BRUTALSWING
.word DESC_BURNUP
.word DESC_CLANGINGSCALES
.word DESC_DARKESTLARIAT
.word DESC_DRAGONHAMMER
.word DESC_FIRELASH
.word DESC_FIRSTIMPRESSION
.word DESC_FLEURCANNON
.word DESC_FLORALHEALING
.word DESC_GEARUP
.word DESC_HIGHHORSEPOWER
.word DESC_ICEHAMMER
.word DESC_LASERFOCUS
.word DESC_LEAFAGE
.word DESC_LIQUIDATION
.word DESC_LUNGE
.word DESC_MOONGEISTBEAM
.word DESC_MULTIATTACK
.word DESC_NATURESMADNESS
.word DESC_POLLENPUFF
.word DESC_POWERTRIP
.word DESC_PRISMATICLASER
.word DESC_PSYCHICFANGS
.word DESC_PURIFY
.word DESC_REVELATIONDANCE
.word DESC_SHADOWBONE
.word DESC_SHELLTRAP
.word DESC_SHOREUP
.word DESC_SMARTSTRIKE
.word DESC_SOLARBLADE
.word DESC_SPARKLINGARIA
.word DESC_SPECTRALTHIEF
.word DESC_SPEEDSWAP
.word DESC_SPIRITSHACKLE
.word DESC_SPOTLIGHT
.word DESC_STOMPINGTANTRUM
.word DESC_STRENGTHSAP
.word DESC_SUNSTEELSTRIKE
.word DESC_TEARFULLOOK
.word DESC_THROATCHOP
.word DESC_TOXICTHREAD
.word DESC_TROPKICK
.word DESC_ZINGZAP
.word DESC_ELECTRICTERRAIN
.word DESC_GRASSYTERRAIN
.word DESC_MISTYTERRAIN
.word DESC_PSYCHICTERRAIN
.word DESC_GRASSPLEDGE
.word DESC_FIREPLEDGE
.word DESC_WATERPLEDGE
.word DESC_TRICKROOM
.word DESC_MAGICROOM
.word DESC_WONDERROOM
.word DESC_CRAFTYSHIELD
.word DESC_MATBLOCK
.word DESC_QUICKGUARD
.word DESC_WIDEGUARD
.word DESC_AQUARING
.word DESC_AROMATICMIST
.word DESC_BELCH
.word DESC_BESTOW
.word DESC_FLING
.word DESC_FLYINGPRESS
.word DESC_GRAVITY
.word DESC_GUARDSPLIT
.word DESC_HEALBLOCK
.word DESC_IONDELUGE
.word DESC_LUCKYCHANT
.word DESC_MAGNETRISE
.word DESC_MAGNETICFLUX
.word DESC_POWDER
.word DESC_POWERSPLIT
.word DESC_REFLECTTYPE
.word DESC_SIMPLEBEAM
.word DESC_SOAK
.word DESC_TELEKINESIS
.word DESC_TRICKORTREAT
.word DESC_VENOMDRENCH
.word DESC_FORESTSCURSE
.word DESC_MINDBLOWN
.word DESC_PHOTONGEYSER
.word DESC_PLASMAFISTS
.word DESC_ELECTRIFY
.word DESC_EMBARGO
.word DESC_FAIRYLOCK
.word DESC_LIGHTOFRUIN
.word DESC_TRUMPCARD
.word DESC_AFTERYOU
.word DESC_INSTRUCT
.word DESC_QUASH
.word DESC_HAPPYHOUR
.word DESC_DOUBLEIRONBASH
.word DESC_LASTRESORT
.word DESC_SKYDROP
.word DESC_CELEBRATE
.word DESC_HOLDHANDS
.word DESC_DYNAMAX_CANNON
.word DESC_SNIPE_SHOT
.word DESC_JAW_LOCK
.word DESC_STUFF_CHEEKS
.word DESC_NO_RETREAT
.word DESC_TAR_SHOT
.word DESC_MAGIC_POWDER
.word DESC_DRAGON_DARTS
.word DESC_TEATIME
.word DESC_OCTOLOCK
.word DESC_BOLT_BEAK
.word DESC_FISHIOUS_REND
.word DESC_COURT_CHANGE
.word DESC_CLANGOROUS_SOUL
.word DESC_BODY_PRESS
.word DESC_DECORATE
.word DESC_DRUM_BEATING
.word DESC_SNAP_TRAP
.word DESC_PYRO_BALL
.word DESC_BEHEMOTH_BLADE
.word DESC_BEHEMOTH_BASH
.word DESC_AURA_WHEEL
.word DESC_BREAKING_SWIPE
.word DESC_BRANCH_POKE
.word DESC_OVERDRIVE
.word DESC_APPLE_ACID
.word DESC_GRAV_APPLE
.word DESC_SPIRIT_BREAK
.word DESC_STRANGE_STEAM
.word DESC_LIFE_DEW
.word DESC_OBSTRUCT
.word DESC_FALSE_SURRENDER
.word DESC_METEOR_ASSAULT
.word DESC_ETERNABEAM
.word DESC_STEEL_BEAM
.word DESC_EXPANDING_FORCE
.word DESC_STEEL_ROLLER
.word DESC_SCALE_SHOT
.word DESC_METEOR_BEAM
.word DESC_SHELL_SIDE_ARM
.word DESC_MISTY_EXPLOSION
.word DESC_GRASSY_GLIDE
.word DESC_RISING_VOLTAGE
.word DESC_TERRAIN_PULSE
.word DESC_SKITTER_SMACK
.word DESC_BURNING_JEALOUSY
.word DESC_LASH_OUT
.word DESC_POLTERGEIST
.word DESC_CORROSIVE_GAS
.word DESC_COACHING
.word DESC_FLIP_TURN
.word DESC_TRIPLE_AXEL
.word DESC_DUAL_WINGBEAT
.word DESC_SCORCHING_SANDS
.word DESC_JUNGLE_HEALING
.word DESC_WICKED_BLOW
.word DESC_SURGING_STRIKES
.word DESC_FREEZING_GLARE
.word DESC_THUNDEROUS_KICK
.word DESC_FIERY_WRATH
.word DESC_EERIE_SPELL
.word DESC_THUNDER_CAGE
.word DESC_DRAGON_ENERGY
.word DESC_ASTRAL_BARRAGE
.word DESC_GLACIAL_LANCE
.word DESC_DIRE_CLAW
.word DESC_PSYSHIELD_BASH
.word DESC_POWER_SHIFT
.word DESC_STONE_AXE
.word DESC_MYSTICAL_POWER
.word DESC_RAGING_FURY
.word DESC_WAVE_CRASH
.word DESC_CHLOROBLAST
.word DESC_MOUNTAIN_GALE
.word DESC_VICTORY_DANCE
.word DESC_HEADLONG_RUSH
.word DESC_BARB_BARRAGE
.word DESC_ESPER_WING
.word DESC_BITTER_MALICE
.word DESC_SHELTER
.word DESC_TRIPLE_ARROWS
.word DESC_INFERNAL_PARADE
.word DESC_CEASELESS_EDGE
.word DESC_BLEAKWIND_STORM
.word DESC_WILDBOLT_STORM
.word DESC_SANDSEAR_STORM
.word DESC_SPRINGTIDE_STORM
.word DESC_LUNAR_BLESSING
.word DESC_TAKE_HEART
.word DESC_BLANK	@MOVE_BREAKNECK_BLITZ_P
.word DESC_BLANK	@MOVE_BREAKNECK_BLITZ_S
.word DESC_BLANK	@MOVE_ALL_OUT_PUMMELING_P
.word DESC_BLANK	@MOVE_ALL_OUT_PUMMELING_S
.word DESC_BLANK	@MOVE_SUPERSONIC_SKYSTRIKE_P
.word DESC_BLANK	@MOVE_SUPERSONIC_SKYSTRIKE_S
.word DESC_BLANK	@MOVE_ACID_DOWNPOUR_P
.word DESC_BLANK	@MOVE_ACID_DOWNPOUR_S
.word DESC_BLANK	@MOVE_TECTONIC_RAGE_P
.word DESC_BLANK	@MOVE_TECTONIC_RAGE_S
.word DESC_BLANK	@MOVE_CONTINENTAL_CRUSH_P
.word DESC_BLANK	@MOVE_CONTINENTAL_CRUSH_S
.word DESC_BLANK	@MOVE_SAVAGE_SPIN_OUT_P
.word DESC_BLANK	@MOVE_SAVAGE_SPIN_OUT_S
.word DESC_BLANK	@MOVE_NEVER_ENDING_NIGHTMARE_P
.word DESC_BLANK	@MOVE_NEVER_ENDING_NIGHTMARE_S
.word DESC_BLANK	@MOVE_CORKSCREW_CRASH_P
.word DESC_BLANK	@MOVE_CORKSCREW_CRASH_S
.word DESC_BLANK	@MOVE_INFERNO_OVERDRIVE_P
.word DESC_BLANK	@MOVE_INFERNO_OVERDRIVE_S
.word DESC_BLANK	@MOVE_HYDRO_VORTEX_P
.word DESC_BLANK	@MOVE_HYDRO_VORTEX_S
.word DESC_BLANK	@MOVE_BLOOM_DOOM_P
.word DESC_BLANK	@MOVE_BLOOM_DOOM_S
.word DESC_BLANK	@MOVE_GIGAVOLT_HAVOC_P
.word DESC_BLANK	@MOVE_GIGAVOLT_HAVOC_S
.word DESC_BLANK	@MOVE_SHATTERED_PSYCHE_P
.word DESC_BLANK	@MOVE_SHATTERED_PSYCHE_S
.word DESC_BLANK	@MOVE_SUBZERO_SLAMMER_P
.word DESC_BLANK	@MOVE_SUBZERO_SLAMMER_S
.word DESC_BLANK	@MOVE_DEVASTATING_DRAKE_P
.word DESC_BLANK	@MOVE_DEVASTATING_DRAKE_S
.word DESC_BLANK	@MOVE_BLACK_HOLE_ECLIPSE_P
.word DESC_BLANK	@MOVE_BLACK_HOLE_ECLIPSE_S
.word DESC_BLANK	@MOVE_TWINKLE_TACKLE_P
.word DESC_BLANK	@MOVE_TWINKLE_TACKLE_S
.word DESC_BLANK	@MOVE_CATASTROPIKA
.word DESC_BLANK	@MOVE_10000000_VOLT_THUNDERBOLT
.word DESC_BLANK	@MOVE_STOKED_SPARKSURFER
.word DESC_BLANK	@MOVE_EXTREME_EVOBOOST
.word DESC_BLANK	@MOVE_PULVERIZING_PANCAKE
.word DESC_BLANK	@MOVE_GENESIS_SUPERNOVA
.word DESC_BLANK	@MOVE_SINISTER_ARROW_RAID
.word DESC_BLANK	@MOVE_MALICIOUS_MOONSAULT
.word DESC_BLANK	@MOVE_OCEANIC_OPERETTA
.word DESC_BLANK	@MOVE_SPLINTERED_STORMSHARDS
.word DESC_BLANK	@MOVE_LETS_SNUGGLE_FOREVER
.word DESC_BLANK	@MOVE_CLANGOROUS_SOULBLAZE
.word DESC_BLANK	@MOVE_GUARDIAN_OF_ALOLA
.word DESC_BLANK	@MOVE_SEARING_SUNRAZE_SMASH
.word DESC_BLANK	@MOVE_MENACING_MOONRAZE_MAELSTROM
.word DESC_BLANK	@MOVE_LIGHT_THAT_BURNS_THE_SKY
.word DESC_BLANK	@MOVE_SOUL_STEALING_7_STAR_STRIKE
.word DESC_MAX_GUARD
.word DESC_MAX_STRIKE
.word DESC_MAX_STRIKE
.word DESC_MAX_KNUCKLE
.word DESC_MAX_KNUCKLE
.word DESC_MAX_AIRSTREAM
.word DESC_MAX_AIRSTREAM
.word DESC_MAX_OOZE
.word DESC_MAX_OOZE
.word DESC_MAX_QUAKE
.word DESC_MAX_QUAKE
.word DESC_MAX_ROCKFALL
.word DESC_MAX_ROCKFALL
.word DESC_MAX_FLUTTERBY
.word DESC_MAX_FLUTTERBY
.word DESC_MAX_PHANTASM
.word DESC_MAX_PHANTASM
.word DESC_MAX_STEELSPIKE
.word DESC_MAX_STEELSPIKE
.word DESC_MAX_FLARE
.word DESC_MAX_FLARE
.word DESC_MAX_GEYSER
.word DESC_MAX_GEYSER
.word DESC_MAX_OVERGROWTH
.word DESC_MAX_OVERGROWTH
.word DESC_MAX_LIGHTNING
.word DESC_MAX_LIGHTNING
.word DESC_MAX_MINDSTORM
.word DESC_MAX_MINDSTORM
.word DESC_MAX_HAILSTORM
.word DESC_MAX_HAILSTORM
.word DESC_MAX_WYRMWIND
.word DESC_MAX_WYRMWIND
.word DESC_MAX_DARKNESS
.word DESC_MAX_DARKNESS
.word DESC_MAX_STARFALL
.word DESC_MAX_STARFALL
.word DESC_G_MAX_VINE_LASH
.word DESC_G_MAX_VINE_LASH
.word DESC_G_MAX_WILDFIRE
.word DESC_G_MAX_WILDFIRE
.word DESC_G_MAX_CANNONADE
.word DESC_G_MAX_CANNONADE
.word DESC_G_MAX_BEFUDDLE
.word DESC_G_MAX_BEFUDDLE
.word DESC_G_MAX_VOLTCRASH
.word DESC_G_MAX_VOLTCRASH
.word DESC_G_MAX_GOLDRUSH
.word DESC_G_MAX_GOLDRUSH
.word DESC_G_MAX_CHISTRIKE
.word DESC_G_MAX_CHISTRIKE
.word DESC_G_MAX_TERROR
.word DESC_G_MAX_TERROR
.word DESC_G_MAX_FOAMBURST
.word DESC_G_MAX_FOAMBURST
.word DESC_G_MAX_RESONANCE
.word DESC_G_MAX_RESONANCE
.word DESC_G_MAX_CUDDLE
.word DESC_G_MAX_CUDDLE
.word DESC_G_MAX_REPLENISH
.word DESC_G_MAX_REPLENISH
.word DESC_G_MAX_MALODOR
.word DESC_G_MAX_MALODOR
.word DESC_G_MAX_MELTDOWN
.word DESC_G_MAX_MELTDOWN
.word DESC_G_MAX_DRUM_SOLO
.word DESC_G_MAX_DRUM_SOLO
.word DESC_G_MAX_FIREBALL
.word DESC_G_MAX_FIREBALL
.word DESC_G_MAX_HYDROSNIPE
.word DESC_G_MAX_HYDROSNIPE
.word DESC_G_MAX_WINDRAGE
.word DESC_G_MAX_WINDRAGE
.word DESC_G_MAX_GRAVITAS
.word DESC_G_MAX_GRAVITAS
.word DESC_G_MAX_STONESURGE
.word DESC_G_MAX_STONESURGE
.word DESC_G_MAX_VOLCALITH
.word DESC_G_MAX_VOLCALITH
.word DESC_G_MAX_TARTNESS
.word DESC_G_MAX_TARTNESS
.word DESC_G_MAX_SWEETNESS
.word DESC_G_MAX_SWEETNESS
.word DESC_G_MAX_SANDBLAST
.word DESC_G_MAX_SANDBLAST
.word DESC_G_MAX_STUNSHOCK
.word DESC_G_MAX_STUNSHOCK
.word DESC_G_MAX_CENTIFERNO
.word DESC_G_MAX_CENTIFERNO
.word DESC_G_MAX_SMITE
.word DESC_G_MAX_SMITE
.word DESC_G_MAX_SNOOZE
.word DESC_G_MAX_SNOOZE
.word DESC_G_MAX_FINALE
.word DESC_G_MAX_FINALE
.word DESC_G_MAX_STEELSURGE
.word DESC_G_MAX_STEELSURGE
.word DESC_G_MAX_DEPLETION
.word DESC_G_MAX_DEPLETION
.word DESC_G_MAX_ONE_BLOW
.word DESC_G_MAX_ONE_BLOW
.word DESC_G_MAX_RAPID_FLOW
.word DESC_G_MAX_RAPID_FLOW
.word DESC_AQUACUTTER
.word DESC_AQUASTEP
.word DESC_ARMORCANNON
.word DESC_AXEKICK
.word DESC_BITTERBLADE
.word DESC_BLAZINGTORQUE
.word DESC_CHILLINGWATER
.word DESC_CHILLYRECEPTION
.word DESC_COLLISIONCOURSE
.word DESC_COMBATTORQUE
.word DESC_COMEUPPANCE
.word DESC_DOODLE
.word DESC_DOUBLESHOCK
.word DESC_ELECTRODRIFT
.word DESC_FILLETAWAY
.word DESC_FLOWERTRICK
.word DESC_GIGATONHAMMER
.word DESC_GLAIVERUSH
.word DESC_HYDROSTEAM
.word DESC_HYPERDRILL
.word DESC_ICESPINNER
.word DESC_JETPUNCH
.word DESC_KOWTOWCLEAVE
.word DESC_LASTRESPECTS
.word DESC_LUMINACRASH
.word DESC_MAGICALTORQUE
.word DESC_MAKEITRAIN
.word DESC_MORTALSPIN
.word DESC_NOXIOUSTORQUE
.word DESC_ORDERUP
.word DESC_POPULATIONBOMB
.word DESC_POUNCE
.word DESC_PSYBLADE
.word DESC_RAGEFIST
.word DESC_RAGINGBULL
.word DESC_REVIVALBLESSING
.word DESC_RUINATION
.word DESC_SALTCURE
.word DESC_SHEDTAIL
.word DESC_SILKTRAP
.word DESC_SNOWSCAPE
.word DESC_SPICYEXTRACT
.word DESC_SPINOUT
.word DESC_TERABLAST
.word DESC_TIDYUP
.word DESC_TORCHSONG
.word DESC_TRAILBLAZE
.word DESC_TRIPLEDIVE
.word DESC_TWINBEAM
.word DESC_WICKEDTORQUE
.word DESC_BLOODMOON
.word DESC_UPPERHAND
.word DESC_MATCHAGOTCHA
.word DESC_SYRUPBOMB
.word DESC_IVYCUDGEL
.word DESC_ELECTROSHOT
.word DESC_TERASTARSTORM
.word DESC_FICKLEBEAM
.word DESC_BURNINGBULWARK
.word DESC_MIGHTYCLEAVE
.word DESC_TACHYONCUTTER
.word DESC_DRAGONCHEER
.word DESC_MALIGNANTCHAIN
.word DESC_THUNDERCLAP
.word DESC_HARDPRESS
.word DESC_ALLURINGVOICE
.word DESC_TEMPERFLARE
.word DESC_SUPERCELLSLAM
.word DESC_PSYCHICNOISE
