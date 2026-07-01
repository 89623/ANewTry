/obj/item/food/icecreamsandwich
	name = "冰淇淋三明治"
	desc = "自带包装的便携式冰淇淋。"
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "icecreamsandwich"
	w_class = WEIGHT_CLASS_TINY
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/ice = 4,
	)
	tastes = list("ice cream" = 1)
	foodtypes = GRAIN | DAIRY | SUGAR
	food_flags = FOOD_FINGER_FOOD
	crafting_complexity = FOOD_COMPLEXITY_2
	crafted_food_buff = /datum/status_effect/food/chilling

/obj/item/food/strawberryicecreamsandwich
	name = "草莓冰淇淋三明治"
	desc = "草莓口味的便携式冰淇淋，自带包装。"
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "strawberryicecreamsandwich"
	w_class = WEIGHT_CLASS_TINY
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/ice = 4,
	)
	tastes = list("ice cream" = 2, "berry" = 2)
	foodtypes = GRAIN|FRUIT|DAIRY|SUGAR
	food_flags = FOOD_FINGER_FOOD
	crafting_complexity = FOOD_COMPLEXITY_3
	crafted_food_buff = /datum/status_effect/food/chilling

/obj/item/food/spacefreezy
	name = "太空冰爽"
	desc = "太空里最好的冰淇淋。"
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "spacefreezy"
	w_class = WEIGHT_CLASS_TINY
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/bluecherryjelly = 5,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("blue cherries" = 2, "ice cream" = 2)
	foodtypes = GRAIN|FRUIT|DAIRY|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3
	crafted_food_buff = /datum/status_effect/food/chilling

/obj/item/food/spacefreezy/make_edible()
	. = ..()
	AddComponent(/datum/component/ice_cream_holder)

/obj/item/food/sundae
	name = "圣代"
	desc = "一道经典甜点。"
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "sundae"
	w_class = WEIGHT_CLASS_SMALL
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/banana = 5,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("ice cream" = 1, "banana" = 1)
	foodtypes = GRAIN|FRUIT|DAIRY|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3
	crafted_food_buff = /datum/status_effect/food/chilling

/obj/item/food/sundae/make_edible()
	. = ..()
	AddComponent(/datum/component/ice_cream_holder, y_offset = -2, sweetener = /datum/reagent/consumable/caramel)

/obj/item/food/honkdae
	name = "小丑代"
	desc = "小丑最爱的甜点。"
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "honkdae"
	w_class = WEIGHT_CLASS_SMALL
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/banana = 10,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("ice cream" = 1, "banana" = 1, "a bad joke" = 1)
	foodtypes = GRAIN|FRUIT|DAIRY|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_4
	crafted_food_buff = /datum/status_effect/food/chilling

/obj/item/food/honkdae/make_edible()
	. = ..()
	AddComponent(/datum/component/ice_cream_holder, y_offset = -2) //The sugar will react with the banana forming laughter. Honk!

/////////////
//SNOWCONES//
/////////////

/obj/item/food/snowcones //We use this as a base for all other snowcones
	name = "原味刨冰"
	desc = "这只是刨冰。不过嚼起来还是挺有趣的。"
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "flavorless_sc"
	w_class = WEIGHT_CLASS_SMALL
	trash_type = /obj/item/reagent_containers/cup/glass/sillycup //We dont eat paper cups
	food_reagents = list(
		/datum/reagent/water = 11,
	) // We dont get food for water/juices
	tastes = list("ice" = 1, "water" = 1)
	foodtypes = SUGAR //We use SUGAR as a base line to act in as junkfood, other wise we use fruit
	food_flags = FOOD_FINGER_FOOD
	crafting_complexity = FOOD_COMPLEXITY_2
	crafted_food_buff = /datum/status_effect/food/chilling

/obj/item/food/snowcones/on_craft_completion(list/components, datum/crafting_recipe/food/current_recipe, atom/crafter)
	. = ..()
	// replaces the ice from the input with water
	reagents.remove_reagent(/datum/reagent/consumable/ice, 15)
	reagents.add_reagent(/datum/reagent/water, 11)
	// then add 1u nutriment for free
	reagents.add_reagent(/datum/reagent/consumable/nutriment, 1)
	// the juice component will be transferred in from crafting

/obj/item/food/snowcones/lime
	name = "青柠雪糕筒"
	desc = "青柠糖浆淋在纸杯中的雪球上。"
	icon_state = "lime_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/limejuice = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "limes" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/lemon
	name = "柠檬雪糕筒"
	desc = "柠檬糖浆淋在纸杯中的雪球上。"
	icon_state = "lemon_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/lemonjuice = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "lemons" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/apple
	name = "苹果雪糕筒"
	desc = "苹果糖浆淋在纸杯中的雪球上。"
	icon_state = "amber_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/applejuice = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "apples" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/grape
	name = "葡萄雪糕筒"
	desc = "葡萄糖浆淋在纸杯中的雪球上。"
	icon_state = "grape_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/grapejuice = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "grape" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/orange
	name = "橙子雪糕筒"
	desc = "橙子糖浆淋在纸杯中的雪球上。"
	icon_state = "orange_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/orangejuice = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "orange" = 5)
	foodtypes = FRUIT | ORANGES

/obj/item/food/snowcones/blue
	name = "蓝莓雪糕筒"
	desc = "蓝莓糖浆淋在纸杯中的雪球上，多么罕见！"
	icon_state = "blue_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/bluecherryjelly = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "blue" = 5, "cherries" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/red
	name = "樱桃雪糕筒"
	desc = "樱桃糖浆淋在纸杯中的雪球上。"
	icon_state = "red_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/cherryjelly = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "red" = 5, "cherries" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/berry
	name = "浆果雪糕筒"
	desc = "浆果糖浆淋在纸杯中的雪球上。"
	icon_state = "berry_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/berryjuice = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "berries" = 5)
	foodtypes = FRUIT

/obj/item/food/snowcones/fruitsalad
	name = "水果沙拉雪糕筒"
	desc = "多种柑橘糖浆的美妙混合，淋在纸杯中的雪球上。"
	icon_state = "fruitsalad_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/lemonjuice = 5,
		/datum/reagent/consumable/limejuice = 5,
		/datum/reagent/consumable/orangejuice = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "oranges" = 5, "limes" = 5, "lemons" = 5, "citrus" = 5, "salad" = 5)
	foodtypes = FRUIT | ORANGES

/obj/item/food/snowcones/pineapple
	name = "菠萝雪糕筒"
	desc = "菠萝糖浆淋在纸杯中的雪球上。"
	icon_state = "pineapple_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/pineapplejuice = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "pineapples" = 5)
	foodtypes = PINEAPPLE //Pineapple to allow all that like pineapple to enjoy

/obj/item/food/snowcones/mime
	name = "默剧雪糕筒"
	desc = "..."
	icon_state = "mime_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nothing = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "nothing" = 5)
	foodtypes = SUGAR

/obj/item/food/snowcones/clown
	name = "小丑雪糕筒"
	desc = "笑声淋在纸杯中的雪球上。"
	icon_state = "clown_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/laughter = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "jokes" = 5, "brainfreeze" = 5, "joy" = 5)
	foodtypes = SUGAR | FRUIT

/obj/item/food/snowcones/soda
	name = "太空可乐雪糕筒"
	desc = "太空可乐淋在纸杯中的雪球上。"
	icon_state = "soda_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/space_cola = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "cola" = 5)
	foodtypes = SUGAR

/obj/item/food/snowcones/spacemountainwind
	name = "space mountain wind snowcone"
	desc = "太空山风淋在纸杯中的雪球上。"
	icon_state = "mountainwind_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/spacemountainwind = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "mountain wind" = 5)
	foodtypes = SUGAR


/obj/item/food/snowcones/pwrgame
	name = "能量游戏雪糕筒"
	desc = "能量游戏汽水淋在纸杯中的雪球上。"
	icon_state = "pwrgame_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/pwr_game = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "valid" = 5, "salt" = 5, "wats" = 5)
	foodtypes = SUGAR

/obj/item/food/snowcones/honey
	name = "蜂蜜雪糕筒"
	desc = "蜂蜜淋在纸杯中的雪球上。"
	icon_state = "amber_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/honey = 5,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "flowers" = 5, "sweetness" = 5, "wax" = 1)
	foodtypes = SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/snowcones/rainbow
	name = "彩虹雪糕筒"
	desc = "纸杯中一个色彩斑斓的雪球。"
	icon_state = "rainbow_sc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/laughter = 25,
		/datum/reagent/water = 11,
	)
	tastes = list("ice" = 1, "water" = 1, "sunlight" = 5, "light" = 5, "slime" = 5, "paint" = 3, "clouds" = 3)
	foodtypes = SUGAR

/obj/item/food/popsicle
	name = "虫子冰棒"
	desc = "嗯，这东西本不该存在。"
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "popsicle_stick_s"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/cream = 2,
		/datum/reagent/consumable/vanilla = 2,
		/datum/reagent/consumable/sugar = 4,
	)
	tastes = list("beetle juice")
	trash_type = /obj/item/popsicle_stick
	w_class = WEIGHT_CLASS_SMALL
	foodtypes = DAIRY | SUGAR
	food_flags = FOOD_FINGER_FOOD
	crafting_complexity = FOOD_COMPLEXITY_3
	crafted_food_buff = /datum/status_effect/food/chilling

	var/overlay_state = "creamsicle_o" //This is the edible part of the popsicle.
	var/bite_states = 4 //This value value is used for correctly setting the bite_consumption to ensure every bite changes the sprite. Do not set to zero.
	var/bitecount = 0


/obj/item/food/popsicle/Initialize(mapload)
	. = ..()
	bite_consumption = reagents.total_volume / bite_states
	update_icon() // make sure the popsicle overlay is primed so it's not just a stick until you start eating it

/obj/item/food/popsicle/make_edible()
	. = ..()
	AddComponentFrom(SOURCE_EDIBLE_INNATE, /datum/component/edible, after_eat = CALLBACK(src, PROC_REF(after_bite)))

/obj/item/food/popsicle/update_overlays()
	. = ..()
	if(!bitecount)
		. += initial(overlay_state)
		return
	. += "[initial(overlay_state)]_[min(bitecount, 3)]"

/obj/item/food/popsicle/proc/after_bite(mob/living/eater, mob/living/feeder, bitecount)
	src.bitecount = bitecount
	update_appearance()

/obj/item/popsicle_stick
	name = "冰棒棍"
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "popsicle_stick"
	desc = "这根不起眼的小棍子通常承载着一份冰冻的甜点，此刻它似乎从这阿特拉斯式的负担中解脱了出来。"
	custom_materials = list(/datum/material/wood = SMALL_MATERIAL_AMOUNT * 0.20)
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_TINY
	force = 0

/obj/item/food/popsicle/creamsicle_orange
	name = "橙子奶油冰棒"
	desc = "经典的橙子奶油冰棒。一份阳光般的冰冻甜点。"
	food_reagents = list(
		/datum/reagent/consumable/orangejuice = 4,
		/datum/reagent/consumable/cream = 2,
		/datum/reagent/consumable/vanilla = 2,
		/datum/reagent/consumable/sugar = 4,
	)
	foodtypes = FRUIT | DAIRY | SUGAR | ORANGES
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/popsicle/creamsicle_berry
	name = "浆果奶油冰棒"
	desc = "一款色彩鲜艳的浆果奶油冰棒。一份浆果般美味的冷冻甜点。"
	food_reagents = list(
		/datum/reagent/consumable/berryjuice = 4,
		/datum/reagent/consumable/cream = 2,
		/datum/reagent/consumable/vanilla = 2,
		/datum/reagent/consumable/sugar = 4,
	)
	overlay_state = "creamsicle_m"
	foodtypes = FRUIT | DAIRY | SUGAR
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/popsicle/jumbo
	name = "巨型冰淇淋"
	desc = "一款奢华的冰淇淋，裹着浓郁的黑巧克力。它看起来比你记忆中的要小。"
	food_reagents = list(
		/datum/reagent/consumable/hot_coco = 4,
		/datum/reagent/consumable/cream = 2,
		/datum/reagent/consumable/vanilla = 3,
		/datum/reagent/consumable/sugar = 2,
	)
	overlay_state = "jumbo"
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/popsicle/licorice_creamsicle
	name = "\improper Void Bar™"
	desc = "一款咸味甘草冰淇淋。一份咸味的冷冻甜点。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/salt = 1,
		/datum/reagent/consumable/cream = 2,
		/datum/reagent/consumable/vanilla = 1,
		/datum/reagent/consumable/sugar = 4,
	)
	tastes = list("salty liquorice")
	overlay_state = "licorice_creamsicle"
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/cornuto
	name = "可努朵"
	w_class = WEIGHT_CLASS_SMALL
	icon = 'icons/obj/food/frozen_treats.dmi'
	icon_state = "cornuto"
	desc = "一款那不勒斯风味香草巧克力冰淇淋甜筒。上面点缀着焦糖坚果，颇具威胁感。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/hot_coco = 4,
		/datum/reagent/consumable/cream = 2,
		/datum/reagent/consumable/vanilla = 4,
		/datum/reagent/consumable/sugar = 2,
	)
	tastes = list("chopped hazelnuts", "waffle")
	foodtypes = GRAIN|DAIRY|SUGAR
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	crafted_food_buff = /datum/status_effect/food/chilling

/obj/item/food/popsicle/meatsicle
	name = "meatsicle"
	desc = "一种可怕的怪物：生肉裹上糖浆，插在棍子上，然后冷冻而成。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/fat = 2,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/sugar = 4,
	)
	overlay_state = "meatsicle"
	foodtypes = RAW | MEAT | SUGAR
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)
