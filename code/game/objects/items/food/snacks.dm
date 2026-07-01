////////////////////////////////////////////SNACKS FROM VENDING MACHINES////////////////////////////////////////////
//in other words: junk food
//don't even bother looking for recipes for these

/obj/item/food/candy
	name = "糖果"
	desc = "这是牛轧糖，爱它或恨它。"
	icon_state = "candy"
	trash_type = /obj/item/trash/candy
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/sugar = 3,
	)
	junkiness = 25
	tastes = list("candy" = 1)
	foodtypes = JUNKFOOD | SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/candy/bronx
	name = "\improper 南布朗克斯天堂棒"
	desc = "保证减肥！焦糖摩卡口味。关于产品消耗的说明……"
	icon_state = "bronx"
	inhand_icon_state = "candy"
	trash_type = /obj/item/trash/candy
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/yuck = 1,
	)
	junkiness = 10
	bite_consumption = 10
	tastes = list("candy" = 5, "weight loss" = 4, "insect larva" = 1)
	foodtypes = JUNKFOOD | RAW | BUGS
	custom_price = 80
	w_class = WEIGHT_CLASS_TINY
	var/revelation = FALSE

/obj/item/food/candy/bronx/make_edible()
	. = ..()
	AddComponentFrom(SOURCE_EDIBLE_INNATE, /datum/component/edible, on_consume = CALLBACK(src, PROC_REF(on_consume)))

/obj/item/food/candy/bronx/proc/on_consume(mob/living/eater)
	if(ishuman(eater))
		var/mob/living/carbon/human/carl = eater
		var/datum/disease/disease = new /datum/disease/parasite()
		carl.ForceContractDisease(disease, make_copy = FALSE, del_on_fail = TRUE)

/obj/item/food/candy/bronx/examine(mob/user)
	. = ..()
	if(!revelation && !isobserver(user))
		. += span_notice("天啊，你得去检查一下眼睛了。你应该再看一遍...")

		name = "\improper 南布朗克斯寄生虫巧克力棒"
		desc = "保证减肥！焦糖摩卡风味！警告：本产品不适合人类食用。含有活体钻虫标本。"
		revelation = TRUE

/obj/item/food/sosjerky
	name = "\improper 胆小鬼私藏牛肉干"
	icon_state = "sosjerky"
	desc = "用最上等的太空牛肉制成的牛肉干。"
	trash_type = /obj/item/trash/sosjerky
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/salt = 2,
	)
	junkiness = 25
	tastes = list("dried meat" = 1)
	w_class = WEIGHT_CLASS_SMALL
	foodtypes = JUNKFOOD | MEAT | SUGAR
	crafting_complexity = FOOD_COMPLEXITY_1
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/sosjerky/healthy
	name = "自制牛肉干"
	desc = "用最上等的太空牛制成的自制牛肉干。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	junkiness = 0

/obj/item/food/chips
	name = "薯片"
	desc = "瑞克指挥官的神秘薯片。"
	icon_state = "chips"
	trash_type = /obj/item/trash/chips
	bite_consumption = 1
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/salt = 1,
	)
	junkiness = 20
	tastes = list("salt" = 1, "crisps" = 1)
	foodtypes = VEGETABLES|JUNKFOOD|FRIED
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/chips/make_leave_trash()
	if(trash_type)
		AddElement(/datum/element/food_trash, trash_type, FOOD_TRASH_POPABLE)

/obj/item/food/chips/shrimp
	name = "虾片"
	desc = "油炸的虾味薯片。海鲜鉴赏家们最爱的垃圾食品！"
	icon_state = "shrimp_chips"
	trash_type = /obj/item/trash/shrimp_chips
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 1,
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/fat/oil = 3,
		/datum/reagent/consumable/salt = 1,
	)
	tastes = list("salt" = 1, "shrimp" = 1)
	foodtypes = JUNKFOOD | FRIED | SEAFOOD
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/no_raisin
	name = "\improper 4no raisins"
	icon_state = "4no_raisins"
	desc = "全宇宙最好的葡萄干。不知道为什么。"
	trash_type = /obj/item/trash/raisins
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/sugar = 4,
	)
	junkiness = 25
	tastes = list("dried raisins" = 1)
	foodtypes = JUNKFOOD | FRUIT | SUGAR
	food_flags = FOOD_FINGER_FOOD
	custom_price = PAYCHECK_CREW * 0.7
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/no_raisin/healthy
	name = "自制葡萄干"
	desc = "自制的葡萄干，全宇宙最棒的。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	junkiness = 0
	foodtypes = FRUIT
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/spacetwinkie
	name = "\improper 太空奶油夹心蛋糕"
	icon_state = "space_twinkie"
	desc = "保证比你的寿命更长。"
	food_reagents = list(/datum/reagent/consumable/sugar = 4)
	junkiness = 25
	foodtypes = JUNKFOOD | GRAIN | SUGAR
	food_flags = FOOD_FINGER_FOOD
	custom_price = PAYCHECK_LOWER
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/candy_trash
	name = "糖果烟蒂"
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "candybum"
	desc = "抽完的糖果香烟剩下的部分。可以吃！"
	food_reagents = list(
		/datum/reagent/consumable/sugar = 4,
		/datum/reagent/ash = 3,
	)
	junkiness = 10 //powergame trash food by buying candy cigs in bulk and eating them when they extinguish
	foodtypes = JUNKFOOD | SUGAR
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY

/obj/item/food/candy_trash/nicotine
	desc = "抽完的糖果香烟残渣。闻起来有尼古丁味……？"
	food_reagents = list(
		/datum/reagent/consumable/sugar = 4,
		/datum/reagent/ash = 3,
		/datum/reagent/drug/nicotine = 1,
	)

/obj/item/food/cheesiehonkers
	name = "\improper 奇滋喇叭"
	desc = "一口大小的芝士零食，会在你嘴里到处鸣响。"
	icon_state = "cheesie_honkers"
	trash_type = /obj/item/trash/cheesie
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/sugar = 3,
	)
	junkiness = 25
	tastes = list("cheese" = 5, "crisps" = 2)
	foodtypes = JUNKFOOD | DAIRY | SUGAR
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/syndicake
	name = "\improper 辛迪蛋糕"
	icon_state = "syndi_cakes"
	desc = "一种极其湿润的零食蛋糕，即使被微波炉加热后味道也一样好。"
	trash_type = /obj/item/trash/syndi_cakes
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/doctor_delight = 5,
	)
	tastes = list("sweetness" = 3, "cake" = 1)
	foodtypes = GRAIN | FRUIT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/energybar
	name = "\improper 高能能量棒"
	icon_state = "energybar"
	desc = "一种能量十足的能量棒，如果你不是以太族，可能不该吃这个。"
	trash_type = /obj/item/trash/energybar
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/liquidelectricity/enriched = 3,
	)
	tastes = list("pure electricity" = 3, "fitness" = 2)
	foodtypes = TOXIC
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/peanuts
	name = "\improper 画廊花生"
	desc = "极度愤怒者的最爱。"
	icon_state = "peanuts"
	trash_type = /obj/item/trash/peanuts
	food_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("peanuts" = 4, "anger" = 1)
	foodtypes = JUNKFOOD | NUTS
	custom_price = PAYCHECK_CREW * 0.8 //nuts are expensive in real life, and this is the best food in the vendor.
	junkiness = 10 //less junky than other options, since peanuts are a decently healthy snack option
	w_class = WEIGHT_CLASS_SMALL
	var/safe_for_consumption = TRUE

/obj/item/food/peanuts/grind_results()
	return list(/datum/reagent/consumable/peanut_butter = 5, /datum/reagent/consumable/nutriment/fat/oil = 2)

/obj/item/food/peanuts/salted
	name = "\improper 画廊盐储花生"
	desc = "尝起来咸咸的。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/salt = 1,
	)
	tastes = list("peanuts" = 3, "salt" = 1, "high blood pressure" = 1)

/obj/item/food/peanuts/wasabi
	name = "\improper 画廊狂怒芥末花生"
	desc = "所有花生口味中最愤怒的一种。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/capsaicin = 1,
	)
	tastes = list("peanuts" = 3, "wasabi" = 1, "rage" = 1)

/obj/item/food/peanuts/honey_roasted
	name = "\improper 画廊删除甜味花生"
	desc = "对于一种甜食来说，味道出奇地苦。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/sugar = 1,
	)
	tastes = list("peanuts" = 3, "honey" = 1, "bitterness" = 1)

/obj/item/food/peanuts/barbecue
	name = "\improper 画廊IDEDBBQ花生"
	desc = "有烟的地方不一定有火——有时只是烧烤酱。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/bbqsauce = 1,
	)
	tastes = list("peanuts" = 3, "bbq sauce" = 1, "arguments" = 1)

/obj/item/food/peanuts/ban_appeal
	name = "\improper 画廊花生禁令上诉混合包"
	desc = "一次不幸的尝试制作的混合零食，在6个星区被禁止。每年试图推翻禁令的游说都被拒绝，不是因为苹果有毒，而是因为它们总能避开禁令。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/toxin/cyanide = 1,
	) //uses dried poison apples
	tastes = list("peanuts" = 3, "apples" = 1, "regret" = 1)
	safe_for_consumption = FALSE

/obj/item/food/peanuts/random
	name = "\improper 画廊全口味花生"
	desc = "你会得到什么口味？"
	icon_state = "peanuts"
	safe_for_consumption = FALSE

GLOBAL_LIST_INIT(safe_peanut_types, populate_safe_peanut_types())

/proc/populate_safe_peanut_types()
	. = list()
	for(var/obj/item/food/peanuts/peanut_type as anything in subtypesof(/obj/item/food/peanuts))
		if(!initial(peanut_type.safe_for_consumption))
			continue
		. += peanut_type

/obj/item/food/peanuts/random/Initialize(mapload)
	// Generate a sample p
	var/peanut_type = pick(GLOB.safe_peanut_types)
	var/obj/item/food/sample = new peanut_type(loc)

	name = sample.name
	desc = sample.desc
	food_reagents = sample.food_reagents
	tastes = sample.tastes

	qdel(sample)

	. = ..()

/obj/item/food/cnds
	name = "\improper C&Ds"
	desc = "从法律上讲，我们不能保证这些糖果不会在你手中融化。"
	icon_state = "cnds"
	trash_type = /obj/item/trash/cnds
	food_reagents = list(
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/coco = 1,
	)
	tastes = list("chocolate candy" = 3)
	junkiness = 25
	foodtypes = JUNKFOOD
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/cnds/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user]正让[src]在[user.p_their()]手中融化！看起来[user.p_theyre()]想自杀！"))
	return TOXLOSS

/obj/item/food/cnds/caramel
	name = "焦糖C&Ds"
	desc = "塞满了糖分十足的焦糖，是糖尿病患者的噩梦。"
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/caramel = 1,
	)
	tastes = list("chocolate candy" = 2, "caramel" = 1)

/obj/item/food/cnds/pretzel
	name = "椒盐脆饼C&Ds"
	desc = "Eine köstliche Begleitung zu Ihrem Lieblingsbier."
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/coco = 1,
	)
	tastes = list("chocolate candy" = 2, "pretzel" = 1)
	foodtypes = JUNKFOOD | GRAIN

/obj/item/food/cnds/peanut_butter
	name = "花生酱C&Ds"
	desc = "深受小孩子和外星人的喜爱。"
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/peanut_butter = 1,
	)
	tastes = list("chocolate candy" = 2, "peanut butter" = 1)

/obj/item/food/cnds/banana_honk
	name = "香蕉小丑C&Ds"
	desc = "各地小丑的官方糖果。叭叭！"
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/banana = 1,
	)
	tastes = list("chocolate candy" = 2, "banana" = 1)

/obj/item/food/cnds/random
	name = "神秘馅料C&Ds"
	desc = "内含四种美味口味之一！"

/obj/item/food/cnds/random/Initialize(mapload)
	var/random_flavour = pick(subtypesof(/obj/item/food/cnds) - /obj/item/food/cnds/random)
	var/obj/item/food/sample = new random_flavour(loc)
	name = sample.name
	desc = sample.desc
	food_reagents = sample.food_reagents
	tastes = sample.tastes

	qdel(sample)

	. = ..()

/obj/item/food/pistachios
	name = "\improper 甜心牌开心果"
	desc = "一包甜心牌优质开心果。"
	icon_state = "pistachio"
	trash_type = /obj/item/trash/pistachios
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	) //a healthy but expensive snack
	tastes = list("pistachios" = 4, "subtle sweetness" = 1)
	foodtypes = JUNKFOOD | NUTS
	custom_price = PAYCHECK_CREW//pistachios are even more expensive.
	junkiness = 10 //on par with peanuts
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/pistachios/grind_results()
	return list(/datum/reagent/consumable/peanut_butter = 5, /datum/reagent/consumable/nutriment/fat/oil = 2)

/obj/item/food/semki
	name = "\improper 赛姆奇葵花籽"
	desc = "一包烤葵花籽。深受太空俄罗斯人和老奶奶们的喜爱。"
	icon_state = "semki"
	trash_type = /obj/item/trash/semki
	food_reagents = list(
		/datum/reagent/consumable/nutriment/fat/oil = 1,
		/datum/reagent/consumable/salt = 6,
	) //1 cornoil is equal to 1.33 nutriment
	tastes = list("sunflowers" = 5)
	foodtypes = JUNKFOOD | NUTS
	custom_price = PAYCHECK_LOWER * 0.4 //sunflowers are cheap in real life.
	bite_consumption = 1
	junkiness = 25
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/semki/healthy
	name = "烤葵花籽"
	desc = "纸杯装的自制烤葵花籽。一边看着行人经过，一边享用健康饱腹的小零食。"
	icon_state = "sunseeds"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/vitamin = 2,
		/datum/reagent/iron = 2,
	)
	junkiness = 5 //Homemade or not, sunflower seets are always kinda junky
	foodtypes = JUNKFOOD | NUTS
	trash_type = /obj/item/trash/semki/healthy
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/cornchips
	name = "\improper 波力多玉米片"
	desc = "三角形的玉米片。它们尝起来似乎有点平淡，但配上某种蘸酱可能会很不错。"
	icon_state = "boritos"
	trash_type = /obj/item/trash/boritos
	bite_consumption = 2
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/fat/oil = 2,
		/datum/reagent/consumable/salt = 3,
	)
	junkiness = 20
	custom_price = PAYCHECK_LOWER * 0.8  //we are filled to the brim with flavor
	tastes = list("fried corn" = 1)
	foodtypes = JUNKFOOD | FRIED
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/cornchips/make_leave_trash()
	AddElement(/datum/element/food_trash, trash_type, FOOD_TRASH_POPABLE)

/obj/item/food/cornchips/blue
	name = "\improper 酷牧场味波利多玉米片"
	desc = "是先有牧场味，还是先有酷牧场味？"
	icon_state = "boritos"
	trash_type = /obj/item/trash/boritos
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/fat/oil = 2,
		/datum/reagent/consumable/salt = 3,
		/datum/reagent/consumable/yoghurt = 1,
		/datum/reagent/consumable/garlic = 1,
	)
	tastes = list("fried corn" = 1, "coolest ranch" = 3)

/obj/item/food/cornchips/green
	name = "\improper 太空莎莎味波利多玉米片"
	desc = "莎莎酱已经烤进去了，所以你不需要蘸酱。"
	icon_state = "boritosgreen"
	trash_type = /obj/item/trash/boritos/green
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/fat/oil = 2,
		/datum/reagent/consumable/salt = 3,
		/datum/reagent/consumable/astrotame = 1,
		/datum/reagent/consumable/blackpepper = 1,
	)
	tastes = list("fried corn" = 1, "spess salsa" = 3)

/obj/item/food/cornchips/red
	name = "\improper 纳乔奶酪味波利多玉米片"
	desc = "以让所有你触摸的东西都沾上橙色奶酪粉而臭名昭著。"
	icon_state = "boritosred"
	trash_type = /obj/item/trash/boritos/red
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/fat/oil = 2,
		/datum/reagent/consumable/salt = 3,
		/datum/reagent/consumable/astrotame = 1,
		/datum/reagent/consumable/cornmeal = 1,
	)
	tastes = list("fried corn" = 1, "nacho cheese" = 3)

/obj/item/food/cornchips/purple
	name = "\improper 香辣甜椒味波利多玉米片"
	desc = "唯一一种尝起来像正宗纳乔那样辣的口味。"
	icon_state = "boritospurple"
	trash_type = /obj/item/trash/boritos/purple
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/fat/oil = 2,
		/datum/reagent/consumable/salt = 3,
		/datum/reagent/consumable/capsaicin = 1,
		/datum/reagent/consumable/sugar = 1,
	)
	tastes = list("fried corn" = 1, "spicy & sweet chili" = 3)

/obj/item/food/cornchips/random
	name = "\improper 波利多玉米片"
	desc = "内含四种美味口味之一！"

/obj/item/food/cornchips/random/Initialize(mapload)
	var/random_flavour = pick(subtypesof(/obj/item/food/cornchips) - /obj/item/food/cornchips/random)

	var/obj/item/food/sample = new random_flavour(loc)

	name = sample.name
	desc = sample.desc
	food_reagents = sample.food_reagents
	icon_state = sample.icon_state
	trash_type = sample.trash_type
	tastes = sample.tastes

	qdel(sample)

	. = ..()

/obj/item/food/hot_shots
	name = "\improper 热力弹"
	desc = "终极棒球零食。一旦开始，就停不下来！"
	icon_state = "hot_shots"
	trash_type = /obj/item/trash/hot_shots
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("popcorn" = 1, "caramel" = 1, "peanuts" = 1)
	foodtypes = JUNKFOOD | SUGAR | NUTS
	junkiness = 25
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/hot_shots/grind_results()
	return list(/datum/reagent/consumable/nutriment/fat/oil = 3, /datum/reagent/consumable/caramel = 2)

/obj/item/food/sticko
	name = "\improper 经典味奇巧棒"
	desc = "适合所有年龄段的经典美食，这就是奇巧棒，最初的巧克力涂层饼干棒！这是原味（有些人会说，也是最好的口味）：饼干和牛奶巧克力。"
	icon_state = "sticko_classic"
	trash_type = /obj/item/trash/sticko
	food_reagents = list(
		/datum/reagent/consumable/sugar = 3,
		/datum/reagent/consumable/coco = 1,
	)
	tastes = list("biscuit" = 1, "chocolate" = 1)
	junkiness = 25
	foodtypes = JUNKFOOD | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/sticko/matcha
	name = "\improper 抹茶味奇巧棒"
	desc = "适合所有年龄段的经典美食，这就是奇巧棒，最初的巧克力涂层饼干棒！这款使用抹茶味白巧克力作为涂层，以唤起传统的感觉。"
	icon_state = "sticko_matcha"
	trash_type = /obj/item/trash/sticko/matcha
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/caramel = 1,
	)
	tastes = list("biscuit" = 1, "matcha" = 1)

/obj/item/food/sticko/nutty
	name = "\improper 坚果味奇巧棒"
	desc = "适合所有年龄段的经典美食，这就是奇巧棒，最初的巧克力涂层饼干棒！这款使用花生酱味巧克力作为涂层，带来坚果风味的变化。"
	icon_state = "sticko_nutty"
	trash_type = /obj/item/trash/sticko/nutty
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/coco = 1,
	)
	tastes = list("biscuit" = 1, "peanut butter" = 1)
	foodtypes = JUNKFOOD | GRAIN | NUTS

/obj/item/food/sticko/pineapple
	name = "\improper 菠萝味奇巧棒"
	desc = "一款适合所有年龄段的经典美食，它就是Sticko，原版巧克力涂层饼干棒！这款采用了菠萝味白巧克力作为涂层，专为那些菠萝爱好者准备。"
	icon_state = "sticko_pineapple"
	trash_type = /obj/item/trash/sticko/pineapple
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/peanut_butter = 1,
	)
	tastes = list("biscuit" = 1, "pineapple" = 1)
	foodtypes = JUNKFOOD | GRAIN | PINEAPPLE

/obj/item/food/sticko/yuyake
	name = "\improper 夕烧味Sticko"
	desc = "一款适合所有年龄段的经典美食，它就是Sticko，原版巧克力涂层饼干棒！这款采用了夕烧味白巧克力作为涂层，带来清爽的瓜果风味。"
	icon_state = "sticko_yuyake"
	trash_type = /obj/item/trash/sticko/yuyake
	food_reagents = list(
		/datum/reagent/consumable/sugar = 2,
		/datum/reagent/consumable/coco = 1,
		/datum/reagent/consumable/banana = 1,
	)
	tastes = list("biscuit" = 1, "melon" = 1)

/obj/item/food/sticko/random
	name = "\improper 神秘口味Sticko"
	desc = "一款适合所有年龄段的经典美食，它就是Sticko，原版巧克力涂层饼干棒！这款带有遮蔽纸套，隐藏了真实风味……"

/obj/item/food/sticko/random/Initialize(mapload)
	var/random_flavour = pick(subtypesof(/obj/item/food/sticko) - /obj/item/food/sticko/random)
	var/obj/item/food/sample = new random_flavour(loc)
	name = sample.name
	desc = sample.desc
	food_reagents = sample.food_reagents
	tastes = sample.tastes

	qdel(sample)

	. = ..()

/obj/item/food/shok_roks
	name = "\improper Shok-Roks - 风暴云糖果味"
	desc = "你听说过Snap-Roks，现在准备好迎接Shok-Roks：为以太族准备的跳跳糖！共有5种令人兴奋的口味，本袋装的是风暴云糖果味——像棉花糖，但是带电的！"
	icon_state = "shok_roks_candy"
	trash_type = /obj/item/trash/shok_roks
	food_reagents = list(
		/datum/reagent/consumable/liquidelectricity/enriched = 2,
		/datum/reagent/consumable/sugar = 3
	)
	tastes = list("sugar" = 1, "lightning" = 1)

/obj/item/food/shok_roks/citrus
	name = "\improper Shok-Roks - 卷云柑橘味"
	desc = "你听说过Snap-Roks，现在准备好迎接Shok-Roks：为以太族准备的跳跳糖！共有5种令人兴奋的口味，本袋装的是卷云柑橘味——拥有所有柑橘风味，不含任何真实柑橘提取物。"
	icon_state = "shok_roks_citrus"
	trash_type = /obj/item/trash/shok_roks/citrus
	tastes = list("citrus" = 1, "lightning" = 1)

/obj/item/food/shok_roks/berry
	name = "\improper Shok-Roks - 浆果风暴味"
	desc = "你听说过Snap-Roks，现在准备好迎接Shok-Roks：为以太族准备的跳跳糖！共有5种令人兴奋的口味，本袋装的是浆果风暴味——充满了难以名状的酸浆果风味！"
	icon_state = "shok_roks_berry"
	trash_type = /obj/item/trash/shok_roks/berry
	tastes = list("sour berry" = 1, "lightning" = 1)

/obj/item/food/shok_roks/tropical
	name = "\improper Shok-Roks - 热带雷鸣味"
	desc = "你听说过Snap-Roks，现在准备好迎接Shok-Roks：为以太族准备的跳跳糖！共有5种令人兴奋的口味，本袋装的是热带雷鸣味——包含所有热带水果！所有！"
	icon_state = "shok_roks_tropical"
	trash_type = /obj/item/trash/shok_roks/tropical
	tastes = list("tropical fruits" = 1, "lightning" = 1)

/obj/item/food/shok_roks/lanternfruit
	name = "\improper Shok-Roks - 闪电灯笼果味"
	desc = "你听说过Snap-Roks，现在准备好迎接Shok-Roks：为以太族准备的跳跳糖！共有5种令人兴奋的口味，本袋装的是闪电灯笼果味——唯一一种使用斯普劳特本土水果的Shok-Rok口味。"
	icon_state = "shok_roks_lanternfruit"
	trash_type = /obj/item/trash/shok_roks/lanternfruit
	tastes = list("sour pear" = 1, "lightning" = 1)

/obj/item/food/shok_roks/random
	name = "\improper Shok-Roks - 隐藏飓风味"
	desc = "你听说过Snap-Roks，现在准备好迎接Shok-Roks：为以太族准备的跳跳糖！共有5种令人兴奋的口味，其中任何一种都可能在这袋里！"

/obj/item/food/shok_roks/random/Initialize(mapload)
	var/random_flavour = pick(subtypesof(/obj/item/food/shok_roks) - /obj/item/food/shok_roks/random)
	var/obj/item/food/sample = new random_flavour(loc)
	name = sample.name
	desc = sample.desc
	food_reagents = sample.food_reagents
	tastes = sample.tastes

	qdel(sample)

	. = ..()
