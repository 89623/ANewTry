/datum/supply_pack/security/armory/sindano
	name = "辛达诺冲锋枪板条箱"
	desc = "三套完全专有的辛达诺套件，使用.35索尔短弹。每套包含三个空弹匣以及一盒非致命弹和一盒致命弹。"
	cost = CARGO_CRATE_VALUE * 10
	contains = list(
		/obj/item/storage/toolbox/guncase/nova/carwo_large_case/sindano = 3,
	)
	crate_name = "Sindano Submachinegun Crate"

/datum/supply_pack/security/armory/renoster
	name = "M64防暴霰弹枪板条箱"
	desc = "三把M64 12号口径防暴霰弹枪，每把配有相应的弹药带。"
	cost = CARGO_CRATE_VALUE * 10
	contains = list(
		/obj/item/gun/ballistic/shotgun/riot/sol = 3,
		/obj/item/storage/belt/bandolier = 3,
	)
	crate_name = "M64 Riot Shotgun Crate"

/datum/supply_pack/security/armory/kiboko
	name = "基博科榴弹发射器板条箱"
	desc = "包含一把基博科榴弹发射器，用于替换军械库中的那把，以及随附的装备。"
	cost = CARGO_CRATE_VALUE * 30
	contains = list(
		/obj/item/storage/toolbox/guncase/nova/carwo_large_case/kiboko_magless = 1,
		/obj/item/ammo_box/c980grenade = 2,
		/obj/item/ammo_box/c980grenade/smoke = 1,
		/obj/item/ammo_box/c980grenade/riot = 1,
	)
	crate_name = "Kiboko Grenade Launcher Crate"

/datum/supply_pack/security/armory/short_mod_laser
	name = "模块化激光卡宾枪板条箱"
	desc = "五把'星'式模块化激光卡宾枪，这种紧凑型能量武器可以快速重新配置为不同的射击模式。"
	cost = CARGO_CRATE_VALUE * 12
	contains = list(
		/obj/item/gun/energy/modular_laser_rifle/carbine,
		/obj/item/gun/energy/modular_laser_rifle/carbine,
		/obj/item/gun/energy/modular_laser_rifle/carbine,
		/obj/item/gun/energy/modular_laser_rifle/carbine,
		/obj/item/gun/energy/modular_laser_rifle/carbine,
	)
	crate_name = "\improper Modular Laser Carbine Crate"

/datum/supply_pack/security/armory/big_mod_laser
	name = "模块化激光步枪板条箱"
	desc = "三把'彗星'式模块化激光步枪，这种笨重的能量武器可以快速重新配置为不同的射击模式。"
	cost = CARGO_CRATE_VALUE * 12
	contains = list(
		/obj/item/gun/energy/modular_laser_rifle,
		/obj/item/gun/energy/modular_laser_rifle,
		/obj/item/gun/energy/modular_laser_rifle,
	)
	crate_name = "\improper Modular Laser Rifle Crate"
