// Sweets that didn't make it into any other category

/obj/item/food/candy_corn
	name = "糖果玉米"
	desc = "这是一把糖果玉米。可以存放在侦探帽里。"
	icon_state = "candy_corn"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/sugar = 2,
	)
	tastes = list("candy corn" = 1)
	foodtypes = JUNKFOOD | SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/candy_corn/prison
	name = "干瘪的糖果玉米"
	desc = "如果这糖果玉米再硬一点，安保部门就会以可能成为自制刀具为由没收它。"
	force = 1 // the description isn't lying
	throwforce = 1 // if someone manages to bust out of jail with candy corn god bless them
	tastes = list("bitter wax" = 1)
	foodtypes = GROSS

/obj/item/food/candiedapple
	name = "糖苹果"
	desc = "一个裹着甜美糖衣的苹果。"
	icon_state = "candiedapple"
	bite_consumption = 3
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/caramel = 5,
	)
	tastes = list("apple" = 2, "caramel" = 3)
	foodtypes = JUNKFOOD | FRUIT | SUGAR
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/mint
	name = "薄荷糖"
	desc = "它只有威化饼那么薄。"
	icon_state = "mint"
	bite_consumption = 1
	food_reagents = list(/datum/reagent/consumable/mintextract = 2)
	foodtypes = TOXIC | SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY

/obj/item/food/ant_candy
	name = "蚂蚁糖"
	desc = "一群蚂蚁凝固在硬糖里。那些东西是死的，对吧？"
	icon_state = "ant_pop"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/consumable/sugar = 5,
		/datum/reagent/ants = 3,
	)
	tastes = list("candy" = 1, "insects" = 1)
	foodtypes = JUNKFOOD | SUGAR | BUGS
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY
	crafting_complexity = FOOD_COMPLEXITY_1

// Chocolates
/obj/item/food/chocolatebar
	name = "巧克力棒"
	desc = "如此，甜美，令人发胖的食物。"
	icon_state = "chocolatebar"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 2,
	)
	tastes = list("chocolate" = 1)
	foodtypes = JUNKFOOD | SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/virtual_chocolate
	name = "虚拟巧克力棒"
	desc = "数字食物只能提供进食的感觉……没有任何营养益处。"
	icon_state = "virtual_chocolate"
	tastes = list("nothing" = 1)
	foodtypes = NONE
	w_class = WEIGHT_CLASS_TINY


/obj/item/food/chococoin
	name = "巧克力硬币"
	desc = "一种完全可食用但无法抛掷的节日硬币。"
	icon_state = "chococoin"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/sugar = 1,
	)
	tastes = list("chocolate" = 1)
	foodtypes = JUNKFOOD | SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/fudgedice
	name = "软糖骰子"
	desc = "一小块巧克力方块，一次吃太多的话味道会变得不那么浓郁。"
	icon_state = "chocodice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/sugar = 1,
	)
	trash_type = /obj/item/dice/fudge
	tastes = list("fudge" = 1)
	foodtypes = JUNKFOOD | SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/chocoorange
	name = "巧克力橙"
	desc = "一个节庆巧克力橙。"
	icon_state = "chocoorange"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/sugar = 1,
	)
	tastes = list("chocolate" = 3, "oranges" = 1)
	foodtypes = JUNKFOOD|FRUIT|SUGAR|ORANGES
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/bonbon
	name = "夹心巧克力"
	desc = "一小块甜甜的巧克力。"
	icon_state = "tiny_chocolate"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/sugar = 1,
		/datum/reagent/consumable/coco = 1,
	)
	tastes = list("chocolate" = 1)
	foodtypes = JUNKFOOD|SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY

/obj/item/food/bonbon/caramel_truffle
	name = "焦糖松露"
	desc = "一口大小的巧克力松露，内含耐嚼的焦糖夹心。"
	icon_state = "caramel_truffle"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("chocolate" = 1, "chewy caramel" = 1)
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/bonbon/chocolate_truffle
	name = "巧克力松露"
	desc = "一口大小的巧克力松露，内含浓郁巧克力慕斯夹心。"
	icon_state = "chocolate_truffle"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)

/obj/item/food/bonbon/peanut_truffle
	name = "花生松露"
	desc = "一口大小的巧克力松露，混有脆脆的花生。"
	icon_state = "peanut_truffle"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("chocolate" = 1, "peanuts" = 1)
	foodtypes = SUGAR|JUNKFOOD|NUTS
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/bonbon/peanut_butter_cup
	name = "花生酱杯"
	desc = "一种超甜的巧克力点心，内含咸香的花生酱夹心。"
	icon_state = "peanut_butter_cup"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("chocolate" = 1, "peanut butter" = 1)
	foodtypes = SUGAR|JUNKFOOD|NUTS
	crafting_complexity = FOOD_COMPLEXITY_1

// Gum
/obj/item/food/bubblegum
	name = "泡泡糖"
	desc = "一条橡胶般的口香糖。虽然不怎么管饱，但能让你忙活一阵。"
	icon_state = "bubblegum"
	inhand_icon_state = null
	color = "#E48AB5" // craftable custom gums someday?
	food_reagents = list(/datum/reagent/consumable/sugar = 5)
	tastes = list("candy" = 1)
	food_flags = FOOD_FINGER_FOOD
	slot_flags = ITEM_SLOT_MASK
	w_class = WEIGHT_CLASS_TINY

/obj/item/food/bubblegum/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user]吞下了[src]！看起来[user.p_theyre()]想自杀！"))
	qdel(src)
	return TOXLOSS

/obj/item/food/bubblegum/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/chewable)

/obj/item/food/bubblegum/nicotine
	name = "尼古丁口香糖"
	food_reagents = list(
		/datum/reagent/drug/nicotine = 10,
		/datum/reagent/consumable/menthol = 5,
	)
	tastes = list("mint" = 1)
	color = "#60A584"

/obj/item/food/bubblegum/happiness
	name = "\improper HP+ gum"
	desc = "一条橡胶般的口香糖。闻起来有点怪。"
	food_reagents = list(/datum/reagent/drug/happiness = 15)
	tastes = list("paint thinner" = 1)
	color = "#EE35FF"

/obj/item/food/bubblegum/bubblegum
	name = "泡泡糖"
	desc = "一条橡胶般的口香糖。你觉得吃掉它可能不是个好主意。"
	color = "#913D3D"
	food_reagents = list(/datum/reagent/blood = 15)
	tastes = list("hell" = 1, "people" = 1)

/obj/item/food/bubblegum/bubblegum/process()
	if(iscarbon(loc))
		hallucinate(loc)

/obj/item/food/bubblegum/bubblegum/make_edible()
	. = ..()
	AddComponentFrom(SOURCE_EDIBLE_INNATE, /datum/component/edible, on_consume = CALLBACK(src, PROC_REF(OnConsume)))

/obj/item/food/bubblegum/bubblegum/proc/OnConsume(mob/living/eater, mob/living/feeder)
	if(iscarbon(eater))
		hallucinate(eater)

///This proc has a 5% chance to have a bubblegum line appear, with an 85% chance for just text and 15% for a bubblegum hallucination and scarier text.
/obj/item/food/bubblegum/bubblegum/proc/hallucinate(mob/living/carbon/victim)
	if(prob(95)) //cursed by bubblegum
		return
	if(prob(15))
		victim.cause_hallucination(/datum/hallucination/oh_yeah, "bubblegum bubblegum", haunt_them = TRUE)
	else
		to_chat(victim, span_warning("[pick("You hear faint whispers.", "You smell ash.", "You feel hot.", "You hear a roar in the distance.")]"))

/obj/item/food/bubblegum/bubblegum/suicide_act(mob/living/user)
	user.say(";[pick(BUBBLEGUM_HALLUCINATION_LINES)]")
	return ..()

/obj/item/food/gumball
	name = "口香糖球"
	desc = "一颗色彩鲜艳、含糖的口香糖球。"
	icon = 'icons/obj/food/lollipop.dmi'
	icon_state = "gumball"
	worn_icon_state = "bubblegum"
	food_reagents = list(/datum/reagent/consumable/sugar = 5, /datum/reagent/medicine/sal_acid = 2, /datum/reagent/medicine/oxandrolone = 2) //Kek
	tastes = list("candy")
	foodtypes = JUNKFOOD
	food_flags = FOOD_FINGER_FOOD
	slot_flags = ITEM_SLOT_MASK
	w_class = WEIGHT_CLASS_TINY
	venue_value = FOOD_PRICE_WORTHLESS

/obj/item/food/gumball/Initialize(mapload)
	. = ..()
	color = rgb(rand(0, 255), rand(0, 255), rand(0, 255))
	AddElement(/datum/element/chewable)


// Lollipop
/obj/item/food/lollipop
	name = "棒棒糖"
	desc = "一根美味的棒棒糖。是绝佳的情人节礼物。"
	icon = 'icons/obj/food/lollipop.dmi'
	icon_state = "lollipop_stick"
	inhand_icon_state = null
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/iron = 10, /datum/reagent/consumable/sugar = 5,
		/datum/reagent/medicine/omnizine = 2,
	)
	tastes = list("candy" = 1)
	foodtypes = JUNKFOOD | SUGAR
	food_flags = FOOD_FINGER_FOOD
	slot_flags = ITEM_SLOT_MASK
	w_class = WEIGHT_CLASS_TINY
	venue_value = FOOD_PRICE_WORTHLESS
	var/mutable_appearance/head
	var/head_color = rgb(0, 0, 0)

/obj/item/food/lollipop/Initialize(mapload)
	. = ..()
	head = mutable_appearance('icons/obj/food/lollipop.dmi', "lollipop_head")
	change_head_color(rgb(rand(0, 255), rand(0, 255), rand(0, 255)))
	AddElement(/datum/element/chewable)

/obj/item/food/lollipop/proc/change_head_color(C)
	head_color = C
	cut_overlay(head)
	head.color = C
	add_overlay(head)

/obj/item/food/lollipop/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	..(hit_atom)
	throw_speed = 1
	throwforce = 0

/obj/item/food/lollipop/cyborg
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/iron = 10,
		/datum/reagent/consumable/sugar = 5,
		/datum/reagent/medicine/psicodine = 2, //psicodine instead of omnizine, because the latter was making coders freak out
	)

/obj/item/food/spiderlollipop
	name = "蜘蛛棒棒糖"
	desc = "依然很恶心，但至少上面堆满了糖。"
	icon_state = "spiderlollipop"
	worn_icon_state = "lollipop_stick"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/toxin = 1,
		/datum/reagent/iron = 10,
		/datum/reagent/consumable/sugar = 5,
		/datum/reagent/medicine/omnizine = 2,
	) //lollipop, but vitamins = toxins
	tastes = list("cobwebs" = 1, "sugar" = 2)
	foodtypes = JUNKFOOD|SUGAR|MEAT|BUGS
	food_flags = FOOD_FINGER_FOOD
	slot_flags = ITEM_SLOT_MASK
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/spiderlollipop/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/chewable)

/obj/item/food/swirl_lollipop
	name = "漩涡棒棒糖"
	desc = "一根巨大的彩虹漩涡棒棒糖。据说含有额外的糖分。"
	icon_state = "swirl_lollipop"
	worn_icon_state = "lollipop_stick"
	inhand_icon_state = "swirl_lollipop"
	food_reagents = list(
		/datum/reagent/consumable/sugar = 30,
		/datum/reagent/drug/happiness = 5, //swirl lollipops make everyone happy!
		/datum/reagent/medicine/omnizine = 2,
	)
	tastes = list("whimsical joy" = 1, "sugar" = 2)
	foodtypes = JUNKFOOD | SUGAR
	food_flags = FOOD_FINGER_FOOD
	slot_flags = ITEM_SLOT_MASK
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/swirl_lollipop/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/chewable)
