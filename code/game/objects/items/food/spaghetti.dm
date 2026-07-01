///spaghetti prototype used by all subtypes
/obj/item/food/spaghetti
	icon = 'icons/obj/food/spaghetti.dmi'
	abstract_type = /obj/item/food/spaghetti
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	foodtypes = GRAIN
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2

// Why are you putting cooked spaghetti in your pockets?
/obj/item/food/spaghetti/make_microwaveable()
	var/list/display_message = list(
		span_notice("有什么湿漉漉的东西从他们口袋里掉出来落在地上。那是……[name]？"),
		span_warning("哦该死！你口袋里所有的[name]都掉出来了！"))
	AddComponent(/datum/component/spill, display_message, 'sound/effects/splat.ogg', /datum/memory/lost_spaghetti)

	return ..()

/obj/item/food/spaghetti/raw
	name = "意大利面"
	desc = "这可真是好'意面！"
	icon_state = "spaghetti"
	tastes = list("pasta" = 1)
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/spaghetti/raw/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/spaghetti/boiledspaghetti, rand(15 SECONDS, 20 SECONDS), TRUE, TRUE)

/obj/item/food/spaghetti/raw/make_microwaveable()
	AddElement(/datum/element/microwavable, /obj/item/food/spaghetti/boiledspaghetti)

/obj/item/food/spaghetti/boiledspaghetti
	name = "煮熟的意大利面"
	desc = "一碗朴素的面条，需要更多配料。"
	icon_state = "spaghettiboiled"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/spaghetti/boiledspaghetti/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/ingredients_holder, null, CUSTOM_INGREDIENT_ICON_SCATTER, max_ingredients = 6)

/obj/item/food/spaghetti/pastatomato
	name = "意大利面"
	desc = "意大利面和碎番茄。就像你那虐待成性的父亲以前常做的那样！"
	icon_state = "pastatomato"
	bite_consumption = 4
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/tomatojuice = 10,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("pasta" = 1, "tomato" = 1)
	foodtypes = GRAIN | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/spaghetti/pastatomato/soulful
	name = "灵魂食物"
	desc = "就像妈妈以前做的那样。"
	food_reagents = list(
		// same as normal pasghetti
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/tomatojuice = 10,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		// where the soul comes from
		/datum/reagent/pax = 5,
		/datum/reagent/medicine/psicodine = 10,
		/datum/reagent/medicine/morphine = 5,
	)
	tastes = list("nostalgia" = 1, "happiness" = 1)

/obj/item/food/spaghetti/copypasta
	name = "复制意面"
	desc = "你或许不该尝试这个，总听人们说它有多糟糕……"
	icon_state = "copypasta"
	bite_consumption = 4
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/tomatojuice = 20,
		/datum/reagent/consumable/nutriment/vitamin = 8,
	)
	tastes = list("pasta" = 1, "tomato" = 1)
	foodtypes = GRAIN | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/spaghetti/meatballspaghetti
	name = "意大利面和肉丸"
	desc = "这可真是好'肉丸！"
	icon_state = "meatballspaghetti"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("pasta" = 1, "meat" = 1)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/spaghetti/spesslaw
	name = "spesslaw"
	desc = "律师的最爱。"
	icon_state = "spesslaw"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 20,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("pasta" = 1, "meat" = 1)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 4)

/obj/item/food/spaghetti/chowmein
	name = "炒面"
	desc = "面条与炒蔬菜的美妙组合。"
	icon_state = "chowmein"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("noodle" = 1, "meat" = 1, "fried vegetables" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/spaghetti/beefnoodle
	name = "牛肉面"
	desc = "营养丰富，牛肉味十足，面条筋道。"
	icon_state = "beefnoodle"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/liquidgibs = 3,
	)
	tastes = list("noodles" = 1, "meat" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/spaghetti/butternoodles
	name = "黄油面条"
	desc = "面条裹着咸香的黄油。简单滑溜，但美味可口。"
	icon_state = "butternoodles"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 9,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("noodles" = 1, "butter" = 1)
	foodtypes = GRAIN | DAIRY
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/spaghetti/mac_n_cheese
	name = "mac n' cheese"
	desc = "用最上等的奶酪和面包屑以正宗方式制成。然而，它无法满足与Ready-Donk相同的渴望。"
	icon_state = "mac_n_cheese"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 9,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("cheese" = 1, "breadcrumbs" = 1, "pasta" = 1)
	foodtypes = GRAIN | DAIRY
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/spaghetti/shoyu_tonkotsu_ramen
	name = "酱油豚骨拉面"
	desc = "一种简单的拉面，由肉、蛋、洋葱和一片海苔制成。"
	icon_state = "shoyu_tonkotsu_ramen"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/nutriment/protein = 6,
	)
	tastes = list("noodles" = 5, "meat" = 3, "egg" = 4, "dried seaweed" = 2)
	foodtypes = GRAIN | MEAT | VEGETABLES | EGG
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/spaghetti/kitakata_ramen
	name = "喜多方拉面"
	desc = "一种丰盛的拉面，由肉、蘑菇、洋葱和大蒜组成。常给病人食用以安慰他们"
	icon_state = "kitakata_ramen"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/nutriment/protein = 8,
	)
	tastes = list("noodles" = 5, "meat" = 4, "mushrooms" = 3, "onion" = 2)
	foodtypes = GRAIN | MEAT | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/spaghetti/kitsune_udon
	name = "狐狸乌冬面"
	desc = "一种素食乌冬面，由炸豆腐和洋葱制成，用糖和酱油调出甜咸风味。名字来源于一个关于狐狸喜爱炸豆腐的古老民间故事。"
	icon_state = "kitsune_udon"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 10,
		/datum/reagent/consumable/nutriment/protein = 4,
	)
	tastes = list("noodles" = 5, "tofu" = 4, "sugar" = 3, "soy sauce" = 2)
	foodtypes = GRAIN | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/spaghetti/nikujaga
	name = "nikujaga"
	desc = "一道美味的日式炖菜，包含面条、洋葱、土豆、肉和混合蔬菜。"
	icon_state = "nikujaga"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 16,
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment/protein = 8,
	)
	tastes = list("noodles" = 5, "meat" = 4, "potato" = 3, "onion" = 2, "mixed veggies" = 2)
	foodtypes = GRAIN | VEGETABLES | MEAT
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/spaghetti/pho
	name = "pho"
	desc = "一道越南菜肴，由面条、蔬菜、香草和肉制成。是一种非常受欢迎的街头小吃。"
	icon_state = "pho"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 8,
		/datum/reagent/consumable/nutriment/protein = 8,
	)
	tastes = list("noodles" = 5, "meat" = 4, "cabbage" = 3, "onion" = 2, "herbs" = 2)
	foodtypes = GRAIN | VEGETABLES | MEAT
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/spaghetti/pad_thai
	name = "泰式炒河粉"
	desc = "一道在泰国流行的炒面菜肴，由花生、豆腐、青柠和洋葱制成。"
	icon_state = "pad_thai"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/nutriment/vitamin = 10,
		/datum/reagent/consumable/nutriment/protein = 4,
	)
	tastes = list("noodles" = 5, "fried tofu" = 4, "lime" = 2, "peanut" = 3, "onion" = 2)
	foodtypes = GRAIN | VEGETABLES | NUTS | FRUIT
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/spaghetti/carbonara
	name = "培根蛋酱意大利面"
	desc = "丝滑的鸡蛋，酥脆的猪肉，奶酪的极乐。妈妈咪呀！"
	icon_state = "carbonara"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 10,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("spaghetti" = 1, "parmigiano reggiano" = 1,  "guanciale" = 1)
	foodtypes = GRAIN | MEAT | DAIRY | EGG
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/spaghetti/carbonara/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/love_food_buff, /datum/status_effect/food/speech/italian)
