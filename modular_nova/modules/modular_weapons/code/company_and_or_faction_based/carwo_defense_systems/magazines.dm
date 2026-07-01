// .35 Sol pistol magazines

/obj/item/ammo_box/magazine/c35sol_pistol
	name = "\improper 索尔手枪弹匣"
	desc = "一个太阳联邦手枪的标准尺寸弹匣，可容纳十二发子弹。"

	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/carwo_defense_systems/ammo.dmi'
	icon_state = "pistol_35_standard"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_TINY

	ammo_type = /obj/item/ammo_casing/c35sol
	caliber = CALIBER_SOL35SHORT
	max_ammo = 12

/obj/item/ammo_box/magazine/c35sol_pistol/starts_empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/c35sol_pistol/stendo
	name = "\improper 索尔加长型手枪弹匣"
	desc = "一个用于太阳联邦手枪的加长弹匣，可容纳二十四发子弹。"

	icon_state = "pistol_35_stended"

	w_class = WEIGHT_CLASS_SMALL

	max_ammo = 24

/obj/item/ammo_box/magazine/c35sol_pistol/stendo/starts_empty
	start_empty = TRUE

// .40 Sol rifle magazines

/obj/item/ammo_box/magazine/c40sol_rifle
	name = "\improper 索尔步枪短弹匣"
	desc = "一种为太阳联邦步枪设计的短弹匣，可容纳十五发子弹。"

	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/carwo_defense_systems/ammo.dmi'
	icon_state = "rifle_short"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_TINY

	ammo_type = /obj/item/ammo_casing/c40sol
	caliber = CALIBER_SOL40LONG
	max_ammo = 15

/obj/item/ammo_box/magazine/c40sol_rifle/starts_empty

	start_empty = TRUE

/obj/item/ammo_box/magazine/c40sol_rifle/standard
	name = "\improper 索尔步枪弹匣"
	desc = "一个太阳联邦步枪的标准尺寸弹匣，可容纳三十发子弹。"

	icon_state = "rifle_standard"

	w_class = WEIGHT_CLASS_SMALL

	max_ammo = 30

/obj/item/ammo_box/magazine/c40sol_rifle/standard/starts_empty
	start_empty = TRUE

// .980 grenade magazines

/obj/item/ammo_box/magazine/c980_grenade
	name = "\improper 基博科榴弹盒"
	desc = "一个标准尺寸的.980榴弹弹匣，可容纳四发。"

	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/carwo_defense_systems/ammo.dmi'
	icon_state = "granata_standard"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_SMALL

	ammo_type = /obj/item/ammo_casing/c980grenade
	caliber = CALIBER_980TYDHOUER
	max_ammo = 4

/obj/item/ammo_box/magazine/c980_grenade/thunderdome_fire
	ammo_type = /obj/item/ammo_casing/c980grenade/shrapnel/phosphor

/obj/item/ammo_box/magazine/c980_grenade/thunderdome_shrapnel
	ammo_type = /obj/item/ammo_casing/c980grenade/shrapnel

/obj/item/ammo_box/magazine/c980_grenade/thunderdome_smoke
	ammo_type = /obj/item/ammo_casing/c980grenade/smoke

/obj/item/ammo_box/magazine/c980_grenade/thunderdome_gas
	ammo_type = /obj/item/ammo_casing/c980grenade/riot

/obj/item/ammo_box/magazine/c980_grenade/starts_empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/c980_grenade/drum
	name = "\improper 基博科榴弹鼓"
	desc = "一个用于.980榴弹的弹鼓，可容纳六发。"

	icon_state = "granata_drum"

	w_class = WEIGHT_CLASS_NORMAL

	max_ammo = 6

/obj/item/ammo_box/magazine/c980_grenade/drum/starts_empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/c980_grenade/drum/thunderdome_fire
	ammo_type = /obj/item/ammo_casing/c980grenade/shrapnel/phosphor

/obj/item/ammo_box/magazine/c980_grenade/drum/thunderdome_shrapnel
	ammo_type = /obj/item/ammo_casing/c980grenade/shrapnel

/obj/item/ammo_box/magazine/c980_grenade/drum/thunderdome_smoke
	ammo_type = /obj/item/ammo_casing/c980grenade/smoke

/obj/item/ammo_box/magazine/c980_grenade/drum/thunderdome_gas
	ammo_type = /obj/item/ammo_casing/c980grenade/riot
