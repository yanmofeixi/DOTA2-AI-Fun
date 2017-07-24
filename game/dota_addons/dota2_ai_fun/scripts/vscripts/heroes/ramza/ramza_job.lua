RAMZA_JOB_SQUIRE = 1
RAMZA_JOB_CHEMIST = 2
RAMZA_JOB_KNIGHT = 3
RAMZA_JOB_ARCHER = 4
RAMZA_JOB_WHITE_MAGE = 5
RAMZA_JOB_BLACK_MAGE = 6
RAMZA_JOB_MONK = 7
RAMZA_JOB_THIEF = 8
RAMZA_JOB_MYSTIC = 9
RAMZA_JOB_TIME_MAGE = 10
RAMZA_JOB_ORATOR = 11
RAMZA_JOB_SUMMONER = 12
RAMZA_JOB_GEOMANCER = 13
RAMZA_JOB_DRAGOON = 14
RAMZA_JOB_SAMURAI = 15
RAMZA_JOB_NINJA = 16
RAMZA_JOB_ARITHMETICIAN = 17
RAMZA_JOB_MIME = 18
RAMZA_JOB_DARK_KNIGHT = 19
RAMZA_JOB_ONION_KNIGHT = 20



CRamzaJob = {}

CRamzaJob.tJobNames = {
	"RAMZA_JOB_SQUIRE",
	"RAMZA_JOB_CHEMIST",
	"RAMZA_JOB_KNIGHT",
	"RAMZA_JOB_ARCHER",
	"RAMZA_JOB_WHITE_MAGE",
	"RAMZA_JOB_BLACK_MAGE",
	"RAMZA_JOB_MONK",
	"RAMZA_JOB_THIEF",
	"RAMZA_JOB_MYSTIC",
	"RAMZA_JOB_TIME_MAGE",
	"RAMZA_JOB_ORATOR",
	"RAMZA_JOB_SUMMONER",
	"RAMZA_JOB_GEOMANCER",
	"RAMZA_JOB_DRAGOON",
	"RAMZA_JOB_SAMURAI",
	"RAMZA_JOB_NINJA",
	"RAMZA_JOB_ARITHMETICIAN",
	"RAMZA_JOB_MIME",
	"RAMZA_JOB_DARK_KNIGHT",
	"RAMZA_JOB_ONION_KNIGHT"
}

CRamzaJob.tRamzaJobReqirement = {0, 200, 400, 700, 1100, 1600, 2200, 3000, 4000}

CRamzaJob.tRamzaChangeJobRequirements = {
	{},
	{},
	{[RAMZA_JOB_SQUIRE] = 2},
	{[RAMZA_JOB_SQUIRE] = 2},
	{[RAMZA_JOB_CHEMIST] = 2},
	{[RAMZA_JOB_CHEMIST] = 2},
	{[RAMZA_JOB_KNIGHT] = 3},
	{[RAMZA_JOB_ARCHER] = 3},
	{[RAMZA_JOB_WHITE_MAGE] = 3},
	{[RAMZA_JOB_BLACK_MAGE] = 3},
	{[RAMZA_JOB_MYSTIC] = 3},
	{[RAMZA_JOB_TIME_MAGE] = 3},
	{[RAMZA_JOB_MONK] = 4},
	{[RAMZA_JOB_THIEF] = 4},
	{[RAMZA_JOB_KNIGHT] = 4, [RAMZA_JOB_MONK] = 5, [RAMZA_JOB_DRAGOON] = 2},
	{[RAMZA_JOB_ARCHER] = 4, [RAMZA_JOB_THIEF] = 5, [RAMZA_JOB_GEOMANCER] = 2},
	{[RAMZA_JOB_WHITE_MAGE] = 5, [RAMZA_JOB_BLACK_MAGE] = 5, [RAMZA_JOB_MYSTIC] = 4, [RAMZA_JOB_TIME_MAGE] = 4},
	{[RAMZA_JOB_SQUIRE] = 8, [RAMZA_JOB_CHEMIST] = 8, [RAMZA_JOB_ORATOR] = 5, [RAMZA_JOB_SUMMONER] = 5, [RAMZA_JOB_GEOMANCER] = 5, [RAMZA_JOB_DRAGOON] = 5},
	{[RAMZA_JOB_KNIGHT] = 9, [RAMZA_JOB_BLACK_MAGE] = 9, [RAMZA_JOB_SAMURAI] = 8, [RAMZA_JOB_NINJA] = 8, [RAMZA_JOB_GEOMANCER] = 8, [RAMZA_JOB_DRAGOON] = 8},
	{[RAMZA_JOB_SQUIRE] = 6, [RAMZA_JOB_CHEMIST] = 6}	
}

CRamzaJob.tJobLevelUnlocks = {}

function CRamzaJob:Initialize()
	for i = 1, 20 do
		for k, v in pairs(self.tRamzaChangeJobRequirements[i]) do
			self.tJobLevelUnlocks[k] = self.tJobLevelUnlocks[k] or {}
			self.tJobLevelUnlocks[k][v] = self.tJobLevelUnlocks[k][v] or {}
			table.insert(self.tJobLevelUnlocks[k][v], i)
		end
	end
end

CRamzaJob.tJobStats = {
	{	--Squire
		primary_attribute = DOTA_ATTRIBUTE_STRENGTH,
		base_str = 19,
		base_agi = 19,
		base_int = 19,
		gain_str = 2.5,
		gain_agi = 2.5,
		gain_int = 2.5,
		armor = 1,
		attack_range = 150,
		attack_cap = DOTA_UNIT_CAP_MELEE_ATTACK,
		attack_projectile = nil,
		attack_projectile_speed = nil,
		move_speed = 300,
	},
	{	--Chemist
		primary_attribute = DOTA_ATTRIBUTE_INTELLECT,
		base_str = 15,
		base_agi = 17,
		base_int = 23,
		gain_str = 2.2,
		gain_agi = 1.7,
		gain_int = 2.7,
		armor = 0,
		attack_range = 600,
		attack_cap = DOTA_UNIT_CAP_MELEE_ATTACK,
		attack_projectile = nil,
		attack_projectile_speed = nil,
		move_speed = 280,
	},
	{	--Knight
		primary_attribute = DOTA_ATTRIBUTE_STRENGTH,
		base_str = 27,
		base_agi = 16,
		base_int = 12,
		gain_str = 3.4,
		gain_agi = 2.1,
		gain_int = 1.1,
		armor = 0,
		attack_range = 150,
		attack_cap = DOTA_UNIT_CAP_MELEE_ATTACK,
		attack_projectile = nil,
		attack_projectile_speed = nil,
		move_speed = 300,
	},
	{	--Archer
		primary_attribute = DOTA_ATTRIBUTE_AGILITY,
		base_str = 11,
		base_agi = 30,
		base_int = 14,
		gain_str = 1.5,
		gain_agi = 3.6,
		gain_int = 1.5,
		armor = 0,
		attack_range = 625,
		attack_cap = DOTA_UNIT_CAP_RANGED_ATTACK,
		attack_projectile = "particles/units/heroes/hero_clinkz/clinkz_base_attack.vpcf",
		move_speed = 310,
	},
	{	-- White Mage
		primary_attribute = DOTA_ATTRIBUTE_INTELLECT,
		base_str = 11,
		base_agi = 11,
		base_int = 33,
		gain_str = 1.6,
		gain_agi = 1.3,
		gain_int = 3.7,
		armor = 1,
		attack_range = 550,
		attack_cap = DOTA_UNIT_CAP_RANGED_ATTACK,
		attack_projectile = "particles/units/heroes/hero_keeper_of_the_light/keeper_base_attack.vpcf",
		move_speed = 290,
	},
	{	-- Black Mage
		primary_attribute = DOTA_ATTRIBUTE_INTELLECT,
		base_str = 13,
		base_agi = 11,
		base_int = 31,
		gain_str = 2.3,
		gain_agi = 1.1,
		gain_int = 3.2,
		armor = 1,
		attack_range = 500,
		attack_cap = DOTA_UNIT_CAP_RANGED_ATTACK,
		attack_projectile = "particles/units/heroes/hero_lina/lina_base_attack.vpcf",
		move_speed = 300,
	},
	{	--Monk
		primary_attribute = DOTA_ATTRIBUTE_STRENGTH,
		base_str = 23,
		base_agi = 23,
		base_int = 9,
		gain_str = 2.9,
		gain_agi = 2.6,
		gain_int = 1.1,
		armor = 0,
		attack_range = 150,
		attack_cap = DOTA_UNIT_CAP_MELEE_ATTACK,
		attack_projectile = nil,
		move_speed = 300,
	},
	{	--Thief
		primary_attribute = DOTA_ATTRIBUTE_AGILITY,
		base_str = 10,
		base_agi = 33,
		base_int = 12,
		gain_str = 1.6,
		gain_agi = 3.6,
		gain_int = 1.4,
		armor = 1,
		attack_range = 150,
		attack_cap = DOTA_UNIT_CAP_MELEE_ATTACK,
		attack_projectile = nil,
		move_speed = 310,
	},
	{	--Mystic
		primary_attribute = DOTA_ATTRIBUTE_INTELLECT,
		base_str = 15,
		base_agi = 13,
		base_int = 27,
		gain_str = 1.9,
		gain_agi = 1.3,
		gain_int = 3.4,
		armor = 1,
		attack_range = 575,
		attack_cap = DOTA_UNIT_CAP_RANGED_ATTACK,
		attack_projectile = "particles/units/heroes/hero_shadowshaman/shadowshaman_base_attack.vpcf",
		move_speed = 285,
	},
	{	--Time Mage
		primary_attribute = DOTA_ATTRIBUTE_INTELLECT,
		base_str = 12,
		base_agi = 19,
		base_int = 24,
		gain_str = 1.4,
		gain_agi = 2.3,
		gain_int = 2.9,
		armor = 1,
		attack_range = 500,
		attack_cap = DOTA_UNIT_CAP_RANGED_ATTACK,
		attack_projectile = "particles/units/heroes/hero_silencer/silencer_base_attack.vpcf",
		move_speed = 295,
	},
	{	--Orator
		primary_attribute = DOTA_ATTRIBUTE_INTELLECT,
		base_str = 17,
		base_agi = 18,
		base_int = 20,
		gain_str = 2.1,
		gain_agi = 1.7,
		gain_int = 2.8,
		armor = 1,
		attack_range = 400,
		attack_cap = DOTA_UNIT_CAP_RANGED_ATTACK,
		attack_projectile = "particles/econ/items/rubick/rubick_staff_wandering/rubick_base_attack_whset.vpcf",
		move_speed = 305,
	},
	{	--Summoner
		primary_attribute = DOTA_ATTRIBUTE_INTELLECT,
		base_str = 13,
		base_agi = 17,
		base_int = 25,
		gain_str = 1.6,
		gain_agi = 1.7,
		gain_int = 3.3,
		armor = 0,
		attack_range = 600,
		attack_cap = DOTA_UNIT_CAP_RANGED_ATTACK,
		attack_projectile = "particles/units/heroes/hero_keeper_of_the_light/keeper_base_attack.vpcf",
		move_speed = 300,
	},
	{	--Geomancer
		primary_attribute = DOTA_ATTRIBUTE_STRENGTH,
		base_str = 24,
		base_agi = 13,
		base_int = 18,
		gain_str = 2.8,
		gain_agi = 1.7,
		gain_int = 1.8,
		armor = 1,
		attack_range = 500,
		attack_cap = DOTA_UNIT_CAP_RANGED_ATTACK,
		attack_projectile = "particles/units/heroes/hero_invoker/invoker_base_attack.vpcf",
		move_speed = 310,
	},
	{	--Dragoon
		primary_attribute = DOTA_ATTRIBUTE_AGILITY,
		base_str = 22,
		base_agi = 22,
		base_int = 11,
		gain_str = 2.8,
		gain_agi = 2.5,
		gain_int = 1.0,
		armor = 0,
		attack_range = 150,
		attack_cap = DOTA_UNIT_CAP_MELEE_ATTACK,
		attack_projectile = nil,
		move_speed = 320,
	},
	{	--Samurai
		primary_attribute = DOTA_ATTRIBUTE_STRENGTH,
		base_str = 23,
		base_agi = 18,
		base_int = 14,
		gain_str = 3.3,
		gain_agi = 2.0,
		gain_int = 1.0,
		armor = 0,
		attack_range = 150,
		attack_cap = DOTA_UNIT_CAP_MELEE_ATTACK,
		attack_projectile = nil,
		move_speed = 315,
	},
	{	--Ninja
		primary_attribute = DOTA_ATTRIBUTE_AGILITY,
		base_str = 15,
		base_agi = 28,
		base_int = 12,
		gain_str = 1.7,
		gain_agi = 3.6,
		gain_int = 1.0,
		armor = 0,
		attack_range = 150,
		attack_cap = DOTA_UNIT_CAP_MELEE_ATTACK,
		attack_projectile = nil,
		move_speed = 325,
	},
	{	--Arithmatician
		primary_attribute = DOTA_ATTRIBUTE_INTELLECT,
		base_str = 8,
		base_agi = 7,
		base_int = 40,
		gain_str = 1.3,
		gain_agi = 1,
		gain_int = 4,
		armor = 0,
		attack_range = 700,
		attack_cap = DOTA_UNIT_CAP_RANGED_ATTACK,
		attack_projectile = "particles/econ/items/necrolyte/necronub_base_attack/necrolyte_base_attack_ka.vpcf",
		move_speed = 295,
	},
	{	--Mime
		primary_attribute = DOTA_ATTRIBUTE_INTELLECT,
		base_str = 18,
		base_agi = 18,
		base_int = 18,
		gain_str = 2.4,
		gain_agi = 2.4,
		gain_int = 2.4,
		armor = 1,
		attack_range = 600,
		attack_cap = DOTA_UNIT_CAP_RANGED_ATTACK,
		attack_projectile = "particles/units/heroes/hero_bane/bane_projectile.vpcf",
		move_speed = 300,
	},
	{	--Dark Knight
		primary_attribute = DOTA_ATTRIBUTE_STRENGTH,
		base_str = 30,
		base_agi = 30,
		base_int = 30,
		gain_str = 3.3,
		gain_agi = 3.3,
		gain_int = 3.3,
		armor = 0,
		attack_range = 150,
		attack_cap = DOTA_UNIT_CAP_MELEE_ATTACK,
		attack_projectile = nil,
		move_speed = 300,
	},
	{	--Onion knight
		primary_attribute = DOTA_ATTRIBUTE_AGILITY,
		base_str = 40,
		base_agi = 40,
		base_int = 40,
		gain_str = 5.3,
		gain_agi = 5.3,
		gain_int = 5.3,		
		armor = 1,
		attack_range = 150,
		attack_cap = DOTA_UNIT_CAP_MELEE_ATTACK,
		attack_projectile = nil,
		move_speed = 350,
	}
	
}


CRamzaJob.tPrimaryAbilities = {
	{	-- Squire: Fundaments Lvl 1 - Stone, Rush|nLvl 2 - Focus|nLvl 3 - Counter Tackle|nLvl 4 - Tailwind|nLvl 5 - Defend|nLvl 6 - Chant|nLvl 7 - Move +1|nLvl 8 - Shout|nMastered - |c00ff8000Ultima
		{"ramza_squire_fundamental_stone", "ramza_squire_fundamental_rush"},
		{"ramza_squire_fundamental_focus"},
		{},
		{"ramza_squire_fundamental_tailwind"},
		{},
		{"ramza_squire_fundamental_chant"},
		{},
		{"ramza_squire_fundamental_shout"},
		{"ramza_squire_fundamental_ultima"}
	},
	{	-- Chemist: Items|r|nLvl 1 - Potion, Ether|nLvl 2 - Hi-Potion|nLvl 3 - Auto-Potion|nLvl 4 - Hi-Ether|nLvl 5 - Treasure Hunter|nLvl 6 - Remedy|nLvl 7 - Throw Items|nLvl 8 - Phoenix Down|nMastered - |c00ff8000Elixir
		{"ramza_chemist_items_potion", "ramza_chemist_items_ether"},
		{"ramza_chemist_items_hipotion"},
		{},
		{"ramza_chemist_items_hiether"},
		{},
		{"ramza_chemist_items_remedy"},
		{},
		{"ramza_chemist_items_phoenix_down"},
		{"ramza_chemist_items_elixir"}
	},
	{	-- Knight: Arts of War|r|nLvl 1 - Rend Power, Rend Magick|nLvl 2 - Rend Speed|nLvl 3 - Parry|nLvl 4 - Rend MP|nLvl 5 - Heavy Armor|nLvl 6 - Rend Armor|nLvl 7 - Knight Sword|nLvl 8 - Rend Weapon|nMastered - |c00ff8000Rend Helm
		{"ramza_knight_aow_rend_power", "ramza_knight_aow_rend_magick"},
		{"ramza_knight_aow_rend_speed"},
		{},
		{"ramza_knight_aow_rend_mp"},
		{},
		{"ramza_knight_rend_armor"},
		{},
		{"ramza_knight_aow_rend_weapon"},
		{"ramza_knight_aow_rend_helm"}
	},
	{	-- Archer: Aim|r|nLvl 1 - Aim +2|nLvl 2 - Aim +4|nLvl 3 - Adrenaline Rush|nLvl 4 - Aim +6|nLvl 5 - Archer's Bane|nLvl 6 - Aim +7|nLvl 7 - Concentration|nLvl 8 - Aim +10|nMastered - |c00ff8000Aim +20
		{"ramza_archer_aim_2"},
		{"ramza_archer_aim_4"},
		{},
		{"ramza_archer_aim_6"},
		{},
		{"ramza_archer_aim_7"},
		{},
		{"ramza_archer_aim_10"},
		{"ramza_archer_aim_20"}
	},
	{	-- White Mage: White Magicks|r|nLvl 1 - Cure, Regen|nLvl 2 - Protect, Shell|nLvl 3 - Regenerate|nLvl 4 - Cura|nLvl 5 - Arcane Defense|nLvl 6 - Wall|nLvl 7 - Reraise|nLvl 8 - Curaga|nMastered - |c00ff8000Holy
		{"ramza_white_mage_white_magicks_cure", "ramza_white_mage_white_magicks_regen"},
		{"ramza_white_mage_white_magicks_protect", "ramza_white_mage_white_magicks_shell"},
		{},
		{"ramza_white_mage_white_magicks_cura"},
		{},
		{"ramza_white_mage_white_magicks_wall"},
		{},
		{"ramza_white_mage_white_magicks_curaga"},
		{"ramza_white_mage_white_magicks_holy"}
	},
	{	-- Black Mage: Black Magicks|r|nLvl 1 - Fire, Blizzard|nLvl 2 - Thunder|nLvl 3 - Arcane Strength|nLvl 4 - Poison|nLvl 5 - Magick Counter|nLvl 6 - Toad|nLvl 7 - Death|nLvl 8 - Firaga, Blizzaga, Thundaga|nMastered - |c00ff8000Flare
		{"ramza_black_mage_black_magicks_fire", "ramza_black_mage_black_magicks_blizzard"},
		{"ramza_black_mage_black_magicks_thunder"},
		{},
		{"ramza_black_mage_black_magicks_poison"},
		{},
		{"ramza_black_mage_black_magicks_toad"},
		{},
		{"ramza_black_mage_black_magicks_firaga", "ramza_black_mage_black_magicks_blizzaga", "ramza_black_mage_black_magicks_thundaga"},		
		{"ramza_black_mage_black_magicks_flare"},		
	},
	{	-- Monk: Martial Arts|r|nLvl 1 - Pummel|nLvl 2 - Purification|nLvl 3 - Brawler|nLvl 4 - Aurablast|nLvl 5 - Lifefont|nLvl 6 - Chakra|nLvl 7 - Critical: Recover HP|nLvl 8 - Shockwave|nMastered - |c00ff8000Doom Fist
		{"ramza_monk_martial_arts_pummel"},
		{"ramza_monk_martial_arts_purification"},
		{},
		{"ramza_monk_martial_arts_aurablast"},
		{},
		{"ramza_monk_martial_arts_chakra"},
		{},
		{"ramza_monk_martial_arts_shockwave"},
		{"ramza_monk_martial_arts_doom_fist"},
	},
	{	-- Thief: Steal|r|nLvl 1 - Steal Gil|nLvl 2 - Steal Heart|nLvl 3 - Move +2|nLvl 4 - Steal EXP|nLvl 5 - Vigilance|nLvl 6 - Steal Armor|nLvl 7 - Gil Snapper|nLvl 8 - Steal Weapon|nMastered - |c00ff8000Steal Accessory
		{"ramza_thief_steal_gil"},
		{"ramza_thief_steal_heart"},
		{},
		{"ramza_thief_steal_exp"},
		{},
		{"ramza_thief_steal_armor"},
		{},
		{"ramza_thief_steal_weapon"},
		{"ramza_thief_steal_accessory"},
	},
	{	-- Mystic:  Mystic Arts|r|nLvl 1 - Umbra|nLvl 2 - Empowerment|nLvl 3 - Defense Boost|nLvl 4 - Disbelief|nLvl 5 - Manafont|nLvl 6 - Hesitation|nLvl 7 - Absorb MP|nLvl 8 - Quiescence|nMastered - |c00ff8000Invigoration
		{"ramza_mystic_mystic_arts_umbra"},
		{"ramza_mystic_mystic_arts_empowerment"},
		{},
		{"ramza_mystic_mystic_arts_disbelief"},
		{},
		{"ramza_mystic_mystic_arts_hesitation"},
		{},
		{"ramza_mystic_mystic_arts_quiescence"},
		{"ramza_mystic_mystic_arts_invigoration"},
	},
	{	-- Time Mage: Time Magicks|r|nLvl 1 - Haste, Slow|nLvl 2 - Immobilize|nLvl 3 - Mana Shield|nLvl 4 - Gravity|nLvl 5 - Teleport|nLvl 6 - Quick|nLvl 7 - Swiftness|nLvl 8 - Stop|nMastered - |c00ff8000Meteor
		{"ramza_time_mage_time_magicks_haste", "ramza_time_mage_time_magicks_slow"},
		{"ramza_time_mage_time_magicks_immobilize"},
		{},
		{"ramza_time_mage_time_magicks_gravity"},
		{},
		{"ramza_time_mage_time_magicks_quick"},
		{},
		{"ramza_time_mage_time_magicks_stop"},
		{"ramza_time_mage_time_magicks_meteor"},
	},
	{	-- Orator: Speechcraft|r|nLvl 1 - Praise, Preach|nLvl 2 - Mimic Darlavon|nLvl 3 - Enlighten|nLvl 4 - Entice|nLvl 5 - Intimidate|nLvl 6 - Beg|nLvl 7 - Beast Tongue|nLvl 8 - Stall|nMastered - |c00ff8000Condemn
		{"ramza_orator_speechcraft_praise", "ramza_orator_speechcraft_preach"},
		{"ramza_orator_speechcraft_mimic_darlavon"},
		{},
		{"ramza_orator_speechcraft_entice"},
		{},
		{"ramza_orator_speechcraft_beg"},
		{},
		{"ramza_orator_speechcraft_stall"},
		{"ramza_orator_speechcraft_condemn"},
	},
	{	-- Summoner: Summon|r|nLvl 1 - Moogle|nLvl 2 - Shiva, Ifrit|nLvl 3 - Critical: Recover MP|nLvl 4 - Ramuh|nLvl 5 - Lich|nLvl 6 - Golem|nLvl 7 - Odin|nLvl 8 - Bahamut|nMastered - |c00ff8000Zodiark
		{"ramza_summoner_summon_moogle"},
		{"ramza_summoner_summon_shiva", "ramza_summoner_summon_ifrit"},
		{},
		{"ramza_summoner_summon_ramuh"},
		{},
		{"ramza_summoner_summon_golem"},
		{},
		{"ramza_summoner_summon_bahamut"},
		{"ramza_summoner_summon_zodiark"},
	},
	{	-- Geomancer: Geomancy|r|nLvl 1 - Sinkhole|nLvl 2 - Torrent|nLvl 3 - Contortion|nLvl 4 - Will-o'-the-Wisp|nLvl 5 - Attack Boost|nLvl 6 - Sandstorm|nLvl 7 - Wind Blast|nLvl 8 - Tanglevine|nMastered - |c00ff8000Magma Surge
		{"ramza_geomancer_geomancy_sinkhole"},
		{"ramza_geomancer_geomancy_torrent"},
		{},
		{"ramza_geomancer_geomancy_willothewisp"},
		{},
		{"ramza_geomancer_geomancy_sand_storm"},
		{},
		{"ramza_geomancer_geomancy_tanglevine"},
		{"ramza_geomancer_geomancy_magma_surge"},
	}, 
	{	-- Dragoon: Jump|r|nLvl 1 - Jump|nLvl 2 - Jump 2|nLvl 3 - Polearm|nLvl 4 - Jump 3|nLvl 5 - Ignore Elevation|nLvl 6 - Jump 4|nLvl 7 - Dragonheart|nLvl 8 - Jump 5|nMastered - |c00ff8000Jump 8
		{"ramza_dragoon_jump1"},
		{"ramza_dragoon_jump2"},
		{},
		{"ramza_dragoon_jump3"},
		{},
		{"ramza_dragoon_jump4"},
		{},
		{"ramza_dragoon_jump5"},
		{"ramza_dragoon_jump8"},
	},
	{	-- Samurai: Iaido|r|nLvl 1 - Ashura|nLvl 2 - Osafune|nLvl 3 - Doublehand|nLvl 4 - Murasame|nLvl 5 - Shirahadori|nLvl 6 - Kiku-ichimonji|nLvl 7 - Bonecrusher|nLvl 8 - Masamune|nMastered - |c00ff8000Chirijiraden
		{"ramza_samurai_iaido_ashura"},
		{"ramza_samurai_iaido_osafune"},
		{},
		{"ramza_samurai_iaido_murasame"},
		{},
		{"ramza_samurai_iaido_kikuichimonji"},
		{},
		{"ramza_samurai_iaido_masamune"},
		{"ramza_samurai_iaido_chirijiraden"},
	},
	{	-- Ninja: Throw|r|nLvl 1 - Shuriken|nLvl 2 - Axe|nLvl 3 - Reflexes|nLvl 4 - Book|nLvl 5 - Vanish|nLvl 6 - Polearm|nLvl 7 - Dual Wield|nLvl 8 - Bomb|nMastered - |c00ff8000Ninja Blade
		{"ramza_ninja_throw_shuriken"},
		{"ramza_ninja_throw_axe"},
		{},
		{"ramza_ninja_throw_book"},
		{},
		{"ramza_ninja_throw_polearm"},
		{},
		{"ramza_ninja_throw_bomb"},
		{"ramza_ninja_throw_ninja_blade"},
	},
	{	-- Arithmatician: Arithmeticks|r|nLvl 1 - CT|nLvl 2 - Multiple of 5|nLvl 3 - Accrue EXP|nLvl 4 - Level|nLvl 5 - Soulbind|nLvl 6 - Multiple of 4|nLvl 7 - EXP Boost|nLvl 8 - Multiple of 3|nMastered - |c00ff8000EXP
		{"ramza_arithmatician_arithmeticks_CT"},
		{"ramza_arithmatician_arithmeticks_multiple_of_5"},
		{},
		{"ramza_arithmatician_arithmeticks_level"},
		{},
		{"ramza_arithmatician_arithmeticks_multiple_of_4"},
		{},
		{"ramza_arithmatician_arithmeticks_multiple_of_3"},
		{"ramza_arithmatician_arithmeticks_exp"},
	},
	{	-- Mime: Mimic|r|nLvl 1 - 100% Mana Cost|nLvl 2 - 90% Mana Cost|nLvl 3 - 80% Mana Cost|nLvl 4 - 70% Mana Cost|nLvl 5 - 60% Mana Cost|nLvl 6 - 50% Mana Cost|nLvl 7 - 40% Mana Cost|nLvl 8 - 20% Mana Cost|nMastered - |c00ff80000% Mana Cost
		{"ramza_mime_mimic_100_mana_cost"},
		{"ramza_mime_mimic_90_mana_cost"},
		{"ramza_mime_mimic_80_mana_cost"},
		{"ramza_mime_mimic_70_mana_cost"},
		{"ramza_mime_mimic_60_mana_cost"},
		{"ramza_mime_mimic_50_mana_cost"},
		{"ramza_mime_mimic_40_mana_cost"},
		{"ramza_mime_mimic_20_mana_cost"},
		{"ramza_mime_mimic_0_mana_cost"},
	},
	{	-- Dark Knight: Darkness|r|nLvl 1 - Sanguine Sword|nLvl 2 - Infernal Strike|nLvl 3 - HP Boost|nLvl 4 - Crushing Blow|nLvl 5 - Vehemence|nLvl 6 - Abyssal Blade|nLvl 7 - Move +3|nLvl 8 - Unholy Sacrifice|nMastered - |c00ff8000Shadowblade
		{"ramza_dark_knight_darkness_sanguine_sword"},
		{"ramza_dark_knight_darkness_infernal_strike"},
		{},
		{"ramza_dark_knight_darkness_crushing_blow"},
		{},
		{"ramza_dark_knight_darkness_abyssal_blade"},
		{},
		{"ramza_dark_knight_darkness_unholy_sacrifice"},
		{"ramza_dark_knight_darkness_shadowblade"},
	},
	{	-- Onion Knight: None|r|nLvl 1 - +5 Stats|nLvl 2 - +10 Stats|nLvl 3 - +15 Stats|nLvl 4 - +20 Stats|nLvl 5 - +25 Stats|nLvl 6 - +30 Stats|nLvl 7 - +35 Stats|nLvl 8 - +50 Stats|nMastered - |c00ff8000+75 Stats
		{"ramza_onion_knight_stat5"},
		{"ramza_onion_knight_stat10"},
		{"ramza_onion_knight_stat15"},
		{"ramza_onion_knight_stat20"},
		{"ramza_onion_knight_stat25"},
		{"ramza_onion_knight_stat30"},
		{"ramza_onion_knight_stat35"},
		{"ramza_onion_knight_stat50"},
		{"ramza_onion_knight_stat75"},
	}
}

CRamzaJob.tOtherAbilities = {	
	{	-- Squire
		{}, {}, {"ramza_squire_counter_tackle"}, {}, {"ramza_squire_defend"}, {}, {"ramza_squire_move1"}, {}, {}
	},
	{	-- Chemist
		{}, {}, {"ramza_chemist_autopotion"}, {}, {"ramza_chemist_treasure_hunter"}, {}, {"ramza_chemist_throw_items"}, {}, {}
	},
	{	-- Knight
		{}, {}, {"ramza_knight_parry"}, {}, {"ramza_knight_heavy_armor"}, {}, {"ramza_knight_knight_sword"}, {}, {}
	},
	{	-- Archer
		{}, {}, {"ramza_archer_adrenaline_rush"}, {}, {"ramza_archer_archers_bane"}, {}, {"ramza_archer_concentration"}, {}, {}
	},
	{	-- White Mage
		{}, {}, {"ramza_white_mage_regenerate"}, {}, {"ramza_white_mage_arcane_defense"}, {}, {"ramza_white_mage_reraise"}, {}, {}
	},
	{	-- Black Mage: 
		{}, {}, {"ramza_black_mage_magick_counter"}, {}, {"ramza_black_mage_death"}, {}, {"ramza_black_mage_arcane_strength"}, {}, {}
	},
	{	-- Monk
		{}, {}, {"ramza_monk_brawler"}, {}, {"ramza_monk_lifefont"}, {}, {"ramza_monk_critical_recover_hp"}, {}, {}
	},
	{	-- Thief
		{}, {}, {"ramza_thief_move2"}, {}, {"ramza_thief_vigilance"}, {}, {"ramza_thief_gil_snapper"}, {}, {}
	},
	{	-- Mystic
		{}, {}, {"ramza_mystic_defense_boost"}, {}, {"ramza_mystic_manafont"}, {}, {"ramza_mystic_absorb_mp"}, {}, {}
	},
	{	-- Time Mage
		{}, {}, {"ramza_time_mage_mana_shield"}, {}, {"ramza_time_mage_teleport"}, {}, {"ramza_time_mage_swiftness"}, {}, {}
	},
	{	-- Orator
		{}, {}, {"ramza_orator_enlighten"}, {}, {"ramza_orator_intimidate"}, {}, {"ramza_orator_beast_tongue"}, {}, {}
	},
	{	-- Summoner
		{}, {}, {"ramza_summoner_critical_recover_mp"}, {}, {"ramza_summoner_lich"}, {}, {"ramza_summoner_odin"}, {}, {}
	},
	{	-- Geomancer
		{}, {}, {"ramza_geomancer_contortion"}, {}, {"ramza_geomancer_attack_boost"}, {}, {"ramza_geomancer_wind_blast"}, {}, {}
	},
	{	-- Dragoon
		{}, {}, {"ramza_dragoon_polearm"}, {}, {"ramza_dragoon_ignore_elevation"}, {}, {"ramza_dragoon_dragonheart"}, {}, {}
	},
	{	-- Samurai
		{}, {}, {"ramza_samurai_doublehand"}, {}, {"ramza_samurai_shirahadori"}, {}, {"ramza_samurai_bonecrusher"}, {}, {}
	},
	{	-- Ninja
		{}, {}, {"ramza_ninja_reflexes"}, {}, {"ramza_ninja_vanish"}, {}, {"ramza_ninja_dual_wield"}, {}, {}
	},
	{	-- Arithmatician
		{}, {}, {"ramza_accrue_exp"}, {}, {"ramza_soulbind"}, {}, {"ramza_exp_boost"}, {}, {}
	},
	{	-- Mime
		{}, {}, {}, {}, {}, {}, {}, {}, {}
	},
	{	-- Dark Knight
		{}, {}, {"ramza_dark_knight_hp_boost"}, {}, {"ramza_dark_knight_vehemence"}, {}, {"ramza_dark_knight_move3"}, {}, {}
	},
	{	-- Onion Knight
		{}, {}, {}, {}, {}, {}, {}, {}, {}
	}
}

function CRamzaJob:GainJobPoint(iJobPoint)
	self.tJobPoints[self.iCurrentJob] = self.tJobPoints[self.iCurrentJob] + iJobPoint
	local bReturnValue = false
	while self.tJobLevels[self.iCurrentJob] < 9 and self.tRamzaJobReqirement[self.tJobLevels[self.iCurrentJob]+1] <= self.tJobPoints[self.iCurrentJob] do --Gain job level
		self.tJobLevels[self.iCurrentJob] = self.tJobLevels[self.iCurrentJob]+1
		if self.tJobLevelUnlocks[self.iCurrentJob] and self.tJobLevelUnlocks[self.iCurrentJob][self.tJobLevels[self.iCurrentJob]] then -- Update unmet job requirements
			for k, v in pairs(self.tJobLevelUnlocks[self.iCurrentJob][self.tJobLevels[self.iCurrentJob]]) do
				for i = 1, #self.tUnmetChangeJobRequirements[v] do
					if self.tUnmetChangeJobRequirements[v][i] == self.iCurrentJob then
						table.remove(self.tUnmetChangeJobRequirements[v], i)
						if #self.tUnmetChangeJobRequirements[v] == 0 then
							self.tJobLevels[v] = 1
						end
					end
				end
			end
		end
		bReturnValue = true
		print(self.tJobNames[self.iCurrentJob].." has leveled up to "..tostring(self.tJobLevels[self.iCurrentJob]))
	end

end


function CRamzaJob:ChangeJob(iJob)
	if self.tJobLevels[iJob] > 0 then
		self.iCurrentJob = iJob
		print("Job changed to "..self.tJobNames[iJob])
		return true
	else
		return false
	end
end



function CRamzaJob:New(tInput)
	local tNewObject = tInput or {}
	tNewObject.tJobPoints = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	tNewObject.tJobLevels = {1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	tNewObject.tUnmetChangeJobRequirements = {}
	for i = 1, 20 do
		tNewObject.tUnmetChangeJobRequirements[i] = {}
		for k, v in pairs(self.tRamzaChangeJobRequirements[i]) do
			table.insert(tNewObject.tUnmetChangeJobRequirements[i], k)
		end
	end
	
	
	tNewObject.iCurrentJob = RAMZA_JOB_SQUIRE
	tNewObject.iSecondJob = 0
	
	setmetatable(tNewObject, {__index = self})
	return tNewObject
end

function CRamzaJob:PrintCurrent()
	print("Current job is"..self.tJobNames[self.iCurrentJob].."(level "..tostring(self.tJobLevels[self.iCurrentJob]).."), job point is "..tostring(self.tJobPoints[self.iCurrentJob]))
end

-- hJob = CRamzaJob:New()
CRamzaJob:Initialize()
LinkLuaModifier("modifier_attribute_growth_str", "heroes/ramza/ramza_overall_modifiers.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_attribute_growth_agi", "heroes/ramza/ramza_overall_modifiers.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_attribute_growth_int", "heroes/ramza/ramza_overall_modifiers.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_ramza_job_manager", "heroes/ramza/ramza_overall_modifiers.lua", LUA_MODIFIER_MOTION_NONE)