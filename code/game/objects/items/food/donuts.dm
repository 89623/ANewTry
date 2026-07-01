#define DONUT_SPRINKLE_CHANCE 30

/obj/item/food/donut
	name = "甜甜圈"
	desc = "与劲道咖啡是绝配。"
	icon = 'icons/obj/food/donuts.dmi'
	abstract_type = /obj/item/food/donut
	inhand_icon_state = "donut1"
	bite_consumption = 5
	food_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3)
	tastes = list("donut" = 1)
	foodtypes = GRAIN|DAIRY|JUNKFOOD|SUGAR|FRIED|BREAKFAST
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2
	var/decorated_icon = "donut_homer"
	var/is_decorated = FALSE
	var/extra_reagent = null
	var/decorated_adjective = "sprinkled"
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/donut/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/dunkable, amount_per_dunk = 10)
	if(prob(DONUT_SPRINKLE_CHANCE))
		decorate_donut()

// It is so stupid that we have to do this but because food crafting clears all reagents that got added during init,
// here we are adding it again (but only for crafting, maploaded and spawned donuts work fine).
// Until the issues with crafted items' reagents are resolved this will have to do
/obj/item/food/donut/plain/on_craft_completion(list/components, datum/crafting_recipe/current_recipe, atom/crafter)
	. = ..()
	if(is_decorated)
		reagents.add_reagent(/datum/reagent/consumable/sprinkles, 1)

///Override for checkliked callback
/obj/item/food/donut/make_edible()
	. = ..()
	AddComponentFrom(SOURCE_EDIBLE_INNATE, /datum/component/edible, check_liked = CALLBACK(src, PROC_REF(check_liked)))

/obj/item/food/donut/proc/decorate_donut()
	if(is_decorated || !decorated_icon)
		return
	is_decorated = TRUE
	name = "[decorated_adjective] [name]"
	icon_state = decorated_icon //delish~!
	inhand_icon_state = "donut2"
	reagents.add_reagent(/datum/reagent/consumable/sprinkles, 1)
	return TRUE

/// Returns the sprite of the donut while in a donut box
/obj/item/food/donut/proc/in_box_sprite()
	return "[icon_state]_inbox"

///Override for checkliked in edible component, because all cops LOVE donuts
/obj/item/food/donut/proc/check_liked(mob/living/carbon/human/consumer)
	var/obj/item/organ/liver/liver = consumer.get_organ_slot(ORGAN_SLOT_LIVER)
	if(!HAS_TRAIT(consumer, TRAIT_AGEUSIA) && liver && HAS_TRAIT(liver, TRAIT_LAW_ENFORCEMENT_METABOLISM))
		return FOOD_LIKED

//Use this donut ingame
/obj/item/food/donut/plain
	icon_state = "donut"

/obj/item/food/donut/chaos
	name = "混沌甜甜圈"
	desc = "如同生活，它的滋味总不尽相同。"
	icon_state = "donut_chaos"
	bite_consumption = 10
	tastes = list("donut" = 3, "chaos" = 1)
	is_decorated = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3
	foodtypes = GRAIN|DAIRY|JUNKFOOD|FRIED|BREAKFAST

/obj/item/food/donut/chaos/Initialize(mapload)
	. = ..()
	extra_reagent = pick(
		/datum/reagent/consumable/nutriment,
		/datum/reagent/consumable/capsaicin,
		/datum/reagent/consumable/frostoil,
		/datum/reagent/drug/krokodil,
		/datum/reagent/toxin/plasma,
		/datum/reagent/consumable/coco,
		/datum/reagent/toxin/slimejelly,
		/datum/reagent/consumable/banana,
		/datum/reagent/consumable/berryjuice,
		/datum/reagent/medicine/omnizine,
	)
	reagents.add_reagent(extra_reagent, 3)

/obj/item/food/donut/meat
	name = "肉馅甜甜圈"
	desc = "尝起来和看起来一样恶心。"
	icon_state = "donut_meat"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/consumable/ketchup = 3,
	)
	tastes = list("meat" = 1)
	foodtypes = GRAIN|DAIRY|JUNKFOOD|FRIED|BREAKFAST|MEAT|GORE
	is_decorated = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/donut/berry
	name = "粉色甜甜圈"
	desc = "配上一杯豆奶拿铁简直绝配。"
	icon_state = "donut_pink"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/berryjuice = 3,
		/datum/reagent/consumable/sprinkles = 1, //Extra sprinkles to reward frosting
	)
	foodtypes = parent_type::foodtypes|FRUIT
	decorated_icon = "donut_homer"

/obj/item/food/donut/trumpet
	name = "太空人甜甜圈"
	desc = "配上一杯冰镇麦尔克简直绝配。"
	icon_state = "donut_purple"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/sprinkles = 1,
	)
	tastes = list("donut" = 3, "violets" = 1)
	is_decorated = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/donut/apple
	name = "苹果甜甜圈"
	desc = "配上一杯肉桂烈酒简直绝配。"
	icon_state = "donut_green"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/applejuice = 3,
		/datum/reagent/consumable/sprinkles = 1,
	)
	foodtypes = parent_type::foodtypes|FRUIT
	tastes = list("donut" = 3, "green apples" = 1)
	is_decorated = TRUE

/obj/item/food/donut/caramel
	name = "焦糖甜甜圈"
	desc = "配上一杯热可可简直绝配。"
	icon_state = "donut_beige"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/caramel = 3,
		/datum/reagent/consumable/sprinkles = 1,
	)
	tastes = list("donut" = 3, "buttery sweetness" = 1)
	is_decorated = TRUE

/obj/item/food/donut/choco
	name = "巧克力甜甜圈"
	desc = "配上一杯温牛奶简直绝配。"
	icon_state = "donut_choc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/hot_coco = 3,
		/datum/reagent/consumable/sprinkles = 1,
	) //the coco reagent is just bitter.
	tastes = list("donut" = 4, "bitterness" = 1)
	decorated_icon = "donut_choc_sprinkles"
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/donut/blumpkin
	name = "蓝南瓜甜甜圈"
	desc = "配上一杯舒缓的醉人蓝南瓜酒简直绝配。"
	icon_state = "donut_blue"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/blumpkinjuice = 3,
		/datum/reagent/consumable/sprinkles = 1,
	)
	foodtypes = parent_type::foodtypes|VEGETABLES
	tastes = list("donut" = 2, "blumpkin" = 1)
	is_decorated = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/donut/bungo
	name = "邦戈果甜甜圈"
	desc = "配上一罐嬉皮士的欢愉简直绝配。"
	icon_state = "donut_yellow"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/bungojuice = 3,
		/datum/reagent/consumable/sprinkles = 1,
	)
	tastes = list("donut" = 3, "tropical sweetness" = 1)
	is_decorated = TRUE

/obj/item/food/donut/matcha
	name = "抹茶甜甜圈"
	desc = "配上一杯茶简直绝配。"
	icon_state = "donut_olive"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/toxin/teapowder = 3,
		/datum/reagent/consumable/sprinkles = 1,
	)
	tastes = list("donut" = 3, "matcha" = 1)
	is_decorated = TRUE

/obj/item/food/donut/laugh
	name = "甜豌豆甜甜圈"
	desc = "配上一瓶巴斯蒂恩波本威士忌简直绝了！"
	icon_state = "donut_laugh"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/laughter = 3,
	)
	tastes = list("donut" = 3, "fizzy tutti frutti" = 1,)
	is_decorated = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3

//////////////////////JELLY DONUTS/////////////////////////

/obj/item/food/donut/jelly
	name = "果酱甜甜圈"
	desc = "你眼馋吗？"
	icon_state = "jelly"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/sugar = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	extra_reagent = /datum/reagent/consumable/berryjuice
	tastes = list("jelly" = 1, "donut" = 3)
	foodtypes = parent_type::foodtypes|FRUIT

// Jelly donuts don't have holes, but look the same on the outside
/obj/item/food/donut/jelly/in_box_sprite()
	return "[replacetext(icon_state, "jelly", "donut")]_inbox"

/obj/item/food/donut/jelly/Initialize(mapload)
	. = ..()
	if(extra_reagent)
		reagents.add_reagent(extra_reagent, 3)

/obj/item/food/donut/jelly/plain //use this ingame to avoid inheritance related crafting issues.
	decorated_icon = "jelly_homer"

/obj/item/food/donut/jelly/berry
	name = "粉色果酱甜甜圈"
	desc = "配上一杯豆奶拿铁简直绝了。"
	icon_state = "jelly_pink"
	food_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/berryjuice = 3, /datum/reagent/consumable/sprinkles = 1, /datum/reagent/consumable/nutriment/vitamin = 1) //Extra sprinkles to reward frosting.
	decorated_icon = "jelly_homer"

/obj/item/food/donut/jelly/trumpet
	name = "太空人果酱甜甜圈"
	desc = "配上一杯冰镇马克简直绝了。"
	icon_state = "jelly_purple"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 3, "violets" = 1)
	is_decorated = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/donut/jelly/apple
	name = "苹果果酱甜甜圈"
	desc = "配上一杯肉桂烈酒简直绝了。"
	icon_state = "jelly_green"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/applejuice = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 3, "green apples" = 1)
	is_decorated = TRUE

/obj/item/food/donut/jelly/caramel
	name = "焦糖果酱甜甜圈"
	desc = "配上一杯热可可简直绝了。"
	icon_state = "jelly_beige"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/caramel = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 3, "buttery sweetness" = 1)
	is_decorated = TRUE

/obj/item/food/donut/jelly/choco
	name = "巧克力果酱甜甜圈"
	desc = "配上一杯温牛奶简直绝了。"
	icon_state = "jelly_choc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/hot_coco = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 4, "bitterness" = 1)
	decorated_icon = "jelly_choc_sprinkles"
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/donut/jelly/blumpkin
	name = "蓝瓜果酱甜甜圈"
	desc = "配上一杯舒缓的醉蓝瓜汁简直绝了。"
	icon_state = "jelly_blue"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/blumpkinjuice = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	foodtypes = parent_type::foodtypes|VEGETABLES
	tastes = list("jelly" = 1, "donut" = 2, "blumpkin" = 1)
	is_decorated = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/donut/jelly/bungo
	name = "邦戈果酱甜甜圈"
	desc = "配上一罐嬉皮士之乐简直绝了。"
	icon_state = "jelly_yellow"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/bungojuice = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 3, "tropical sweetness" = 1)
	is_decorated = TRUE

/obj/item/food/donut/jelly/matcha
	name = "抹茶果酱甜甜圈"
	desc = "配上一杯茶简直绝了。"
	icon_state = "jelly_olive"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/toxin/teapowder = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 3, "matcha" = 1)
	is_decorated = TRUE

/obj/item/food/donut/jelly/laugh
	name = "甜豌豆果酱甜甜圈"
	desc = "配上一瓶巴斯蒂恩波本威士忌简直绝了！"
	icon_state = "jelly_laugh"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/laughter = 3,
	)
	tastes = list("jelly" = 3, "donut" = 1, "fizzy tutti frutti" = 1)
	is_decorated = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3

//////////////////////////SLIME DONUTS/////////////////////////

/obj/item/food/donut/jelly/slimejelly
	name = "果酱甜甜圈"
	desc = "你眼馋吗？"
	abstract_type = /obj/item/food/donut/jelly/slimejelly
	extra_reagent = /datum/reagent/toxin/slimejelly
	foodtypes = GRAIN|DAIRY|JUNKFOOD|SUGAR|FRIED|BREAKFAST|TOXIC

/obj/item/food/donut/jelly/slimejelly/plain
	icon_state = "jelly"

/obj/item/food/donut/jelly/slimejelly/berry
	name = "粉色果酱甜甜圈"
	desc = "配上一杯豆奶拿铁简直绝了。"
	icon_state = "jelly_pink"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/berryjuice = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	) //Extra sprinkles to reward frosting
	foodtypes = parent_type::foodtypes|FRUIT

/obj/item/food/donut/jelly/slimejelly/trumpet
	name = "太空人果酱甜甜圈"
	desc = "配上一烧杯冰镇莫克简直绝了。"
	icon_state = "jelly_purple"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 3, "violets" = 1)
	is_decorated = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/donut/jelly/slimejelly/apple
	name = "苹果果酱甜甜圈"
	desc = "配上一杯肉桂烈酒简直绝了。"
	icon_state = "jelly_green"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/applejuice = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 3, "green apples" = 1)
	is_decorated = TRUE
	foodtypes = parent_type::foodtypes|FRUIT

/obj/item/food/donut/jelly/slimejelly/caramel
	name = "焦糖果酱甜甜圈"
	desc = "配上一杯热可可简直绝了。"
	icon_state = "jelly_beige"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/caramel = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 3, "buttery sweetness" = 1)
	is_decorated = TRUE

/obj/item/food/donut/jelly/slimejelly/choco
	name = "巧克力果酱甜甜圈"
	desc = "配上一杯温牛奶简直绝了。"
	icon_state = "jelly_choc"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/hot_coco = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 4, "bitterness" = 1)
	decorated_icon = "jelly_choc_sprinkles"
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/donut/jelly/slimejelly/blumpkin
	name = "蓝南瓜果酱甜甜圈"
	desc = "配上一杯舒缓的醉蓝南瓜简直绝了。"
	icon_state = "jelly_blue"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/blumpkinjuice = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 2, "blumpkin" = 1)
	is_decorated = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3
	foodtypes = parent_type::foodtypes|VEGETABLES

/obj/item/food/donut/jelly/slimejelly/bungo
	name = "邦戈果酱甜甜圈"
	desc = "配上一梅森罐嬉皮士之乐简直绝了。"
	icon_state = "jelly_yellow"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/bungojuice = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 3, "tropical sweetness" = 1)
	is_decorated = TRUE

/obj/item/food/donut/jelly/slimejelly/matcha
	name = "抹茶果酱甜甜圈"
	desc = "配上一杯茶简直绝了。"
	icon_state = "jelly_olive"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/toxin/teapowder = 3,
		/datum/reagent/consumable/sprinkles = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("jelly" = 1, "donut" = 3, "matcha" = 1)
	is_decorated = TRUE

/obj/item/food/donut/jelly/slimejelly/laugh
	name = "甜豌豆果酱甜甜圈"
	desc = "配上一瓶堡垒波本威士忌简直绝了！"
	icon_state = "jelly_laugh"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/laughter = 3,
	)
	tastes = list("jelly" = 3, "donut" = 1, "fizzy tutti frutti" = 1)
	is_decorated = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3

#undef DONUT_SPRINKLE_CHANCE
