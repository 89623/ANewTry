/**
 * # Abstract cheese class
 *
 * Everything that is a subclass of this counts as cheese for regal rats.
 */
/obj/item/food/cheese
	name = "奶酪的概念"
	desc = "这或许本不该存在。"
	abstract_type = /obj/item/food/cheese
	tastes = list("cheese" = 1)
	food_reagents = list(/datum/reagent/consumable/nutriment/fat = 3)
	foodtypes = DAIRY
	crafting_complexity = FOOD_COMPLEXITY_1
	/// used to determine how much health rats/regal rats recover when they eat it.
	var/rat_heal = 0

/obj/item/food/cheese/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_RAT_INTERACT, PROC_REF(on_rat_eat))

/obj/item/food/cheese/proc/on_rat_eat(datum/source, mob/living/basic/regal_rat/king)
	SIGNAL_HANDLER

	king.cheese_heal(src, rat_heal, span_green("你吃下[src]，恢复了一些生命值。"))
	return COMPONENT_RAT_INTERACTED

/obj/item/food/cheese/wedge
	name = "奶酪楔块"
	desc = "一块美味的切达奶酪楔块。切下它的奶酪轮肯定没走远。"
	icon_state = "cheesewedge"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/fat = 2,
		/datum/reagent/consumable/nutriment/protein = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	w_class = WEIGHT_CLASS_SMALL
	rat_heal = 10
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/cheese/wedge/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/food_storage)

/obj/item/food/cheese/wheel
	name = "奶酪轮"
	desc = "一大轮美味的切达奶酪。"
	icon_state = "cheesewheel"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/fat = 10,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	) //Hard cheeses contain about 25% protein
	w_class = WEIGHT_CLASS_NORMAL
	rat_heal = 35
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/cheese/wheel/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/food_storage)

/obj/item/food/cheese/wheel/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/cheese/wedge, 5, 3 SECONDS, table_required = TRUE, screentip_verb = "Slice", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/cheese/wheel/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/baked_cheese, rand(20 SECONDS, 25 SECONDS), TRUE, TRUE)

/**
 * Whiffs away cheese that was touched by the chaos entity byond the realm. In layman's terms, deletes the cheese and throws sparks.
 * Used in wizard grand rituals' optional cheesy alternative.
 */
/obj/item/food/cheese/wheel/proc/consume_cheese()
	visible_message(span_revenwarning("……并在混乱的漩涡中被消耗殆尽！"))
	do_sparks(number = 1, cardinal_only = TRUE, source = get_turf(src))
	qdel(src)

/obj/item/food/cheese/royal
	name = "皇家奶酪"
	desc = "登上王座。享用奶酪轮。感受这股力量。"
	icon_state = "royalcheese"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/fat = 15,
		/datum/reagent/consumable/nutriment/vitamin = 5,
		/datum/reagent/gold = 20,
		/datum/reagent/toxin/mutagen = 5,
	)
	w_class = WEIGHT_CLASS_BULKY
	tastes = list("cheese" = 4, "royalty" = 1)
	rat_heal = 70
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/gold = SHEET_MATERIAL_AMOUNT * 5)

//Curd cheese, a general term which I will now proceed to stretch as thin as the toppings on a supermarket sandwich:
//I'll use it as a substitute for ricotta, cottage cheese and quark, as well as any other non-aged, soft grainy cheese
/obj/item/food/cheese/curd_cheese
	name = "凝乳奶酪"
	desc = "在人类烹饪中以多种名称闻名，凝乳奶酪可用于制作各式各样的菜肴。"
	icon_state = "curd_cheese"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/consumable/cream = 1,
	)
	tastes = list("cream" = 1, "cheese" = 1)
	w_class = WEIGHT_CLASS_SMALL
	rat_heal = 35
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/cheese/curd_cheese/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/cheese/cheese_curds, rand(15 SECONDS, 20 SECONDS), TRUE, TRUE)

/obj/item/food/cheese/curd_cheese/make_microwaveable()
	AddElement(/datum/element/microwavable, /obj/item/food/cheese/cheese_curds)

/obj/item/food/cheese/cheese_curds
	name = "奶酪凝块"
	desc = "别和凝乳奶酪搞混了。油炸后很美味。"
	icon_state = "cheese_curds"
	w_class = WEIGHT_CLASS_SMALL
	rat_heal = 35
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/cheese/cheese_curds/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/dryable,  /obj/item/food/cheese/firm_cheese)

/obj/item/food/cheese/firm_cheese
	name = "硬质奶酪"
	desc = "质地坚硬的陈年奶酪，口感类似硬豆腐。由于其水分含量低，特别适合用于烹饪，因为它不容易融化。"
	icon_state = "firm_cheese"
	tastes = list("aged cheese" = 1)
	w_class = WEIGHT_CLASS_SMALL
	rat_heal = 35
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/cheese/firm_cheese/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/cheese/firm_cheese_slice, 3, 3 SECONDS, screentip_verb = "Slice", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/cheese/firm_cheese_slice
	name = "硬质奶酪片"
	desc = "一片硬质奶酪。非常适合烧烤或制作美味的青酱。"
	icon_state = "firm_cheese_slice"
	tastes = list("aged cheese" = 1)
	w_class = WEIGHT_CLASS_SMALL
	rat_heal = 10
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/cheese/firm_cheese_slice/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/food_storage)

/obj/item/food/cheese/firm_cheese_slice/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/grilled_cheese, rand(25 SECONDS, 35 SECONDS), TRUE, TRUE)

/obj/item/food/cheese/mozzarella
	name = "马苏里拉奶酪"
	desc = "美味、柔滑、奶酪味十足，尽在这一份简单的包装中。"
	icon_state = "mozzarella"
	tastes = list("mozzarella" = 1)
	w_class = WEIGHT_CLASS_SMALL
	rat_heal = 10
	crafting_complexity = FOOD_COMPLEXITY_2
