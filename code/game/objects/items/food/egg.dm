
////////////////////////////////////////////EGGS////////////////////////////////////////////

/obj/item/food/chocolateegg
	name = "巧克力蛋"
	desc = "如此，甜美，令人发胖的食物。"
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "chocolateegg"
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/sugar = 2, /datum/reagent/consumable/coco = 2, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("chocolate" = 4, "sweetness" = 1)
	foodtypes = JUNKFOOD | SUGAR | EGG
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY
	crafting_complexity = FOOD_COMPLEXITY_2

/// Counter for number of chicks hatched by throwing eggs, minecraft style. Chicks will not emerge from thrown eggs if this value exceeds the MAX_CHICKENS define.
GLOBAL_VAR_INIT(chicks_from_eggs, 0)

/obj/item/food/egg
	name = "鸡蛋"
	desc = "一个鸡蛋！"
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "egg"
	inhand_icon_state = "egg"
	food_reagents = list(/datum/reagent/consumable/eggyolk = 2, /datum/reagent/consumable/eggwhite = 4)
	foodtypes = MEAT | RAW | EGG
	w_class = WEIGHT_CLASS_TINY
	ant_attracting = FALSE
	decomp_type = /obj/item/food/egg/rotten
	decomp_req_handle = TRUE //so laid eggs can actually become chickens
	/// How likely is it that a chicken will come out of here if we throw it?
	var/chick_throw_prob = 13

/obj/item/food/egg/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/boiledegg, rand(15 SECONDS, 20 SECONDS), TRUE, TRUE)

/obj/item/food/egg/make_microwaveable()
	AddElement(/datum/element/microwavable, /obj/item/food/boiledegg)

/obj/item/food/egg/organic
	name = "有机鸡蛋"
	desc = "一个来自最棒母鸡的100%天然鸡蛋。"
	starting_reagent_purity = 1

/obj/item/food/egg/rotten
	food_reagents = list(/datum/reagent/consumable/eggrot = 10, /datum/reagent/consumable/mold = 10)
	foodtypes = GROSS
	preserved_food = TRUE

/obj/item/food/egg/rotten/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/boiledegg/rotten, rand(15 SECONDS, 20 SECONDS), TRUE, TRUE)

/obj/item/food/egg/rotten/make_microwaveable()
	AddElement(/datum/element/microwavable, /obj/item/food/boiledegg/rotten)

/obj/item/food/egg/gland
	desc = "一个鸡蛋！它看起来有点怪..."

/obj/item/food/egg/gland/Initialize(mapload)
	. = ..()
	reagents.add_reagent(get_random_reagent_id(), 15)

	var/color = mix_color_from_reagents(reagents.reagent_list)
	add_atom_colour(color, FIXED_COLOUR_PRIORITY)

/obj/item/food/egg/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if (..()) // was it caught by a mob?
		return

	var/turf/hit_turf = get_turf(hit_atom)
	new /obj/effect/decal/cleanable/food/egg_smudge(hit_turf)
	if (prob(chick_throw_prob))
		spawn_impact_chick(hit_turf)
	reagents.expose(hit_atom, TOUCH)
	qdel(src)

/// Spawn a baby chicken from throwing an egg
/obj/item/food/egg/proc/spawn_impact_chick(turf/spawn_turf)
	var/chickens_remaining = MAX_CHICKENS - GLOB.chicks_from_eggs
	if (chickens_remaining < 1)
		return
	var/spawned_chickens = prob(97) ? 1 : min(4, chickens_remaining) // We don't want to go over the limit
	if (spawned_chickens > 1) // Chicken jackpot!
		visible_message(span_notice("[spawned_chickens]只小鸡从蛋里出来了！中大奖了！"))
	else
		visible_message(span_notice("一只小鸡从裂开的蛋里出来了！"))
	for(var/i in 1 to spawned_chickens)
		new /mob/living/basic/chick(spawn_turf)
		GLOB.chicks_from_eggs++

/obj/item/food/egg/attackby(obj/item/item, mob/user, list/modifiers, list/attack_modifiers)
	if(istype(item, /obj/item/toy/crayon))
		var/obj/item/toy/crayon/crayon = item
		var/clr = crayon.crayon_color

		if(!(clr in list("blue", "green", "mime", "orange", "purple", "rainbow", "red", "yellow")))
			to_chat(usr, span_notice("[src]拒绝染上这种颜色！"))
			return

		to_chat(usr, span_notice("你用[item]给[src]上了色。"))
		icon_state = "egg-[clr]"

	else if(istype(item, /obj/item/stamp/clown))
		var/clowntype = pick("grock", "grimaldi", "rainbow", "chaos", "joker", "sexy", "standard", "bobble",
			"krusty", "bozo", "pennywise", "ronald", "jacobs", "kelly", "popov", "cluwne")
		icon_state = "egg-clown-[clowntype]"
		desc = "一个被装饰成小丑面孔那怪诞、可被暴揍模样的鸡蛋。"
		to_chat(usr, span_notice("你用[item]在[src]上盖章，创造了一个艺术且毫不吓人的小丑妆容形象。"))

	else if(is_reagent_container(item))
		var/obj/item/reagent_containers/dunk_test_container = item
		if (!dunk_test_container.is_drainable() || !dunk_test_container.reagents.has_reagent(/datum/reagent/water))
			return

		to_chat(user, span_notice("你检查[src]是否坏了。"))
		if(istype(src, /obj/item/food/egg/rotten))
			to_chat(user, span_warning("[src]在[dunk_test_container]里浮起来了！"))
		else
			to_chat(user, span_notice("[src]沉入了[dunk_test_container]！"))
	else
		..()

/obj/item/food/egg/interact_with_atom_secondary(atom/interacting_with, mob/living/user, list/modifiers)
	if(!istype(interacting_with, /obj/machinery/griddle))
		return NONE

	var/obj/machinery/griddle/hit_griddle = interacting_with
	if(length(hit_griddle.griddled_objects) >= hit_griddle.max_items)
		interacting_with.balloon_alert(user, "没地方了！")
		return ITEM_INTERACT_BLOCKING
	var/atom/broken_egg = new /obj/item/food/rawegg(interacting_with.loc)
	if(LAZYACCESS(modifiers, ICON_X))
		broken_egg.pixel_x = clamp(text2num(LAZYACCESS(modifiers, ICON_X)) - 16, -(ICON_SIZE_X/2), ICON_SIZE_X/2)
	if(LAZYACCESS(modifiers, ICON_Y))
		broken_egg.pixel_y = clamp(text2num(LAZYACCESS(modifiers, ICON_Y)) - 16, -(ICON_SIZE_Y/2), ICON_SIZE_Y/2)
	playsound(user, 'sound/items/sheath.ogg', 40, TRUE)
	reagents.trans_to(broken_egg, reagents.total_volume, copy_only = TRUE)

	hit_griddle.AddToGrill(broken_egg, user)
	interacting_with.balloon_alert(user, "敲开了[src]")

	qdel(src)
	return ITEM_INTERACT_BLOCKING

/obj/item/food/egg/blue
	icon_state = "egg-blue"
	inhand_icon_state = "egg-blue"

/obj/item/food/egg/green
	icon_state = "egg-green"
	inhand_icon_state = "egg-green"

/obj/item/food/egg/mime
	icon_state = "egg-mime"
	inhand_icon_state = "egg-mime"

/obj/item/food/egg/orange
	icon_state = "egg-orange"
	inhand_icon_state = "egg-orange"

/obj/item/food/egg/purple
	icon_state = "egg-purple"
	inhand_icon_state = "egg-purple"

/obj/item/food/egg/rainbow
	icon_state = "egg-rainbow"
	inhand_icon_state = "egg-rainbow"

/obj/item/food/egg/red
	icon_state = "egg-red"
	inhand_icon_state = "egg-red"

/obj/item/food/egg/yellow
	icon_state = "egg-yellow"
	inhand_icon_state = "egg-yellow"

/obj/item/food/egg/penguin_egg
	icon = 'icons/mob/simple/penguins.dmi'
	icon_state = "penguin_egg"

/obj/item/food/egg/fertile
	name = "看起来能孵化的蛋"
	desc = "An egg! It looks fertilized.\nQuite how you can tell this just by looking at it is a mystery."
	chick_throw_prob = 100

/obj/item/food/egg/fertile/Initialize(mapload, loc)
	. = ..()

	AddComponent(/datum/component/fertile_egg,\
		embryo_type = /mob/living/basic/chick,\
		minimum_growth_rate = 1,\
		maximum_growth_rate = 2,\
		total_growth_required = 200,\
		current_growth = 0,\
		location_allowlist = typecacheof(list(/turf)),\
		spoilable = FALSE,\
	)

/obj/item/food/friedegg
	name = "煎蛋"
	desc = "一个煎蛋。加点盐和胡椒粉会更好吃。"
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "friedegg"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/consumable/eggyolk = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	bite_consumption = 1
	tastes = list("egg" = 4)
	foodtypes = MEAT | FRIED | BREAKFAST | EGG
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/rawegg
	name = "生鸡蛋"
	desc = "据说对你有好处，如果你能咽得下去的话。煎熟更好。"
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "rawegg"
	food_reagents = list() // Receives all reagents from its whole egg counterpart
	bite_consumption = 1
	tastes = list("raw egg" = 6, "sliminess" = 1)
	eatverbs = list("gulp down")
	foodtypes = MEAT | RAW | EGG
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/rawegg/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/friedegg, rand(20 SECONDS, 35 SECONDS), TRUE, FALSE)

/obj/item/food/boiledegg
	name = "煮鸡蛋"
	desc = "一个煮熟的鸡蛋。"
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "egg"
	inhand_icon_state = "egg"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("egg" = 1)
	foodtypes = MEAT | BREAKFAST | EGG
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL
	ant_attracting = FALSE
	decomp_type = /obj/item/food/boiledegg/rotten
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/eggsausage
	name = "鸡蛋配香肠"
	desc = "一颗好鸡蛋配上一些香肠。"
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "eggsausage"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 8, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/consumable/nutriment = 4)
	foodtypes = MEAT | FRIED | BREAKFAST | EGG
	tastes = list("egg" = 4, "meat" = 4)
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/boiledegg/rotten
	food_reagents = list(/datum/reagent/consumable/eggrot = 10)
	tastes = list("rotten egg" = 1)
	foodtypes = GROSS
	preserved_food = TRUE

/obj/item/food/omelette //FUCK THIS
	name = "奶酪煎蛋卷"
	desc = "你只能说出这句话！"
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "omelette"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	bite_consumption = 1
	w_class = WEIGHT_CLASS_SMALL
	tastes = list("egg" = 1, "cheese" = 1)
	foodtypes = MEAT | BREAKFAST | DAIRY | EGG
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/omelette/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/love_food_buff, /datum/status_effect/food/speech/french)

/obj/item/food/omelette/attackby(obj/item/item, mob/user, list/modifiers, list/attack_modifiers)
	if(istype(item, /obj/item/kitchen/fork))
		var/obj/item/kitchen/fork/fork = item
		if(fork.forkload)
			to_chat(user, span_warning("你的叉子上已经有煎蛋卷了！"))
		else
			fork.icon_state = "forkloaded"
			user.visible_message(span_notice("[user]用[user.p_their()]的叉子取走了一块煎蛋卷！"), \
				span_notice("你用叉子取走了一块煎蛋卷。"))

			var/datum/reagent/reagent = pick(reagents.reagent_list)
			reagents.remove_reagent(reagent.type, 1)
			fork.forkload = reagent
			if(reagents.total_volume <= 0)
				qdel(src)
		return
	..()

/obj/item/food/benedict
	name = "班尼迪克蛋"
	desc = "这上面只有一个鸡蛋，真没礼貌。"
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "benedict"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment = 3,
	)
	w_class = WEIGHT_CLASS_SMALL
	tastes = list("egg" = 1, "bacon" = 1, "bun" = 1)
	foodtypes = MEAT|BREAKFAST|GRAIN|FRIED|EGG
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/eggwrap
	name = "鸡蛋卷"
	desc = "“毯子裹猪”的前身。"
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "eggwrap"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("egg" = 1)
	foodtypes = MEAT|VEGETABLES|FRIED|EGG
	w_class = WEIGHT_CLASS_TINY
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/chawanmushi
	name = "茶碗蒸"
	desc = "一种传奇的鸡蛋羹，能让敌人变成朋友。可能太烫了，猫吃不了。"
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "chawanmushi"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("custard" = 1)
	foodtypes = MEAT | VEGETABLES | EGG
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/spore_sack
	name = "孢子囊"
	desc = "一个孢子囊。黏糊糊、软趴趴的！"
	icon = 'icons/obj/food/egg.dmi'
	icon_state = "spore_sack"
	base_icon_state = "spore_sack"
	inhand_icon_state = "egg"
	food_reagents = list(/datum/reagent/consumable/eggyolk = 4,  /datum/reagent/toxin/spore = 4, /datum/reagent/consumable/eggwhite = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("sliminess" = 4, "blob" = 2)
	foodtypes = MEAT | RAW | TOXIC | EGG
	w_class = WEIGHT_CLASS_TINY
	ant_attracting = FALSE
	preserved_food = TRUE

/obj/item/food/spore_sack/Initialize(mapload)
	. = ..()
	if(prob(50))
		icon_state = "[base_icon_state]2"

	AddElement(/datum/element/swabable, CELL_LINE_TABLE_BLOBSPORE, CELL_VIRUS_TABLE_GENERIC_MOB, 1, 5)

/obj/item/food/spore_sack/interact_with_atom_secondary(atom/interacting_with, mob/living/user, list/modifiers)
	if(!istype(interacting_with, /obj/machinery/griddle))
		return NONE

	var/obj/machinery/griddle/hit_griddle = interacting_with
	if(length(hit_griddle.griddled_objects) >= hit_griddle.max_items)
		interacting_with.balloon_alert(user, "没地方了！")
		return ITEM_INTERACT_BLOCKING
	var/atom/broken_egg = new /obj/item/food/rawegg/spore(interacting_with.loc)
	if(LAZYACCESS(modifiers, ICON_X))
		broken_egg.pixel_x = clamp(text2num(LAZYACCESS(modifiers, ICON_X)) - 16, -(ICON_SIZE_X/2), ICON_SIZE_X/2)
	if(LAZYACCESS(modifiers, ICON_Y))
		broken_egg.pixel_y = clamp(text2num(LAZYACCESS(modifiers, ICON_Y)) - 16, -(ICON_SIZE_Y/2), ICON_SIZE_Y/2)
	playsound(user, 'sound/items/sheath.ogg', 40, TRUE)
	reagents.trans_to(broken_egg, reagents.total_volume, copy_only = TRUE)

	hit_griddle.AddToGrill(broken_egg, user)
	interacting_with.balloon_alert(user, "敲开了[src]")

	qdel(src)
	return ITEM_INTERACT_BLOCKING

/obj/item/food/spore_sack/independent
	icon_state = "spore_sack_independent"
	base_icon_state = "spore_sack_independent"

/obj/item/food/friedegg/spore
	name = "煎孢子"
	desc = "一个煎过的史莱姆孢子。加点冷酱汁应该会很好吃。"
	icon_state = "friedspore"
	//superior healing and cyto reagents to compensate for rarity and mild poison effect.
	food_reagents = list(
		/datum/reagent/consumable/nutriment/peptides = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("blob" = 4, "level 5 biohazard" = 2)

/obj/item/food/rawegg/spore
	name = "爆裂孢子"
	desc = "这就是大家总在说的蚂蚁蛋吗？煎一下更好吃。"
	icon_state = "burstspore"
	tastes = list("sliminess" = 4, "blob" = 2)

/obj/item/food/rawegg/spore/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_BLOBSPORE, CELL_VIRUS_TABLE_GENERIC_MOB, 1, 5)

/obj/item/food/rawegg/spore/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/friedegg/spore, rand(15 SECONDS, 25 SECONDS), TRUE, FALSE)
