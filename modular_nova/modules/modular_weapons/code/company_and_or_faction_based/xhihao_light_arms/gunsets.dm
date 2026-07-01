// Contains the Bogseo submachinegun, excellent for breaking shoulders
/obj/item/storage/toolbox/guncase/nova/xhihao_large_case/bogseo
	name = "\improper 西豪'博格瑟'枪械套装"
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/xhihao_smg/no_mag
	extra_to_spawn = /obj/item/ammo_box/magazine/c585trappiste_pistol/spawns_empty

/obj/item/storage/toolbox/guncase/nova/xhihao_large_case/bogseo/PopulateContents()
	. = ..()
	generate_items_inside(list(
		/obj/item/ammo_box/c585trappiste/incapacitator = 1,
		/obj/item/ammo_box/c585trappiste = 1,
	), src)
