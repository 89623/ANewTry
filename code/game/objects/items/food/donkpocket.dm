////////////////////////////////////////////DONK POCKETS////////////////////////////////////////////

/obj/item/food/donkpocket
	name = "\improper 当克口袋"
	desc = "经验丰富的叛徒的首选食物。"
	icon_state = "donkpocket"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 2,
	)
	tastes = list("umami" = 2, "dough" = 2, "laziness" = 1)
	foodtypes = GRAIN
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

	/// What type of donk pocket we're warmed into via baking or microwaving.
	var/warm_type = /obj/item/food/donkpocket/warm
	/// Whether baking/microwaving it yields a positive result
	var/positive_result = TRUE
	/// The lower end for how long it takes to bake
	var/baking_time_short = 25 SECONDS
	/// The upper end for how long it takes to bake
	var/baking_time_long = 30 SECONDS
	/// The amount of omnizine added when it's cooked.
	var/omnizine_to_add = 6

/obj/item/food/donkpocket/make_bakeable()
	AddComponent(/datum/component/bakeable, warm_type, rand(baking_time_short, baking_time_long), positive_result, TRUE, list(/datum/reagent/medicine/omnizine = omnizine_to_add))

/obj/item/food/donkpocket/make_microwaveable()
	AddElement(/datum/element/microwavable, warm_type, string_assoc_list(list(/datum/reagent/medicine/omnizine = omnizine_to_add)), bad_recipe = !positive_result)

/obj/item/food/donkpocket/warm
	name = "温热的唐克口袋饼"
	desc = "经验丰富的叛徒的首选热食。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/medicine/omnizine = 6,
	)
	tastes = list("umami" = 2, "dough" = 2, "laziness" = 1)
	foodtypes = GRAIN

	// Warmed donk pockets will burn if you leave them in the oven or microwave.
	warm_type = /obj/item/food/badrecipe
	positive_result = FALSE
	baking_time_short = 10 SECONDS
	baking_time_long = 15 SECONDS
	omnizine_to_add = 0

/obj/item/food/donkpocket/homemade
	foodtypes = MEAT|GRAIN
	tastes = list("meat" = 2, "dough" = 2, "comfiness" = 1)
	warm_type = /obj/item/food/donkpocket/warm/homemade
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/donkpocket/warm/homemade
	foodtypes = MEAT|GRAIN
	tastes = list("meat" = 2, "dough" = 2, "comfiness" = 1)
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/donkpocket/dank
	name = "\improper 丹克口袋"
	desc = "经验丰富的植物学家的首选食物。"
	icon_state = "dankpocket"
	food_reagents = list(
		/datum/reagent/toxin/lipolicide = 3,
		/datum/reagent/drug/space_drugs = 3,
		/datum/reagent/consumable/nutriment = 4,
	)
	tastes = list("weed" = 2, "dough" = 2)
	foodtypes = GRAIN|VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_2
	warm_type = /obj/item/food/donkpocket/warm/dank
	omnizine_to_add = 2

/obj/item/food/donkpocket/warm/dank
	name = "温热的丹克口袋饼"
	desc = "经验丰富的植物学家的首选食物。"
	icon_state = "dankpocket"
	food_reagents = list(
		/datum/reagent/toxin/lipolicide = 3,
		/datum/reagent/drug/space_drugs = 3,
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/medicine/omnizine = 2,
	)
	tastes = list("weed" = 2, "dough" = 2)
	foodtypes = GRAIN|VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/donkpocket/spicy
	name = "\improper 辣味口袋"
	desc = "经典小吃，现在加入了受热激活的辛辣风味。"
	icon_state = "donkpocketspicy"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/capsaicin = 2,
	)
	tastes = list("umami" = 2, "dough" = 2, "spice" = 1)
	foodtypes = VEGETABLES|GRAIN
	warm_type = /obj/item/food/donkpocket/warm/spicy
	omnizine_to_add = 2

/obj/item/food/donkpocket/warm/spicy
	name = "温热的辣味口袋"
	desc = "经典小吃，现在可能有点太辣了。"
	icon_state = "donkpocketspicy"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/medicine/omnizine = 2,
		/datum/reagent/consumable/capsaicin = 5,
	)
	tastes = list("umami" = 2, "dough" = 2, "weird spices" = 2)
	foodtypes = VEGETABLES|GRAIN

/obj/item/food/donkpocket/spicy/homemade
	tastes = list("meat" = 2, "dough" = 2, "spice" = 1)
	foodtypes = MEAT|VEGETABLES|GRAIN
	warm_type = /obj/item/food/donkpocket/warm/spicy/homemade
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/donkpocket/warm/spicy/homemade
	tastes = list("meat" = 2, "dough" = 2, "weird spices" = 1)
	foodtypes = MEAT|VEGETABLES|GRAIN
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/donkpocket/teriyaki
	name = "\improper 照烧口袋"
	desc = "对经典空间站小吃的东亚风味演绎。"
	icon_state = "donkpocketteriyaki"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/soysauce = 2,
	)
	tastes = list("umami" = 2, "dough" = 2, "soy sauce" = 2)
	foodtypes = GRAIN
	warm_type = /obj/item/food/donkpocket/warm/teriyaki
	omnizine_to_add = 2

/obj/item/food/donkpocket/warm/teriyaki
	name = "温热的照烧口袋"
	desc = "对经典空间站小吃的东亚风味演绎，现在热气腾腾、温暖可口。"
	icon_state = "donkpocketteriyaki"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/medicine/omnizine = 2,
		/datum/reagent/consumable/soysauce = 2,
	)
	tastes = list("umami" = 2, "dough" = 2, "soy sauce" = 2)
	foodtypes = GRAIN

/obj/item/food/donkpocket/teriyaki/homemade
	tastes = list("meat" = 2, "dough" = 2, "soy sauce" = 2)
	foodtypes = MEAT|GRAIN
	warm_type = /obj/item/food/donkpocket/warm/teriyaki/homemade
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/donkpocket/warm/teriyaki/homemade
	tastes = list("meat" = 2, "dough" = 2, "soy sauce" = 2)
	foodtypes = MEAT|GRAIN
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/donkpocket/pizza
	name = "\improper 披萨口袋"
	desc = "美味、多奶酪，而且出奇地管饱。"
	icon_state = "donkpocketpizza"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/tomatojuice = 2,
	)
	tastes = list("tomato" = 2, "dough" = 2, "cheese"= 2)
	foodtypes = VEGETABLES|GRAIN|DAIRY
	warm_type = /obj/item/food/donkpocket/warm/pizza
	omnizine_to_add = 2

/obj/item/food/donkpocket/warm/pizza
	name = "温热的披萨口袋"
	desc = "美味、多奶酪，热的时候更棒。"
	icon_state = "donkpocketpizza"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/medicine/omnizine = 2,
		/datum/reagent/consumable/tomatojuice = 2,
	)
	tastes = list("tomato" = 2, "dough" = 2, "melty cheese"= 2)
	foodtypes = VEGETABLES|GRAIN|DAIRY

/obj/item/food/donkpocket/honk
	name = "\improper 轰克口袋"
	desc = "这款获奖的唐克口袋赢得了小丑和人类的一致喜爱。"
	icon_state = "donkpocketbanana"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/banana = 4,
	)
	tastes = list("banana" = 2, "dough" = 2, "children's antibiotics" = 1)
	foodtypes = GRAIN|FRUIT|SUGAR
	warm_type = /obj/item/food/donkpocket/warm/honk
	crafting_complexity = FOOD_COMPLEXITY_3
	var/static/list/honk_added_reagents = list(
		/datum/reagent/medicine/omnizine = 2,
		/datum/reagent/consumable/laughter = 6,
	)
	custom_materials = null

/obj/item/food/donkpocket/honk/make_bakeable()
	AddComponent(/datum/component/bakeable, warm_type, rand(baking_time_short, baking_time_long), positive_result, TRUE, honk_added_reagents)

/obj/item/food/donkpocket/honk/make_microwaveable()
	AddElement(/datum/element/microwavable, warm_type, honk_added_reagents, positive_result)

/obj/item/food/donkpocket/warm/honk
	name = "温热的轰克口袋"
	desc = "这款获奖的唐克口袋，现在温暖又酥脆。"
	icon_state = "donkpocketbanana"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/medicine/omnizine = 2,
		/datum/reagent/consumable/banana = 4,
		/datum/reagent/consumable/laughter = 6,
	)
	tastes = list("banana" = 2, "dough" = 2, "children's antibiotics" = 1)
	foodtypes = GRAIN|FRUIT|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = null

/obj/item/food/donkpocket/berry
	name = "\improper 浆果口袋"
	desc = "一种极其甜腻的唐克口袋，最初为“甜点风暴行动”而创造。"
	icon_state = "donkpocketberry"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/berryjuice = 3,
	)
	tastes = list("dough" = 2, "jam" = 2)
	foodtypes = GRAIN|FRUIT|SUGAR
	warm_type = /obj/item/food/donkpocket/warm/berry
	custom_materials = null
	omnizine_to_add = 2

/obj/item/food/donkpocket/warm/berry
	name = "温热的浆果口袋"
	desc = "一种极其甜腻的唐克口袋，现在温暖又美味。"
	icon_state = "donkpocketberry"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/medicine/omnizine = 2,
		/datum/reagent/consumable/berryjuice = 3,
	)
	tastes = list("dough" = 2, "warm jam" = 2)
	foodtypes = GRAIN|FRUIT|SUGAR
	custom_materials = null

/obj/item/food/donkpocket/gondola
	name = "\improper 冈多拉口袋包"
	desc = "在配方中使用真正的冈多拉肉的选择颇具争议，至少可以这么说。" //Only a monster would craft this.
	icon_state = "donkpocketgondola"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/gondola_mutation_toxin = 5,
	)
	tastes = list("meat" = 2, "dough" = 2, "inner peace" = 1)
	foodtypes = GRAIN|MEAT

	warm_type = /obj/item/food/donkpocket/warm/gondola
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)
	var/static/list/gondola_added_reagents = list(
		/datum/reagent/medicine/omnizine = 2,
		/datum/reagent/gondola_mutation_toxin = 5,
	)

/obj/item/food/donkpocket/gondola/make_bakeable()
	AddComponent(/datum/component/bakeable, warm_type, rand(baking_time_short, baking_time_long), positive_result, TRUE, gondola_added_reagents)

/obj/item/food/donkpocket/gondola/make_microwaveable()
	AddElement(/datum/element/microwavable, warm_type, gondola_added_reagents, positive_result)

/obj/item/food/donkpocket/warm/gondola
	name = "温热的冈多拉口袋包"
	desc = "在配方中使用真正的冈多拉肉的选择颇具争议，至少可以这么说。"
	icon_state = "donkpocketgondola"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/medicine/omnizine = 2,
		/datum/reagent/gondola_mutation_toxin = 10,
	)
	tastes = list("meat" = 2, "dough" = 2, "inner peace" = 1)
	foodtypes = GRAIN|MEAT
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/donkpocket/deluxe
	name = "\improper 唐克口袋包豪华版"
	desc = "唐克公司的最新产品。其配方是严格保密的。"
	icon_state = "donkpocketdeluxe"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/medicine/omnizine = 2,
	)
	tastes = list("quality meat" = 2, "dough" = 2, "raw fanciness" = 1)
	foodtypes = GRAIN|MEAT|VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_4

	warm_type = /obj/item/food/donkpocket/warm/deluxe
	var/static/list/deluxe_added_reagents = list(
		/datum/reagent/medicine/omnizine = 8,
	)
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/donkpocket/deluxe/make_bakeable()
	AddComponent(/datum/component/bakeable, warm_type, rand(baking_time_short, baking_time_long), positive_result, TRUE, deluxe_added_reagents)

/obj/item/food/donkpocket/deluxe/make_microwaveable()
	AddElement(/datum/element/microwavable, warm_type, deluxe_added_reagents, positive_result)

/obj/item/food/donkpocket/warm/deluxe
	name = "温热的唐克口袋包豪华版"
	desc = "唐克公司的最新产品。它酥脆温热，烤得恰到好处。天哪，这唐克包看起来真不错。"
	icon_state = "donkpocketdeluxe"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/medicine/omnizine = 10,
	)
	tastes = list("quality meat" = 2, "dough" = 2, "fanciness" = 1)
	foodtypes = GRAIN|MEAT|VEGETABLES|FRIED
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/donkpocket/deluxe/nocarb
	name = "\improper 肉口袋包"
	desc = "食肉叛徒的首选食物。"
	icon_state = "donkpocketdeluxenocarb"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/medicine/omnizine = 2,
	)
	tastes = list("raw meat" = 2, "more meat" = 2, "no carbs" = 1)
	foodtypes = MEAT|RAW
	crafting_complexity = FOOD_COMPLEXITY_4
	warm_type = /obj/item/food/donkpocket/warm/deluxe/nocarb
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 4)

/obj/item/food/donkpocket/warm/deluxe/nocarb
	name = "温热的肉口袋包"
	desc = "食肉叛徒的首选温热食物。"
	icon_state = "donkpocketdeluxenocarb"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/medicine/omnizine = 10,
	)
	tastes = list("meat" = 2, "more meat" = 2, "no carbs" = 1)
	foodtypes = MEAT
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 4)

/obj/item/food/donkpocket/deluxe/vegan
	name = "\improper 唐克卷"
	desc = "经典的太空站小吃，现在加入了米饭！经动物解放阵线认证为纯素且无残忍。"
	icon_state = "donkpocketdeluxevegan"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/vitamin = 3,
		/datum/reagent/medicine/omnizine = 2,
	)
	tastes = list("rice patty" = 2, "dough" = 2, "peppery kick" = 1)
	foodtypes = GRAIN | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_4
	warm_type = /obj/item/food/donkpocket/warm/deluxe/vegan
	custom_materials = null

/obj/item/food/donkpocket/warm/deluxe/vegan
	name = "温热的唐克卷"
	desc = "经典的太空站小吃，现在加入了米饭！它被炸得恰到好处。"
	icon_state = "donkpocketdeluxevegan"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/vitamin = 3,
		/datum/reagent/medicine/omnizine = 10,
	)
	tastes = list("rice patty" = 2, "fried dough" = 2, "peppery kick" = 1)
	foodtypes = GRAIN | VEGETABLES | FRIED
	custom_materials = null
