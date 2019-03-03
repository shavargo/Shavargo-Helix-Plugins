local PLUGIN = PLUGIN

PLUGIN.name = "TnB Model Animations"
PLUGIN.author = "Shavargo"
PLUGIN.description = "Adds the proper animations to TnB models."

ix.anim = ix.anim or {}

ix.anim.tnb = {
	normal = {
		[ACT_MP_STAND_IDLE] = {"idle_all_02"},
		[ACT_MP_CROUCH_IDLE] = {"cidle_all"},
		[ACT_MP_WALK] = {"walk_all"},
		[ACT_MP_CROUCHWALK] = {"cwalk_all"},
		[ACT_MP_RUN] = {"run_all"},
		[ACT_LAND] = {ACT_RESET, ACT_RESET}
	},
	pistol = {
		[ACT_MP_STAND_IDLE] = {"idle_revolver"},
		[ACT_MP_CROUCH_IDLE] = {"cidle_revolver"},
		[ACT_MP_WALK] = {"walk_revolver"},
		[ACT_MP_CROUCHWALK] = {"cwalk_revolver"},
		[ACT_MP_RUN] = {"run_revolver"},
		[ACT_LAND] = {ACT_RESET, ACT_RESET},
		attack = ACT_GESTURE_RANGE_ATTACK_PISTOL,
		reload = "reload_revolver"
	},
	smg = {
		[ACT_MP_STAND_IDLE] = {"idle_smg1"},
		[ACT_MP_CROUCH_IDLE] = {"cidle_smg1"},
		[ACT_MP_WALK] = {"walk_smg1"},
		[ACT_MP_CROUCHWALK] = {"cwalk_smg1"},
		[ACT_MP_RUN] = {"run_smg1"},
		[ACT_LAND] = {ACT_RESET, ACT_RESET},
		attack = ACT_GESTURE_RANGE_ATTACK_SMG1,
		reload = "reload_smg1"
	},
	ar2 = {
		[ACT_MP_STAND_IDLE] = {"idle_ar2"},
		[ACT_MP_CROUCH_IDLE] = {"cidle_ar2"},
		[ACT_MP_WALK] = {"walk_ar2"},
		[ACT_MP_CROUCHWALK] = {"cwalk_ar2"},
		[ACT_MP_RUN] = {"run_ar2"},
		[ACT_LAND] = {ACT_RESET, ACT_RESET},
		attack = ACT_GESTURE_RANGE_ATTACK_SMG1,
		reload = "reload_ar2"
	},
	shotgun = {
		[ACT_MP_STAND_IDLE] = {"idle_shotgun"},
		[ACT_MP_CROUCH_IDLE] = {"cidle_shotgun"},
		[ACT_MP_WALK] = {"walk_shotgun"},
		[ACT_MP_CROUCHWALK] = {"cwalk_shotgun"},
		[ACT_MP_RUN] = {"run_shotgun"},
		[ACT_LAND] = {ACT_RESET, ACT_RESET},
		attack = "reload_shotgun"
	},
	grenade = {
		[ACT_MP_STAND_IDLE] = {"idle_grenade"},
		[ACT_MP_CROUCH_IDLE] = {"cidle_grenade"},
		[ACT_MP_WALK] = {"walk_grenade"},
		[ACT_MP_CROUCHWALK] = {"cwalk_grenade"},
		[ACT_MP_RUN] = {ACT_RUN, ACT_RUN_RIFLE_STIMULATED},
		[ACT_LAND] = {ACT_RESET, ACT_RESET},
		attack = ACT_RANGE_ATTACK_THROW
	},
	melee = {
		[ACT_MP_STAND_IDLE] = {"idle_melee"},
		[ACT_MP_CROUCH_IDLE] = {"cidle_melee"},
		[ACT_MP_WALK] = {"walk_melee2"},
		[ACT_MP_CROUCHWALK] = {"cwalk_melee2"},
		[ACT_MP_RUN] = {"run_melee2"},
		[ACT_LAND] = {ACT_RESET, ACT_RESET},
		attack = ACT_MELEE_ATTACK_SWING
	},
	glide = "jump_holding_glide",
	["sit"] = "sit",
	["sit_zen"] = "sit_zen",
	vehicle = {
		["prop_vehicle_prisoner_pod"] = {"podpose", Vector(-3, 0, 0)},
		["prop_vehicle_jeep"] = {ACT_BUSY_SIT_CHAIR, Vector(14, 0, -14)},
		["prop_vehicle_airboat"] = {ACT_BUSY_SIT_CHAIR, Vector(8, 0, -20)},
		chair = {"sit_rollercoaster", Vector(1, 0, -23)}
	},
}

--HL2 Models
ix.anim.SetModelClass("models/tnb/citizens/male_01.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_02.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_03.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_04.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_05.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_06.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_07.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_08.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_09.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_10.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_11.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_12.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_13.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_14.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_15.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_16.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_17.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_18.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_19.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_20.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_21.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_22.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_23.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_24.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_25.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_26.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_27.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_28.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_29.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_30.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_31.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_32.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_33.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_34.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_35.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_36.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_37.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_38.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_39.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_40.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_41.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_42.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_43.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_44.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_45.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_46.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_47.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_48.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_49.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_50.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_51.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_52.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_53.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_54.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_55.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_56.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_57.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_58.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_59.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_60.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_61.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_62.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_63.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_64.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_65.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_66.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_67.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_68.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_69.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_70.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_71.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_72.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_73.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_74.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_75.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_76.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_77.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_78.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_79.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_80.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_81.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_82.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_83.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_84.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_85.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_86.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_87.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_88.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_89.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_90.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_91.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_92.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_93.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_94.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_95.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_96.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_97.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/male_98.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_01.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_02.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_03.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_04.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_05.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_06.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_07.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_08.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_09.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_10.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_11.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_12.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_13.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_14.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_15.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_16.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_17.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_18.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_19.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_20.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_21.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_22.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_23.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_24.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_25.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_26.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_27.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_28.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_29.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_30.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_31.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_32.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_33.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_34.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_35.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_36.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_37.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_38.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_39.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_40.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_41.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_42.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_43.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_44.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_45.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_46.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_47.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_48.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_49.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_50.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_51.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_52.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_53.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_54.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_55.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_56.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_57.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_58.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_59.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_60.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_61.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_62.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_63.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_64.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_65.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_66.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_67.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/citizens/female_68.mdl", "tnb")
--Combine Models
ix.anim.SetModelClass("models/tnb/combine/metrocop.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/combine/metrocop_female.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/combine/combine_dvl.mdl", "tnb")
--STALKER Models
ix.anim.SetModelClass("models/tnb/stalker/female_01_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_01_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_02_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_02_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_03_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_03_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_04_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_04_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_05_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_05_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_06_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_06_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_07_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_07_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_08_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_08_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_sunrise_balaclava.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_sunrise_combat.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_sunrise_gasmask.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/female_sunrise_helmet.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_01_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_01_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_02_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_02_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_03_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_03_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_04_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_04_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_05_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_05_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_06_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_06_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_07_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_07_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_08_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_08_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_09_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_09_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_10_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_10_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_anorak.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_bandit.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_bandit_gasmask.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_berill.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_berill_helmet.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_berill_seva.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_cs1.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_cs2.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_cs3.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_cs3_mask.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_exo.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_exo_bandit.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_io7a.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_io7a_bandit.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_io8a.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_radsuit.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_radsuit_seva.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_radsuit_tubes.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_seva.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_skat.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_skat_exo.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_skat_bulat.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_ssp.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_sunrise.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_sunrise_balaclava.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_sunrise_combat.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_sunrise_gasmask.mdl", "tnb")
ix.anim.SetModelClass("models/tnb/stalker/male_sunrise_helmet.mdl", "tnb")