//this category is very little but I think that it has great potential to grow
////////////////////////////////////////////SALAD////////////////////////////////////////////
/obj/item/food/salad
	icon = 'icons/obj/food/soupsalad.dmi'
	abstract_type = /obj/item/food/salad
	trash_type = /obj/item/reagent_containers/cup/bowl
	bite_consumption = 3
	w_class = WEIGHT_CLASS_NORMAL
	food_reagents = list(/datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("leaves" = 1)
	foodtypes = VEGETABLES
	eatverbs = list("devour", "nibble", "gnaw", "gobble", "chomp") //who the fuck gnaws and devours on a salad
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/salad/aesirsalad
	name = "\improper 埃希尔沙拉"
	desc = "对凡人来说可能过于美妙，难以完全享受。"
	icon_state = "aesirsalad"
	food_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/vitamin = 12)
	tastes = list("leaves" = 1)
	foodtypes = VEGETABLES | FRUIT
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/herbsalad
	name = "香草沙拉"
	desc = "一道美味的沙拉，上面放着苹果。"
	icon_state = "herbsalad"
	food_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("leaves" = 1, "apple" = 1)
	foodtypes = VEGETABLES | FRUIT
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/salad/validsalad
	name = "合格沙拉"
	desc = "这不过是一份加了肉丸和炸土豆片的香草沙拉。没什么可疑的。"
	icon_state = "validsalad"
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/doctor_delight = 8, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("leaves" = 1, "potato" = 1, "meat" = 1, "valids" = 1)
	foodtypes = VEGETABLES | MEAT | FRIED
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/salad/fruit
	name = "水果沙拉"
	desc = "你的标准水果沙拉。"
	icon_state = "fruitsalad"
	food_reagents = list(/datum/reagent/consumable/nutriment = 9, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("fruit" = 1)
	foodtypes = FRUIT|ORANGES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/jungle
	name = "丛林沙拉"
	desc = "碗中的异域水果。"
	icon_state = "junglesalad"
	food_reagents = list(/datum/reagent/consumable/nutriment = 11, /datum/reagent/consumable/banana = 5, /datum/reagent/consumable/nutriment/vitamin = 7)
	tastes = list("fruit" = 1, "the jungle" = 1)
	foodtypes = FRUIT
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/citrusdelight
	name = "柑橘乐"
	desc = "柑橘大爆炸！"
	icon_state = "citrusdelight"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 7,
	)
	tastes = list("sourness" = 1, "leaves" = 1)
	foodtypes = FRUIT | ORANGES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/uncooked_rice
	name = "生米"
	desc = "一团生米。"
	icon_state = "uncooked_rice"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4)
	tastes = list("rice" = 1)
	foodtypes = GRAIN | RAW

/obj/item/food/uncooked_rice/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/boiledrice, rand(15 SECONDS, 20 SECONDS), TRUE, TRUE)

/obj/item/food/uncooked_rice/make_microwaveable()
	AddElement(/datum/element/microwavable, /obj/item/food/boiledrice)

/obj/item/food/boiledrice
	name = "米饭"
	desc = "一杯热气腾腾的米饭。单吃有点寡淡，但却是美味佳肴的基础..."
	icon_state = "cooked_rice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("rice" = 1)
	foodtypes = GRAIN | BREAKFAST
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/salad/ricepudding
	name = "米布丁"
	desc = "人人都爱米布丁！"
	icon_state = "ricepudding"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("rice" = 1, "sweetness" = 1)
	foodtypes = GRAIN | DAIRY | SUGAR
	venue_value = FOOD_PRICE_NORMAL

/obj/item/food/salad/ricepork
	name = "猪肉饭"
	desc = "嗯，看起来像是猪肉..."
	icon_state = "riceporkbowl"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("rice" = 1, "meat" = 1)
	foodtypes = GRAIN | MEAT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/salad/risotto
	name = "意大利调味饭"
	desc = "证明意大利人掌握了每一种碳水化合物。"
	icon_state = "risotto"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 10,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("rice" = 1, "cheese" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/eggbowl
	name = "鸡蛋饭"
	desc = "一碗米饭配一个煎蛋。"
	icon_state = "eggbowl"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("rice" = 1, "egg" = 1)
	foodtypes = MEAT|VEGETABLES|GRAIN|EGG
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/salad/edensalad
	name = "\improper 伊甸沙拉"
	desc = "一份充满未开发潜力的沙拉。"
	icon_state = "edensalad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 7,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("extreme bitterness" = 3, "hope" = 1)
	foodtypes = VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/gumbo
	name = "黑眼秋葵汤"
	desc = "一道辛辣可口的肉饭。"
	icon_state = "gumbo"
	food_reagents = list(
		/datum/reagent/consumable/capsaicin = 2,
		/datum/reagent/consumable/nutriment/vitamin = 3,
		/datum/reagent/consumable/nutriment = 5,
	)
	tastes = list("building heat" = 2, "savory meat and vegtables" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/reagent_containers/cup/bowl
	name = "碗"
	desc = "一个简单的碗，用于盛放汤和沙拉。"
	icon = 'icons/obj/food/soupsalad.dmi'
	icon_state = "bowl"
	base_icon_state = "bowl"
	initial_reagent_flags = OPENCONTAINER | DUNKABLE
	custom_materials = list(/datum/material/glass = SMALL_MATERIAL_AMOUNT*5)
	w_class = WEIGHT_CLASS_NORMAL
	custom_price = PAYCHECK_CREW * 0.6
	fill_icon_thresholds = list(0)
	fill_icon_state = "fullbowl"
	fill_icon = 'icons/obj/food/soupsalad.dmi'

	volume = SOUP_SERVING_SIZE + 5
	gulp_size = 3

	loop_drink = TRUE

/obj/item/reagent_containers/cup/bowl/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_ATOM_REAGENT_EXAMINE, PROC_REF(reagent_special_examine))
	AddComponent(/datum/component/ingredients_holder, /obj/item/food/salad/empty, CUSTOM_INGREDIENT_ICON_FILL, max_ingredients = 6)
	AddComponent( \
		/datum/component/takes_reagent_appearance, \
		on_icon_changed = CALLBACK(src, PROC_REF(on_cup_change)), \
		on_icon_reset = CALLBACK(src, PROC_REF(on_cup_reset)), \
		base_container_type = /obj/item/reagent_containers/cup/bowl, \
	)

/obj/item/reagent_containers/cup/bowl/on_cup_change(datum/glass_style/style)
	. = ..()
	fill_icon_thresholds = null

/obj/item/reagent_containers/cup/bowl/on_cup_reset()
	. = ..()
	fill_icon_thresholds ||= list(0)

/**
 * Override standard reagent examine
 * so that anyone examining a bowl of soup sees the soup but nothing else (unless they have sci goggles)
 */
/obj/item/reagent_containers/cup/bowl/proc/reagent_special_examine(datum/source, mob/user, list/examine_list, can_see_insides = FALSE)
	SIGNAL_HANDLER

	if(can_see_insides || reagents.total_volume <= 0)
		return

	var/unknown_volume = 0
	var/list/soups_found = list()
	for(var/datum/reagent/current_reagent as anything in reagents.reagent_list)
		if(istype(current_reagent, /datum/reagent/consumable/nutriment/soup))
			soups_found += "&bull; [round(current_reagent.volume, 0.01)] units of [current_reagent.name]"
		else
			unknown_volume += current_reagent.volume

	if(!length(soups_found))
		// There was no soup in the pot, do normal examine
		return

	examine_list += "Inside, you can see:"
	examine_list += soups_found
	if(unknown_volume > 0)
		examine_list += "&bull; [round(unknown_volume, 0.01)] units of unknown reagents"

	return STOP_GENERIC_REAGENT_EXAMINE

// empty salad for custom salads
/obj/item/food/salad/empty
	name = "沙拉"
	foodtypes = NONE
	tastes = list()
	icon_state = "bowl"
	desc = "一份美味的定制沙拉。"

/obj/item/food/salad/kale_salad
	name = "羽衣甘蓝沙拉"
	desc = "一份健康的羽衣甘蓝沙拉，淋上油，非常适合温暖的夏季月份。"
	icon_state = "kale_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment = 12,
	)
	tastes = list("healthy greens" = 2, "olive dressing" = 1)
	foodtypes = VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/greek_salad
	name = "greek salad"
	desc = "一种由番茄、洋葱、羊奶酪和橄榄制成并淋上橄榄油的流行沙拉。不过感觉好像少了点什么..."
	icon_state = "greek_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 13,
		/datum/reagent/consumable/nutriment = 14,
	)
	tastes = list("healthy greens" = 2, "olive dressing" = 1, "feta cheese" = 1)
	foodtypes = VEGETABLES|FRUIT|DAIRY
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/salad/caesar_salad
	name = "caesar salad"
	desc = "一种简单而美味的沙拉，由洋葱、生菜、面包丁和奶酪丝拌油制成。配有一片皮塔饼！"
	icon_state = "caesar_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment = 12,
	)
	tastes = list("healthy greens" = 2, "olive dressing" = 2, "feta cheese" = 2, "pita bread" = 1)
	foodtypes = VEGETABLES | DAIRY | GRAIN
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/salad/spring_salad
	name = "春季沙拉"
	desc = "一份简单的沙拉，由胡萝卜、生菜和豌豆淋上油，再加一小撮盐制成。"
	icon_state = "spring_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment = 12,
	)
	tastes = list("crisp greens" = 2, "olive dressing" = 2, "salt" = 1)
	foodtypes = VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/potato_salad
	name = "土豆沙拉"
	desc = "一道由煮熟的土豆混合煮鸡蛋、洋葱和蛋黄酱制成的菜肴。是每个有自尊心的烧烤聚会的必备品。"
	icon_state = "potato_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/protein = 4,
	)
	tastes = list("creamy potatoes" = 2, "eggs" = 2, "mayonnaise" = 1, "onions" = 1)
	foodtypes = MEAT|VEGETABLES|BREAKFAST|EGG
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/spinach_fruit_salad
	name = "菠菜水果沙拉"
	desc = "一份色彩鲜艳的水果沙拉，由菠菜、浆果和菠萝块制成，全部淋上油。好吃！"
	icon_state = "spinach_fruit_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment = 12,
	)
	tastes = list("spinach" = 2, "berries" = 2, "pineapple" = 2, "dressing" = 1)
	foodtypes = VEGETABLES|FRUIT|PINEAPPLE
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/salad/antipasto_salad
	name = "意式开胃沙拉"
	desc = "一种传统的意大利沙拉，由意大利腊肠、马苏里拉奶酪、橄榄和番茄制成。通常作为第一道菜供应。"
	icon_state = "antipasto_salad"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/protein = 6,
	)
	tastes = list("lettuce" = 2, "salami" = 2, "mozzarella cheese" = 2, "tomatoes" = 2, "dressing" = 1)
	foodtypes = MEAT|VEGETABLES|FRUIT|DAIRY
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)
