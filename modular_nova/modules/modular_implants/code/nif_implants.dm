///This is the standard 'baseline' NIF model.
/obj/item/organ/cyberimp/brain/nif/standard
	name = "标准型 NIF"
	desc = "一种向使用者注入纳米机器人的脑部植入物，并暴露了一个神经软件芯片插槽。'标准型'是对高质量纳米植入框架的分类。此类别主要包括具有高可靠性、与使用者无缝结合，以及结合了存储空间和处理能力以运行多种程序的框架模式。"
	manufacturer_notes = "While countless manufacturers produce their own implementation of NIFs, open-source or not, there's less than a thousand Standard-Type models out there in the galaxy. These are the results of almost five years of improvements on older models of Frameworks, and are rather coveted due to being extremely difficult to 'homebrew."

/obj/item/organ/cyberimp/brain/nif/roleplay_model
	name = "经济型 NIF"
	desc = "一种向使用者注入纳米机器人的脑部植入物，并暴露了一个神经软件芯片插槽。'经济型'是对较低质量纳米植入框架的分类。通常，这些是高质量框架的'经济型'非品牌仿制品，具有低等级电源、过时且有风险的构造模式，以及与使用者校准粗糙得多的特点。"
	manufacturer_notes = "Most webspaces for hobbyists or hardcore users, Corpo neurologists, and developers of 'softs such as the Altspace Coven recommend against their purchase. Despite their affordability by the layman, it's a common notion in Framework user circles that a device directly hooked into a user's nervous system is never something which should be skimped on; hence, Econo-Decks typically find themselves in the hands of the truly desperate, criminals, or coming out of workshops as 'homebrews.'"

	max_power_level = 500
	max_nifsofts = 3
	calibration_time = 1 MINUTES
	max_durability = 50
	death_durability_loss = 10


/obj/item/organ/cyberimp/brain/nif/roleplay_model/cheap
	name = "试用轻量型 NIF"
	desc = "一种向使用者注入纳米机器人的脑部植入物，并暴露了一个神经软件芯片插槽。'试用轻量型'是对临时性纳米植入框架的分类。这些通常用于促销活动、单用途 NIFsoft 的使用，或在一些公司经销商处为潜在用户提供体验。通常，试用轻量型框架实际上不会与使用者'结合'，在几小时内形成极其松散的连接后，便会分解成分散且死亡的纳米机器，通常通过呼气排出。"
	manufacturer_notes = "Normally, Trial-Lite frameworks do not actually 'bond' with their user, forming an extremely loose connection before dissolving into scattered and dead nanomachines within a few hours, typically exhaled. It's so far been impossible to extend the lifespan of a Trial-Lite NIF, owing to their far inferior construction and programming."
	nif_persistence = FALSE

/obj/item/autosurgeon/organ/nif/disposable //Disposable, as in the fact that this only lasts for one shift
	name = "经济型自动手术仪"
	starting_organ = /obj/item/organ/cyberimp/brain/nif/roleplay_model/cheap
	uses = 1

/obj/item/organ/cyberimp/brain/nif/standard/ghost_role
	nif_persistence = FALSE
	is_calibrated = TRUE

/obj/item/autosurgeon/organ/nif/ghost_role
	name = "增强型标准 NIF 自动手术仪"
	starting_organ = /obj/item/organ/cyberimp/brain/nif/standard/ghost_role
	uses = 1
