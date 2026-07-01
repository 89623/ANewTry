// open to suggestions on where to put these overrides
// hugely not a fan of this but we do what we gotta

/*
 * gotta redefine EVERY goddamn ammo type irt to new mat costs for the ammobench's sake
 * previously, SMALL_MATERIAL_AMOUNT was 100 units out of 2000 from a sheet (5%)
 * so the old cost of SMALL_MATERIAL_AMOUNT * 5 was 500/2000 from a sheet (25%)
 * experimental material balance PR makes it so that SMALL_MATERIAL_AMOUNT is actually 10 units out of 100 (10%)
 * which made it so that the old assumed value of SMALL_MATERIAL_AMOUNT * 5 is 50/100 (50% of a sheet for a single bullet) (suboptimal)
 * these updated, more consistent defines make it so that a single round's total materials should total 20% of a sheet, or 2 SMALL_MATERIAL_AMOUNT
*/

#define AMMO_MATS_BASIC list( \
	/datum/material/iron = SMALL_MATERIAL_AMOUNT * 2, \
)

#define AMMO_MATS_AP list( \
	/datum/material/iron = SMALL_MATERIAL_AMOUNT * 1.6, \
	/datum/material/titanium = SMALL_MATERIAL_AMOUNT * 0.4, \
)

#define AMMO_MATS_TEMP list( \
	/datum/material/iron = SMALL_MATERIAL_AMOUNT * 1.6, \
	/datum/material/plasma = SMALL_MATERIAL_AMOUNT * 0.4, \
)

#define AMMO_MATS_EMP list( \
	/datum/material/iron = SMALL_MATERIAL_AMOUNT * 1.6, \
	/datum/material/uranium = SMALL_MATERIAL_AMOUNT * 0.4, \
)

#define AMMO_MATS_PHASIC list( \
	/datum/material/iron = SMALL_MATERIAL_AMOUNT * 1.6, \
	/datum/material/bluespace = SMALL_MATERIAL_AMOUNT * 0.4, \
)

#define AMMO_MATS_TRAC list( \
	/datum/material/iron = SMALL_MATERIAL_AMOUNT * 1.6, \
	/datum/material/silver = SMALL_MATERIAL_AMOUNT * 0.2, \
	/datum/material/gold = SMALL_MATERIAL_AMOUNT * 0.2, \
)

#define AMMO_MATS_HOMING list( \
	/datum/material/iron = SMALL_MATERIAL_AMOUNT * 1, \
	/datum/material/silver = SMALL_MATERIAL_AMOUNT * 0.2, \
	/datum/material/gold = SMALL_MATERIAL_AMOUNT * 0.2, \
	/datum/material/plasma = SMALL_MATERIAL_AMOUNT * 0.2, \
	/datum/material/diamond = SMALL_MATERIAL_AMOUNT * 0.2, \
	/datum/material/bluespace = SMALL_MATERIAL_AMOUNT * 0.2, \
)

// for .35 Sol Ripper
#define AMMO_MATS_RIPPER list( \
	/datum/material/iron = SMALL_MATERIAL_AMOUNT * 1.6, \
	/datum/material/glass = SMALL_MATERIAL_AMOUNT * 0.4, \
)

#define AMMO_MATS_HEAVY list( \
	/datum/material/iron = SMALL_MATERIAL_AMOUNT * 6, \
)

#define AMMO_MATS_HEAVY_TEMP list( \
	/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5, \
	/datum/material/plasma = SMALL_MATERIAL_AMOUNT, \
)
#define AMMO_MATS_HEAVY_EMP list( \
	/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5, \
	/datum/material/uranium = SMALL_MATERIAL_AMOUNT, \
)

#define AMMO_MATS_HEAVY_FAST list( \
	/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5, \
	/datum/material/titanium = SMALL_MATERIAL_AMOUNT, \
)

/obj/item/ammo_casing
	custom_materials = AMMO_MATS_BASIC

// GUN SPRITE OVERRIDES
// BALLISTICS, MOSTLY, PAST THIS POINT

/obj/item/gun/ballistic/shotgun/automatic/combat
	name = "\improper 维和者战斗霰弹枪"
	desc = "一把纳米传讯维和者半自动霰弹枪，配有战术配件和更重的内部结构，旨在持续射击。缺少螺纹枪管。"
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns.dmi'
	worn_icon = 'modular_nova/modules/aesthetics/guns/icons/guns_back.dmi'
	lefthand_file = 'modular_nova/modules/aesthetics/guns/icons/guns_lefthand.dmi'
	righthand_file = 'modular_nova/modules/aesthetics/guns/icons/guns_righthand.dmi'
	inhand_icon_state = "shotgun_combat"
	inhand_x_dimension = 32
	inhand_y_dimension = 32

// de-overrides this particular gun, it uses the tg file
/obj/item/gun/ballistic/shotgun/automatic/combat/compact
	icon = 'icons/obj/weapons/guns/ballistic.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/64x_guns_left.dmi'
	righthand_file = 'icons/mob/inhands/weapons/64x_guns_right.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	worn_icon = null

/obj/item/gun/grenadelauncher
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns.dmi'
	lefthand_file = 'modular_nova/modules/aesthetics/guns/icons/guns_lefthand.dmi'
	righthand_file = 'modular_nova/modules/aesthetics/guns/icons/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/pistol/m1911
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns.dmi'
	inhand_icon_state = "colt"
	lefthand_file = 'modular_nova/modules/aesthetics/guns/icons/guns_lefthand.dmi'
	righthand_file = 'modular_nova/modules/aesthetics/guns/icons/guns_righthand.dmi'

/obj/item/gun/ballistic/automatic/c20r
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns.dmi'

/obj/item/gun/ballistic/automatic/m90
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns.dmi'

/obj/item/gun/ballistic/automatic/pistol
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns.dmi'

/obj/item/gun/ballistic/automatic/pistol/aps
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns.dmi'

/obj/item/gun/ballistic/automatic/pistol/clandestine
	suppressor_x_offset = 17

/obj/item/gun/ballistic/automatic/pistol/doorhickey
	icon = 'icons/obj/weapons/guns/ballistic.dmi'

/obj/item/gun/ballistic/automatic/pistol/deagle
	desc = "一把坚固的.454 Trucidator手枪。"

/obj/item/gun/ballistic/automatic/pistol/deagle/regal
	icon = 'icons/obj/weapons/guns/ballistic.dmi'
	desc = "一把镀金的沙漠之鹰，由卓越的火星枪匠反复锻打百万次而成。使用.454 Trucidator弹药。"

//BEAM SOUNDS
/obj/item/ammo_casing/energy
	fire_sound = 'modular_nova/modules/aesthetics/guns/sound/laser.ogg'

/obj/item/ammo_casing/energy/laser/pulse
	fire_sound = 'modular_nova/modules/aesthetics/guns/sound/pulse.ogg'

/obj/item/gun/energy/laser/xray
	fire_sound_volume = 100

/obj/item/ammo_casing/energy/xray
	fire_sound = 'modular_nova/modules/aesthetics/guns/sound/xray_laser.ogg'

/obj/item/ammo_casing/energy/laser/accelerator
	fire_sound = 'modular_nova/modules/aesthetics/guns/sound/laser_cannon_fire.ogg'

/obj/item/gun/ballistic/automatic/sniper_rifle
	name = "狙击步枪"
	desc = "一种远程武器，能造成显著伤害。不，你不能瞬狙。"
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns_gubman2.dmi'
	icon_state = "sniper"
	w_class = WEIGHT_CLASS_BULKY
	inhand_icon_state = "sniper"
	worn_icon_state = null
	fire_sound = 'sound/items/weapons/gun/sniper/shot.ogg'
	fire_sound_volume = 90
	load_sound = 'sound/items/weapons/gun/sniper/mag_insert.ogg'
	rack_sound = 'sound/items/weapons/gun/sniper/rack.ogg'
	suppressed_sound = 'sound/items/weapons/gun/general/heavy_shot_suppressed.ogg'
	recoil = 2
	weapon_weight = WEAPON_HEAVY
	accepted_magazine_type = /obj/item/ammo_box/magazine/sniper_rounds
	fire_delay = 6 SECONDS
	burst_size = 1
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BACK
	actions_types = list()
	mag_display = TRUE
	suppressor_x_offset = 3
	suppressor_y_offset = 3

/obj/item/gun/ballistic/automatic/sniper_rifle/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 2)

/obj/item/gun/ballistic/automatic/sniper_rifle/reset_fire_cd()
	. = ..()
	if(suppressed)
		playsound(src, 'sound/machines/eject.ogg', 25, TRUE, ignore_walls = FALSE, extrarange = SILENCED_SOUND_EXTRARANGE, falloff_distance = 0)
	else
		playsound(src, 'sound/machines/eject.ogg', 50, TRUE)

/obj/item/gun/ballistic/automatic/sniper_rifle/syndicate
	name = "辛迪加狙击步枪"
	desc = "一把非法改装的.50狙击步枪，兼容消音器。瞬狙依然无效。"
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns_gubman2.dmi'
	icon_state = "sniper2"
	worn_icon_state = "sniper"
	fire_delay = 5.5 SECONDS
	can_suppress = TRUE
	can_unsuppress = TRUE
	pin = /obj/item/firing_pin/implant/pindicate

/obj/item/gun/ballistic/automatic/sniper_rifle/modular
	name = "AUS-107反器材步枪"
	desc = "一把毁灭性的Aussec Armory重型狙击步枪，配备了现代瞄准镜。"
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns_gubman2.dmi'
	icon_state = "sniper"
	worn_icon_state = "sniper"
	fire_sound = 'modular_nova/modules/aesthetics/guns/sound/sniperrifle.ogg'
	suppressed_sound = 'modular_nova/modules/aesthetics/guns/sound/sniperrifle_s.ogg'
	w_class = WEIGHT_CLASS_BULKY
	can_suppress = FALSE

/obj/item/gun/ballistic/automatic/sniper_rifle/modular/syndicate
	name = "'狞猫'反器材步枪"  //we flop out
	desc = "一把流线型、轻量化的无托式.50狙击步枪，采用往复式枪管，被Scarborough Arms昵称为'狞猫'。其紧凑的可折叠部件使其能装入背包，其模块化枪管可将消音器安装在内而非作为枪口延伸件。其先进的瞄准镜能补偿往复式枪管带来的所有弹道误差。"
	icon_state = "sysniper"
	fire_sound = 'modular_nova/modules/aesthetics/guns/sound/sniperrifle.ogg'
	suppressed_sound = 'modular_nova/modules/aesthetics/guns/sound/sniperrifle_s.ogg'
	fire_delay = 4 SECONDS //Delay reduced thanks to recoil absorption
	burst_size = 0.5
	recoil = 1
	can_suppress = TRUE
	can_unsuppress = TRUE
	weapon_weight = WEAPON_LIGHT

/obj/item/gun/ballistic/automatic/sniper_rifle/modular/syndicate/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_SCARBOROUGH)

/obj/item/gun/ballistic/automatic/sniper_rifle/modular/blackmarket  //Normal sniper but epic
	name = "SA-107反器材步枪"
	desc = "一把Scarborough Arms非法仿制的Aussec Armory狙击步枪。这把配备了重型瞄准镜、更坚固的枪托，并有一个可拆卸的枪口制退器，便于安装消音器。"
	icon_state = "sniper2"
	fire_sound = 'modular_nova/modules/aesthetics/guns/sound/sniperrifle.ogg'
	suppressed_sound = 'modular_nova/modules/aesthetics/guns/sound/sniperrifle_s.ogg'
	fire_sound_volume = 90
	vary_fire_sound = FALSE
	load_sound = 'sound/items/weapons/gun/sniper/mag_insert.ogg'
	rack_sound = 'sound/items/weapons/gun/sniper/rack.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	can_suppress = TRUE
	can_unsuppress = TRUE
	recoil = 1.8
	weapon_weight = WEAPON_HEAVY
	accepted_magazine_type = /obj/item/ammo_box/magazine/sniper_rounds
	fire_delay = 55 //Slightly smaller than standard sniper
	burst_size = 1
	slot_flags = ITEM_SLOT_BACK
	mag_display = TRUE

/obj/item/gun/ballistic/automatic/ar/modular
	name = "\improper NT ARG-63"
	desc = "纳米传讯基于斯通纳设计的主要弹道武器选择，配有轻型聚合物框架和其他战术配件，使用.223口径弹药——被特种作战部队昵称为'登舰者'。"
	icon = 'modular_nova/modules/aesthetics/guns/icons/guns_gubman2.dmi'
	icon_state = "arg"
	inhand_icon_state = "arg"
	can_suppress = FALSE

// GUBMAN3 - FULL BULLET RENAME
// no more. we are free
