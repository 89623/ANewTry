/obj/item/food/eggplantparm
	name = "帕尔马干酪茄子"
	desc = "茄子唯一好吃的做法。"
	icon_state = "eggplantparm"

	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("eggplant" = 3, "cheese" = 1)
	foodtypes = VEGETABLES | DAIRY
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/yakiimo
	name = "烤红薯"
	desc = "用烤红薯制成！"
	icon_state = "yakiimo"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("sweet potato" = 1)
	foodtypes = VEGETABLES | SUGAR
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/roastparsnip
	name = "烤欧洲萝卜"
	desc = "香甜酥脆。"
	icon_state = "roastparsnip"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("parsnip" = 1)
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

// Potatoes
/obj/item/food/tatortot
	name = "土豆块"
	desc = "一大块油炸土豆块，它可能会也可能不会试图把你“合法击杀”。"
	icon_state = "tatortot"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4)
	tastes = list("potato" = 3, "valids" = 1)
	foodtypes = FRIED | VEGETABLES
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/tatortot/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/dunkable, 10)

/obj/item/food/mashed_potatoes
	name = "土豆泥"
	desc = "一份奶油状的土豆泥，是许多感恩节晚餐的主食。"
	icon = 'icons/obj/food/food.dmi'
	icon_state = "mashed_potatoes"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 10,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("creamy mashed potatoes" = 1, "garlic" = 1)
	foodtypes = VEGETABLES | DAIRY
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/baked_potato
	name = "烤土豆"
	desc = "刚从烤箱里拿出来的滚烫土豆。单吃有点寡淡。"
	icon_state = "baked_potato"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("baked potato" = 1)
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/buttered_baked_potato
	name = "黄油烤土豆"
	desc = "一个滚烫的烤土豆，现在混入了一片黄油。完美。"
	icon_state = "buttered_baked_potato"
	food_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("baked potato" = 1)
	foodtypes = VEGETABLES | DAIRY
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/loaded_baked_potato
	name = "满载烤土豆"
	desc = "一个滚烫的烤土豆，里面的土豆肉被挖出并与培根碎、奶酪和卷心菜混合。"
	icon_state = "loaded_baked_potato"
	food_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 6, /datum/reagent/consumable/nutriment/protein = 4)
	tastes = list("baked potato" = 1, "bacon" = 1, "cheese" = 1, "cabbage" = 1)
	foodtypes = VEGETABLES | DAIRY | MEAT
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

// Fries
/obj/item/food/fries
	name = "太空薯条"
	desc = "又名：法式薯条、自由薯条，等等。"
	icon_state = "fries"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4)
	tastes = list("fries" = 3, "salt" = 1)
	foodtypes = VEGETABLES | FRIED
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_CHEAP
	preserved_food = TRUE
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/fries/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/dunkable, 10)

/obj/item/food/cheesyfries
	name = "芝士薯条"
	desc = "薯条。上面覆盖着奶酪。废话。"
	icon_state = "cheesyfries"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("fries" = 3, "cheese" = 1)
	foodtypes = VEGETABLES|DAIRY|FRIED
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_CHEAP
	preserved_food = TRUE
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/cheesyfries/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/dunkable, 10)

/obj/item/food/carrotfries
	name = "胡萝卜薯条"
	desc = "用新鲜胡萝卜制成的美味薯条。"
	icon_state = "carrotfries"

	food_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("carrots" = 3, "salt" = 1)
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	preserved_food = TRUE
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/carrotfries/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/dunkable, 10)

/obj/item/food/poutine
	name = "肉汁奶酪薯条"
	desc = "覆盖着奶酪凝块和肉汁的薯条。"
	icon_state = "poutine"
	food_reagents = list(/datum/reagent/consumable/nutriment = 7)
	tastes = list("potato" = 3, "gravy" = 1, "squeaky cheese" = 1)
	foodtypes = VEGETABLES|DAIRY|FRIED|MEAT
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_CHEAP
	preserved_food = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/poutine/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/dunkable, 10)

/obj/item/food/sauteed_eggplant
	name = "炒茄子"
	desc = "厚切茄子片在油和蒜末中翻炒，制成一道柔软、酥脆、健康的小吃。"
	icon_state = "sauteed_eggplant"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("fried eggplant" = 4, "garlic" = 2, "olive oil" = 3)
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/baba_ghanoush
	name = "巴巴嘎努什"
	desc = "一种由茄子泥、橄榄油、大蒜和柠檬汁制成的浓稠蘸酱，配以皮塔饼蘸食。你会要么爱它，要么恨它。"
	icon_state = "baba_ghanoush"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("mashed eggplant" = 5, "pita bread" = 4, "garlic" = 3, "olive oil" = 4, "lemon juice" = 2)
	foodtypes = VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/falafel
	name = "法拉费"
	desc = "豆类、香草、洋葱和大蒜捣碎后捏成球状，然后油炸。香草使内部呈现出独特的绿色。"
	icon_state = "falafel"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("fava beans" = 5, "garlic" = 3, "onion" = 2, "fresh herbs" = 4)
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3
