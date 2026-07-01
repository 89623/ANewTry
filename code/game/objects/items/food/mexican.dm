/obj/item/food/tortilla
	name = "玉米饼"
	desc = "所有墨西哥卷饼的基础。"
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "tortilla"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("tortilla" = 1)
	foodtypes = GRAIN
	w_class = WEIGHT_CLASS_TINY
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/tortilla/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/hard_taco_shell, rand(15 SECONDS, 30 SECONDS), TRUE, TRUE)

/obj/item/food/burrito
	name = "墨西哥卷饼"
	desc = "玉米饼包裹的美味。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "burrito"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("torilla" = 2, "beans" = 3)
	foodtypes = VEGETABLES|GRAIN
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/cheesyburrito
	name = "芝士卷饼"
	desc = "这是一个塞满芝士的卷饼。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "cheesyburrito"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("torilla" = 2, "beans" = 3, "cheese" = 1)
	foodtypes = VEGETABLES|GRAIN|DAIRY
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/carneburrito
	name = "烤牛肉卷饼"
	desc = "肉食爱好者的最佳卷饼。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "carneburrito"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("torilla" = 2, "meat" = 4)
	foodtypes = VEGETABLES|GRAIN|MEAT
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/fuegoburrito
	name = "等离子辣酱卷饼"
	desc = "一份超级辣的卷饼。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "fuegoburrito"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/capsaicin = 5,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("torilla" = 2, "beans" = 3, "hot peppers" = 1)
	foodtypes = VEGETABLES|GRAIN
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_LEGENDARY
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/nachos
	name = "玉米片"
	desc = "来自太空墨西哥的薯片。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "nachos"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("nachos" = 1)
	foodtypes = GRAIN | FRIED
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/cheesynachos
	name = "芝士玉米片"
	desc = "玉米片与融化芝士的美味组合。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "cheesynachos"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 1,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("nachos" = 2, "cheese" = 1)
	foodtypes = GRAIN | FRIED | DAIRY
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/cubannachos
	name = "cuban nachos"
	desc = "这些玉米片辣得有点危险。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "cubannachos"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 7,
		/datum/reagent/consumable/capsaicin = 8,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("nachos" = 2, "hot pepper" = 1)
	foodtypes = VEGETABLES|FRIED|GRAIN
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/taco
	name = "经典塔可"
	desc = "传统的塔可，包含肉、芝士和生菜。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "taco"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("taco" = 4, "meat" = 2, "cheese" = 2, "lettuce" = 1)
	foodtypes = MEAT | DAIRY | GRAIN | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/taco/plain
	name = "原味塔可"
	desc = "传统的塔可，有肉和芝士，但去掉了兔子吃的菜叶子。"
	icon_state = "taco_plain"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("taco" = 4, "meat" = 2, "cheese" = 2)
	foodtypes = MEAT | DAIRY | GRAIN
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/taco/fish
	name = "鱼肉塔可"
	desc = "包含鱼肉、芝士和卷心菜的塔可。"
	icon_state = "fishtaco"
	tastes = list("taco" = 4, "fish" = 2, "cheese" = 2, "cabbage" = 1)
	foodtypes = SEAFOOD | DAIRY | GRAIN | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = null

/obj/item/food/enchiladas
	name = "恩切拉达"
	desc = "墨西哥万岁！"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "enchiladas"
	bite_consumption = 4
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/capsaicin = 6,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("hot peppers" = 1, "meat" = 3, "cheese" = 1, "sour cream" = 1)
	foodtypes = MEAT|VEGETABLES|GRAIN
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/stuffedlegion
	name = "填充军团"
	desc = "一个被诅咒人类的前头骨，里面填满了歌利亚肉。它还有一个用番茄酱和辣酱装饰的熔岩池。"
	icon_state = "stuffed_legion"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 5,
		/datum/reagent/consumable/capsaicin = 2,
	)
	tastes = list("death" = 2, "rock" = 1, "meat" = 1, "hot peppers" = 1)
	foodtypes = MEAT
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_LEGENDARY
	crafting_complexity = FOOD_COMPLEXITY_5
	crafted_food_buff = /datum/status_effect/food/trait/ashstorm_immune
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/chipsandsalsa
	name = "玉米片配莎莎酱"
	desc = "一些玉米片配一杯风味十足的莎莎酱。极易上瘾！"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "chipsandsalsa"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/capsaicin = 2,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("peppers" = 1, "salsa" = 3, "tortilla chips" = 1, "onion" = 1)
	foodtypes = VEGETABLES|FRIED
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/classic_chimichanga
	name = "经典奇米卷"
	desc = "一个油炸卷饼，里面塞满了大量的肉和奶酪。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "classic_chimichanga"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/nutriment/protein = 6,
	)
	tastes = list("deep-fried tortilla" = 1, "meat" = 3, "cheese" = 1, "onions" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES | DAIRY | FRIED
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/vegetarian_chimichanga
	name = "素食奇米卷"
	desc = "一个油炸卷饼，里面塞满了大量的烤蔬菜，专为不吃肉的人准备。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "vegetarian_chimichanga"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/vitamin = 10,
	)
	tastes = list("deep-fried tortilla" = 1, "cabbage" = 3, "onions" = 1, "peppers" = 1)
	foodtypes = GRAIN | VEGETABLES | FRIED
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/hard_taco_shell
	name = "硬塔可饼皮"
	desc = "一个硬塔可饼皮，正等着被馅料填满。使用食材开始制作自定义塔可吧！"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "hard_taco_shell"
	food_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("hard corn tortilla" = 1)
	foodtypes = GRAIN | FRIED
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/hard_taco_shell/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/ingredients_holder, /obj/item/food/hard_taco_shell/empty, CUSTOM_INGREDIENT_ICON_FILL, max_ingredients = 6)

// empty taco shell for custom tacos
/obj/item/food/hard_taco_shell/empty
	name = "硬壳塔可"
	foodtypes = NONE
	tastes = list()
	icon_state = "hard_taco_shell"
	desc = "一个定制的硬壳塔可。"
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/classic_hard_shell_taco
	name = "经典硬壳塔可"
	desc = "一个经典制作的硬壳塔可，全银河系最令人满足的嘎嘣脆。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "classic_hard_shell_taco"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/nutriment/protein = 6,
	)
	tastes = list("crunchy taco shell" = 1, "cabbage" = 3, "tomatoes" = 1, "ground meat" = 1, "cheese" = 1)
	foodtypes = MEAT|VEGETABLES|GRAIN|DAIRY|FRIED
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/plain_hard_shell_taco
	name = "纯肉硬壳塔可"
	desc = "一个只夹肉的硬壳塔可，为我们所有人心中挑剔的食客和小孩准备。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "plain_hard_shell_taco"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 3,
		/datum/reagent/consumable/nutriment/protein = 6,
	)
	tastes = list("crunchy taco shell" = 1, "ground meat" = 1)
	foodtypes = MEAT|GRAIN|FRIED
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/refried_beans
	name = "墨西哥豆泥"
	desc = "一碗热气腾腾的美味墨西哥豆泥，墨西哥菜系中常见的主食。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "refried_beans"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/nutriment/protein = 4,
	)
	trash_type = /obj/item/reagent_containers/cup/bowl
	tastes = list("mashed beans" = 1, "onion" = 3,)
	foodtypes = VEGETABLES | FRIED
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/spanish_rice
	name = "西班牙米饭"
	desc = "一碗美味的西班牙米饭，用番茄酱烹制而成，赋予了它橙色的色泽。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "spanish_rice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	trash_type = /obj/item/reagent_containers/cup/bowl
	tastes = list("zesty rice" = 1, "tomato sauce" = 3,)
	foodtypes = VEGETABLES|GRAIN
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/pineapple_salsa
	name = "菠萝莎莎酱"
	desc = "一种由菠萝、番茄、洋葱和辣椒制成的非流质莎莎酱。能带来令人愉悦的对比风味。"
	icon = 'icons/obj/food/mexican.dmi'
	icon_state = "pineapple_salsa"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("pineapple" = 4, "tomato" = 3, "onion" = 2, "chili" = 2)
	foodtypes = VEGETABLES | FRUIT | PINEAPPLE
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3
