//Not only meat, actually, but also snacks that are almost meat, such as fish meat or tofu


////////////////////////////////////////////FISH////////////////////////////////////////////

/obj/item/food/cubancarp
	name = "\improper 古巴鲤鱼"
	desc = "一个格里夫风味的超赞三明治，先灼烧你的舌头，然后让它麻木！"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "cubancarp"
	bite_consumption = 3
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/capsaicin = 1,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("fish" = 4, "batter" = 1, "hot peppers" = 1)
	foodtypes = VEGETABLES|GRAIN|SEAFOOD|FRIED
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/fishmeat
	name = "鱼排"
	desc = "一块鱼肉片。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "fishfillet"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	bite_consumption = 6
	tastes = list("fish" = 1)
	foodtypes = SEAFOOD
	eatverbs = list("bite", "chew", "gnaw", "swallow", "chomp")
	w_class = WEIGHT_CLASS_SMALL
	starting_reagent_purity = 1.0
	var/fillet_name = "%NAME fillet"

/obj/item/food/fishmeat/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_FOOD_DONT_INHERIT_NAME_FROM_PROCESSED, INNATE_TRAIT)

/obj/item/food/fishmeat/OnCreatedFromProcessing(mob/living/user, obj/item/work_tool, list/chosen_option, atom/original_atom)
	. = ..()
	name = replacetext(fillet_name, "%NAME", original_atom.name)
	material_flags &= ~MATERIAL_ADD_PREFIX //don't double down on material prefixes

/obj/item/food/fishmeat/quality
	name = "优质鱼片"
	desc = "一块珍贵的鱼肉片。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	bite_consumption = 7
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/fishmeat/quality/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/quality_food_ingredient, FOOD_COMPLEXITY_1)

/obj/item/food/fishmeat/salmon
	name = "三文鱼片"
	desc = "一块厚实多脂的三文鱼肉片。"
	icon_state = "salmon"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/vitamin = 3,
		/datum/reagent/consumable/nutriment/fat = 2,
	)
	bite_consumption = 4.5
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/fishmeat/salmon/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/quality_food_ingredient, FOOD_COMPLEXITY_1)

/obj/item/food/fishmeat/carp
	name = "鲤鱼片"
	desc = "一块太空鲤鱼鱼肉片。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/toxin/carpotoxin = 2,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	/// Cytology category you can swab the meat for.
	var/cell_line = CELL_LINE_TABLE_CARP

/obj/item/food/fishmeat/carp/Initialize(mapload)
	. = ..()
	if(cell_line)
		AddElement(/datum/element/swabable, cell_line, CELL_VIRUS_TABLE_GENERIC_MOB)

/obj/item/food/fishmeat/carp/imitation
	name = "仿制鲤鱼片"
	desc = "几乎和真的一样，大概吧。"
	cell_line = null
	starting_reagent_purity = 0.3

///carp fillet, but without the toxin. Used by baby carps (fish item), which have a trait that handles the toxin already.
/obj/item/food/fishmeat/carp/no_tox

/obj/item/food/fishmeat/carp/no_tox/Initialize(mapload)
	food_reagents -= /datum/reagent/toxin/carpotoxin
	return ..()

/obj/item/food/fishmeat/moonfish
	name = "月鱼片"
	desc = "一块月鱼肉片。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "moonfish_fillet"

/obj/item/food/fishmeat/moonfish/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/grilled_moonfish, rand(40 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/fishmeat/gunner_jellyfish
	name = "炮手水母片"
	desc = "一只去除了刺细胞的炮手水母。生食时具有轻微的致幻性。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "jellyfish_fillet"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 4, //The halluginogen comes from the fish trait.
	)

///Premade gunner jellyfish fillets from supply orders. Contains the halluginogen that'd be normally from the fish trait.
/obj/item/food/fishmeat/gunner_jellyfish/supply
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 4, /datum/reagent/toxin/mindbreaker/fish = 2)

/obj/item/food/fishmeat/armorfish
	name = "清理过的甲壳鱼"
	desc = "一只去除了内脏和外壳的甲壳鱼，已准备好用于烹饪。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "armorfish_fillet"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 3)
	fillet_name = "cleaned %NAME"

///donkfish fillets. The yuck reagent is now added by the fish trait of the same name.
/obj/item/food/fishmeat/donkfish
	name = "唐克鱼片"
	desc = "令人畏惧的唐克鱼片。没有哪个理智的太空人会吃这个，而且煮熟了也不会变好。"
	icon_state = "donkfillet"
	starting_reagent_purity = 0.3

/obj/item/food/fishmeat/octopus
	name = "章鱼触手"
	desc = "一条来自章鱼的大触手。"
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "octopus_fillet"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 3)
	fillet_name = "%NAME tentacle"

/obj/item/food/fishmeat/octopus/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/grilled_octopus, rand(15 SECONDS, 25 SECONDS), TRUE, TRUE)

/obj/item/food/fishmeat/fish_tail
	name = "鱼尾肉排"
	desc = "从一条非常巨大的……鱼？的尾部直接切下的珍贵多脂肉排。因其稀有性，在某些太空区域被视为珍馐。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/consumable/nutriment/fat = 2,
	)
	bite_consumption = 5
	tastes = list("fatty fish" = 1)
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/fishmeat/fish_tail/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/quality_food_ingredient, FOOD_COMPLEXITY_1)

/obj/item/food/fishfingers
	name = "鱼条"
	desc = "一条鱼指。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "fishfingers"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	bite_consumption = 1
	tastes = list("fish" = 1, "breadcrumbs" = 1)
	foodtypes = GRAIN|SEAFOOD|FRIED
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/fishandchips
	name = "炸鱼薯条"
	desc = "我确实要这么说，老兄。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "fishandchips"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("fish" = 1, "chips" = 1)
	foodtypes = SEAFOOD | VEGETABLES | FRIED
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/fishfry
	name = "炸鱼"
	desc = "就这些了，连一包薯条都没有……"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "fishfry"
	food_reagents = list (
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("fish" = 1, "pan-seared vegetables" = 1)
	foodtypes = SEAFOOD | VEGETABLES | FRIED
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/vegetariansushiroll
	name = "素食寿司卷"
	desc = "一卷简单的素食寿司，包含米饭、胡萝卜和土豆。可切片成块！"
	icon_state = "vegetariansushiroll"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("boiled rice" = 4, "carrots" = 2, "potato" = 2)
	foodtypes = VEGETABLES|GRAIN
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/vegetariansushiroll/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/vegetariansushislice, 4, screentip_verb = "Chop")

/obj/item/food/vegetariansushislice
	name = "素食寿司片"
	desc = "一片简单的素食寿司，包含米饭、胡萝卜和土豆。"
	icon_state = "vegetariansushislice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("boiled rice" = 4, "carrots" = 2, "potato" = 2)
	foodtypes = VEGETABLES|GRAIN
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/spicyfiletsushiroll
	name = "辣味鱼排寿司卷"
	desc = "一卷用鱼和蔬菜制成的美味辣味寿司。可切片成块！"
	icon_state = "spicyfiletroll"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/capsaicin = 4,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("boiled rice" = 4, "fish" = 2, "spicyness" = 2)
	foodtypes = VEGETABLES|GRAIN|SEAFOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/spicyfiletsushiroll/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/spicyfiletsushislice, 4, screentip_verb = "Chop")

/obj/item/food/spicyfiletsushislice
	name = "辣味鱼排寿司片"
	desc = "一片用鱼和蔬菜制成的美味辣味寿司。别吃得太快！"
	icon_state = "spicyfiletslice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 1,
		/datum/reagent/consumable/capsaicin = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("boiled rice" = 4, "fish" = 2, "spicyness" = 2)
	foodtypes = VEGETABLES|GRAIN|SEAFOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

// empty sushi for custom sushi
/obj/item/food/sushi/empty
	name = "寿司"
	foodtypes = VEGETABLES
	tastes = list()
	icon_state = "vegetariansushiroll"
	desc = "一卷定制的寿司。"
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/sushi/empty/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/sushislice/empty, 4, screentip_verb = "Chop")

/obj/item/food/sushislice/empty
	name = "寿司片"
	foodtypes = VEGETABLES
	tastes = list()
	icon_state = "vegetariansushislice"
	desc = "一片定制的寿司。"
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/nigiri_sushi
	name = "握寿司"
	desc = "简单的握寿司，一片鱼肉置于紧实的饭团上，用海苔包裹，配有一份酱油。"
	icon = 'icons/obj/food/food.dmi'
	icon_state = "nigiri_sushi"
	food_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 6, /datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("boiled rice" = 4, "fish filet" = 2, "soy sauce" = 2)
	foodtypes = VEGETABLES|GRAIN|SEAFOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/meat_poke
	name = "肉块波奇饭"
	desc = "简单的波奇饭，底部是米饭，顶部是蔬菜和肉。食用前应搅拌均匀。"
	icon = 'icons/obj/food/soupsalad.dmi'
	icon_state = "pokemeat"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 5,
		/datum/reagent/consumable/nutriment/protein = 2,
	)
	foodtypes = MEAT|VEGETABLES|GRAIN
	tastes = list("rice and meat" = 4, "lettuce" = 2, "soy sauce" = 2)
	trash_type = /obj/item/reagent_containers/cup/bowl
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/fish_poke
	name = "鱼肉波奇饭"
	desc = "简单的波奇饭，底部是米饭，顶部是蔬菜和鱼。食用前应搅拌均匀。"
	icon = 'icons/obj/food/soupsalad.dmi'
	icon_state = "pokefish"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/nutriment/protein = 2,
	)
	foodtypes = VEGETABLES|GRAIN|SEAFOOD
	tastes = list("rice and fish" = 4, "lettuce" = 2, "soy sauce" = 2)
	trash_type = /obj/item/reagent_containers/cup/bowl
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_4

////////////////////////////////////////////MEATS AND ALIKE////////////////////////////////////////////

/obj/item/food/tempeh
	name = "生丹贝块"
	desc = "真菌发酵的豆饼，摸起来温温的。"
	icon = 'icons/obj/food/food.dmi'
	icon_state = "tempeh"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 8)
	tastes = list("earthy" = 3, "nutty" = 2, "bland" = 1 )
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2

// sliceable into 4xtempehslices
/obj/item/food/tempeh/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/tempehslice, 4, 5 SECONDS, table_required = TRUE, screentip_verb = "Slice", sound_to_play = SFX_KNIFE_SLICE)

//add an icon for slices
/obj/item/food/tempehslice
	name = "丹贝片"
	desc = "一片丹贝，一片wkwkwk。"
	icon = 'icons/obj/food/food.dmi'
	icon_state = "tempehslice"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("earthy" = 3, "nutty" = 2, "bland" = 1)
	foodtypes = VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_2

//add an icon for blends
/obj/item/food/tempehstarter
	name = "丹贝发酵剂"
	desc = "大豆与欢乐的混合物。它是温热的……还在动？"
	icon = 'icons/obj/food/food.dmi'
	icon_state = "tempehstarter"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("nutty" = 2, "bland" = 2)
	foodtypes = VEGETABLES | GROSS
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/tofu
	name = "豆腐"
	desc = "我们都爱豆腐。"
	icon_state = "tofu"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("tofu" = 1)
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/tofu/prison
	name = "湿软的豆腐"
	desc = "你拒绝吃这种奇怪的豆腐。"
	tastes = list("sour, rotten water" = 1)
	foodtypes = GROSS

/obj/item/food/spiderleg
	name = "蜘蛛腿"
	desc = "一条仍在抽搐的巨型蜘蛛腿……你不会真的想吃这个吧？"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "spiderleg"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/toxin = 2,
	)
	tastes = list("cobwebs" = 1)
	foodtypes = MEAT | TOXIC
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/spiderleg/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/boiledspiderleg, rand(50 SECONDS, 60 SECONDS), TRUE, TRUE)

/obj/item/food/cornedbeef
	name = "咸牛肉卷心菜"
	desc = "现在你可以感觉自己像个真正的游客在爱尔兰度假了。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "cornedbeef"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("meat" = 1, "cabbage" = 1)
	foodtypes = MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/bearsteak
	name = "filet migrawr"
	desc = "因为光吃熊肉还不够爷们。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "bearsteak"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/vitamin = 9,
		/datum/reagent/consumable/ethanol/manly_dorf = 5,
	)
	tastes = list("meat" = 1, "salmon" = 1)
	foodtypes = MEAT | ALCOHOL
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/raw_meatball
	name = "生肉丸"
	desc = "一道完美的佳肴。不是一捆木头。有点生"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "raw_meatball"
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("meat" = 1)
	foodtypes = MEAT | RAW
	w_class = WEIGHT_CLASS_SMALL
	var/meatball_type = /obj/item/food/meatball
	var/patty_type = /obj/item/food/raw_patty

/obj/item/food/raw_meatball/make_grillable()
	AddComponent(/datum/component/grillable, meatball_type, rand(30 SECONDS, 40 SECONDS), TRUE)

/obj/item/food/raw_meatball/make_processable()
	AddElement(/datum/element/processable, TOOL_ROLLINGPIN, patty_type, 1, table_required = TRUE, screentip_verb = "Flatten", sound_to_play = SFX_ROLLING_PIN_ROLLING)

/obj/item/food/raw_meatball/human
	name = "奇怪的生肉丸"
	meatball_type = /obj/item/food/meatball/human
	patty_type = /obj/item/food/raw_patty/human

/obj/item/food/raw_meatball/corgi
	name = "生柯基肉丸"
	meatball_type = /obj/item/food/meatball/corgi
	patty_type = /obj/item/food/raw_patty/corgi

/obj/item/food/raw_meatball/xeno
	name = "生异形肉丸"
	meatball_type = /obj/item/food/meatball/xeno
	patty_type = /obj/item/food/raw_patty/xeno

/obj/item/food/raw_meatball/bear
	name = "生熊肉丸"
	meatball_type = /obj/item/food/meatball/bear
	patty_type = /obj/item/food/raw_patty/bear

/obj/item/food/raw_meatball/chicken
	name = "生鸡肉丸"
	meatball_type = /obj/item/food/meatball/chicken
	patty_type = /obj/item/food/raw_patty/chicken

/obj/item/food/meatball
	name = "肉丸"
	desc = "一道完美的佳肴。不是一捆木头。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "meatball"
	inhand_icon_state = "meatball"
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("meat" = 1)
	foodtypes = MEAT
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/meatball/human
	name = "奇怪的肉丸"

/obj/item/food/meatball/corgi
	name = "柯基肉丸"

/obj/item/food/meatball/bear
	name = "熊肉丸"
	tastes = list("meat" = 1, "salmon" = 1)

/obj/item/food/meatball/xeno
	name = "异形肉丸"
	tastes = list("meat" = 1, "acid" = 1)

/obj/item/food/meatball/chicken
	name = "鸡肉丸"
	tastes = list("chicken" = 1)
	icon_state = "chicken_meatball"

/obj/item/food/raw_patty
	name = "生肉饼"
	desc = "我.....还没准备好。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "raw_patty"
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("meat" = 1)
	foodtypes = MEAT | RAW
	w_class = WEIGHT_CLASS_SMALL
	var/patty_type = /obj/item/food/patty/plain

/obj/item/food/raw_patty/make_grillable()
	AddComponent(/datum/component/grillable, patty_type, rand(30 SECONDS, 40 SECONDS), TRUE)

/obj/item/food/raw_patty/human
	name = "奇怪的生肉饼"
	patty_type = /obj/item/food/patty/human

/obj/item/food/raw_patty/corgi
	name = "生柯基肉饼"
	patty_type = /obj/item/food/patty/corgi

/obj/item/food/raw_patty/bear
	name = "生熊肉饼"
	tastes = list("meat" = 1, "salmon" = 1)
	patty_type = /obj/item/food/patty/bear

/obj/item/food/raw_patty/xeno
	name = "生异形肉饼"
	tastes = list("meat" = 1, "acid" = 1)
	patty_type = /obj/item/food/patty/xeno

/obj/item/food/raw_patty/chicken
	name = "生鸡肉饼"
	tastes = list("chicken" = 1)
	patty_type = /obj/item/food/patty/chicken

/obj/item/food/patty
	name = "肉饼"
	desc = "纳米特拉森肉饼，为你我而制的肉饼！"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "patty"
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("meat" = 1)
	foodtypes = MEAT
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

///Exists purely for the crafting recipe (because it'll take subtypes)
/obj/item/food/patty/plain

/obj/item/food/patty/human
	name = "奇怪的肉饼"

/obj/item/food/patty/corgi
	name = "柯基肉饼"

/obj/item/food/patty/bear
	name = "熊肉饼"
	tastes = list("meat" = 1, "salmon" = 1)

/obj/item/food/patty/xeno
	name = "异形肉饼"
	tastes = list("meat" = 1, "acid" = 1)

/obj/item/food/patty/chicken
	name = "鸡肉饼"
	tastes = list("chicken" = 1)
	icon_state = "chicken_patty"

/obj/item/food/raw_sausage
	name = "生香肠"
	desc = "一段混合的长条肉，不过是生的。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "raw_sausage"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("meat" = 1)
	foodtypes = MEAT | RAW
	eatverbs = list("bite", "chew", "nibble", "deep throat", "gobble", "chomp")
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/raw_sausage/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/sausage, rand(60 SECONDS, 75 SECONDS), TRUE)

/obj/item/food/sausage
	name = "香肠"
	desc = "一段混合的长条肉。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "sausage"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("meat" = 1)
	foodtypes = MEAT | BREAKFAST
	food_flags = FOOD_FINGER_FOOD
	eatverbs = list("bite", "chew", "nibble", "deep throat", "gobble", "chomp")
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_price = PAYCHECK_CREW * 0.6
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/sausage/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/salami, 6, 3 SECONDS, table_required = TRUE,  screentip_verb = "Slice", sound_to_play = SFX_KNIFE_SLICE)
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/sausage/american, 1, 3 SECONDS, table_required = TRUE,  screentip_verb = "Slice", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/sausage/american
	name = "美式香肠"
	desc = "咔嚓。"
	icon_state = "american_sausage"

/obj/item/food/sausage/american/make_processable()
	return

/obj/item/food/salami
	name = "萨拉米"
	desc = "一片腌制好的萨拉米。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "salami"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 1)
	tastes = list("meat" = 1, "smoke" = 1)
	foodtypes = MEAT
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT / 6)

/obj/item/food/rawkhinkali
	name = "生亨卡利"
	desc = "一百个亨卡利？我看上去像猪吗？"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "khinkali"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/protein = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/consumable/garlic = 1,
	)
	tastes = list("meat" = 1, "onions" = 1, "garlic" = 1)
	foodtypes = MEAT|GRAIN|VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/rawkhinkali/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/khinkali, rand(50 SECONDS, 60 SECONDS), TRUE)

/obj/item/food/khinkali
	name = "khinkali"
	desc = "一百个khinkali？我看上去像猪吗？"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "khinkali"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 2,
		/datum/reagent/consumable/garlic = 2,
	)
	bite_consumption = 3
	tastes = list("meat" = 1, "onions" = 1, "garlic" = 1)
	foodtypes = MEAT|GRAIN|VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/meatbun
	name = "肉包子"
	desc = "有不是人肉的可能性。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "meatbun"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 7,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("bun" = 3, "meat" = 2)
	foodtypes = GRAIN | MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/stewedsoymeat
	name = "炖素肉"
	desc = "就连非素食者也会爱上它！"
	icon_state = "stewedsoymeat"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("soy" = 1, "vegetables" = 1)
	eatverbs = list("slurp", "sip", "inhale", "drink")
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/boiledspiderleg
	name = "水煮蜘蛛腿"
	desc = "一条煮熟后仍在抽搐的巨型蜘蛛腿。真恶心！"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "spiderlegcooked"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/capsaicin = 4,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("hot peppers" = 1, "cobwebs" = 1)
	foodtypes = MEAT
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/spidereggsham
	name = "绿蛋与火腿"
	desc = "你会在火车上吃吗？你会在飞机上吃吗？你会在漂浮在太空中的尖端企业死亡陷阱上吃吗？"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "spidereggsham"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	bite_consumption = 4
	tastes = list("meat" = 1, "the colour green" = 1)
	foodtypes = MEAT|BUGS|EGG
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/sashimi
	name = "蜘蛛刺身"
	desc = "通过把自己送进医院来庆祝从敌对外星生物的袭击中幸存。你肯定希望做这道菜的人技术高超。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "sashimi"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/capsaicin = 9,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("fish" = 1, "hot peppers" = 1)
	foodtypes = MEAT|SEAFOOD|BUGS|EGG
	w_class = WEIGHT_CLASS_TINY
	//total price of this dish is 20 and a small amount more for soy sauce, all of which are available at the orders console
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/sashimi/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_CARP, CELL_VIRUS_TABLE_GENERIC_MOB)

/obj/item/food/nugget
	name = "鸡块"
	desc = "一块形状隐约像某种东西的“鸡”块。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	icon = 'icons/obj/food/meat.dmi'
	/// Default nugget icon for recipes that need any nugget
	icon_state = "nugget_lump"
	tastes = list("\"chicken\"" = 1)
	foodtypes = MEAT
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY
	venue_value = FOOD_PRICE_CHEAP
	crafting_complexity = FOOD_COMPLEXITY_1
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)
	var/meat_source = "\"chicken\""

/obj/item/food/nugget/Initialize(mapload)
	. = ..()
	var/shape = pick("lump", "star", "lizard", "corgi")
	desc = "一块[meat_source]块，形状隐约像[shape]。"
	icon_state = "nugget_[shape]"

///subtype harvested from fish caught from, you guess it, the deepfryer
/obj/item/food/nugget/fish
	name = "鱼块"
	tastes = list("fried fish" = 1)
	foodtypes = MEAT|SEAFOOD|FRIED
	venue_value = FOOD_PRICE_NORMAL
	meat_source = "fish"

/obj/item/food/pigblanket
	name = "毯子裹猪"
	desc = "一根裹在酥脆黄油卷里的小香肠。吃掉它，把这头猪从毯子监狱中解放出来。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "pigblanket"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("meat" = 1, "butter" = 1)
	foodtypes = MEAT | DAIRY | GRAIN
	w_class = WEIGHT_CLASS_TINY
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_price = PAYCHECK_CREW
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/bbqribs
	name = "烧烤肋排"
	desc = "烧烤肋排，涂满了厚厚一层烧烤酱。有史以来最不素食的东西。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "ribs"
	w_class = WEIGHT_CLASS_NORMAL
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 3,
		/datum/reagent/consumable/bbqsauce = 10,
	)
	tastes = list("meat" = 3, "smokey sauce" = 1)
	foodtypes = MEAT | SUGAR
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)

/obj/item/food/meatclown
	name = "肉小丑"
	desc = "一块美味的圆形肉小丑。多么骇人。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "meatclown"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/consumable/banana = 2,
	)
	tastes = list("meat" = 5, "clowns" = 3, "sixteen teslas" = 1)
	w_class = WEIGHT_CLASS_SMALL
	foodtypes = MEAT | FRUIT
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/meatclown/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/slippery, 3 SECONDS)

/obj/item/food/lasagna
	name = "lasagna"
	desc = "一片千层面。周一下午的完美选择。"
	icon_state = "lasagna"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/consumable/tomatojuice = 10,
	)
	tastes = list("meat" = 3, "pasta" = 3, "tomato" = 2, "cheese" = 2)
	foodtypes = MEAT|VEGETABLES|GRAIN|DAIRY
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

//////////////////////////////////////////// KEBABS AND OTHER SKEWERS ////////////////////////////////////////////

/obj/item/food/kebab
	trash_type = /obj/item/stack/rods
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "kebab"
	abstract_type = /obj/item/food/kebab
	w_class = WEIGHT_CLASS_NORMAL
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 14)
	tastes = list("meat" = 3, "metal" = 1)
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/kebab/human
	name = "人肉串"
	desc = "一根串在签子上的人肉。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 16,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("tender meat" = 3, "metal" = 1)
	foodtypes = MEAT | GORE
	venue_value = FOOD_PRICE_CHEAP
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)

/obj/item/food/kebab/monkey
	name = "肉串"
	desc = "美味的肉，串在签子上。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 16,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("meat" = 3, "metal" = 1)
	foodtypes = MEAT
	venue_value = FOOD_PRICE_CHEAP
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)

/obj/item/food/kebab/tofu
	name = "豆腐串"
	desc = "素食肉，串在签子上。"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 15)
	tastes = list("tofu" = 3, "metal" = 1)
	foodtypes = VEGETABLES
	venue_value = FOOD_PRICE_CHEAP

/obj/item/food/kebab/tail
	name = "蜥蜴尾串"
	desc = "一根串在签子上的蜥蜴断尾。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 30,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("meat" = 8, "metal" = 4, "scales" = 1)
	foodtypes = MEAT | GORE

/obj/item/food/kebab/rat
	name = "鼠肉串"
	desc = "不那么美味的鼠肉，串在签子上。"
	icon_state = "ratkebab"
	w_class = WEIGHT_CLASS_NORMAL
	trash_type = null
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("rat meat" = 1, "metal" = 1)
	foodtypes = MEAT|RAW|GORE
	venue_value = FOOD_PRICE_CHEAP

/obj/item/food/kebab/rat/double
	name = "双层鼠肉串"
	icon_state = "doubleratkebab"
	tastes = list("rat meat" = 2, "metal" = 1)
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 20,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/iron = 2,
	)

/obj/item/food/kebab/fiesta
	name = "节日烤肉串"
	desc = "串在签子上的各式肉类和蔬菜。"
	icon_state = "fiestaskewer"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 12,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/capsaicin = 3,
	)
	tastes = list("tex-mex" = 3, "cumin" = 2)
	foodtypes = MEAT | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/fried_chicken
	name = "炸鸡"
	desc = "一块多汁的鸡肉，炸得恰到好处。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "fried_chicken1"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("chicken" = 3, "fried batter" = 1)
	foodtypes = MEAT | FRIED
	junkiness = 25
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/fried_chicken/Initialize(mapload)
	. = ..()
	if(prob(50))
		icon_state = "fried_chicken2"

/obj/item/food/beef_stroganoff
	name = "牛肉丝特罗加诺夫"
	desc = "一道由牛肉和酱汁组成的俄罗斯菜肴。在日本非常受欢迎，至少我的动漫作品是这么暗示的。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "beefstroganoff"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 16,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("beef" = 3, "sour cream" = 1, "salt" = 1, "pepper" = 1)
	foodtypes = MEAT | VEGETABLES | DAIRY

	w_class = WEIGHT_CLASS_SMALL
	//basic ingredients, but a lot of them. just covering costs here
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/beef_wellington
	name = "惠灵顿牛排"
	desc = "一块奢华的牛肉卷，覆盖着精致的蘑菇酱和意式培根火腿，然后用酥皮包裹起来。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "beef_wellington"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 21,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("beef" = 3, "mushrooms" = 1, "pancetta" = 1)
	foodtypes = MEAT | VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_NORMAL
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 4)

/obj/item/food/beef_wellington/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/beef_wellington_slice, 3, 3 SECONDS, table_required = TRUE,  screentip_verb = "Cut")

/obj/item/food/beef_wellington_slice
	name = "惠灵顿牛排切片"
	desc = "一片惠灵顿牛排，上面浇着浓郁的肉汁。简直美味。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "beef_wellington_slice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("beef" = 3, "mushrooms" = 1, "pancetta" = 1)
	foodtypes = MEAT | VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * (4/3))

/obj/item/food/korta_wellington
	name = "korta wellington"
	desc = "一块奢华的牛肉卷，覆盖着精致的蘑菇酱和意式培根火腿，然后用科塔酥皮包裹起来。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "korta_wellington"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 21,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("beef" = 3, "mushrooms" = 1, "pancetta" = 1)
	foodtypes = MEAT | VEGETABLES | NUTS
	w_class = WEIGHT_CLASS_NORMAL
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 4)

/obj/item/food/korta_wellington/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/korta_wellington_slice, 3, 3 SECONDS, table_required = TRUE,  screentip_verb = "Cut")

/obj/item/food/korta_wellington_slice
	name = "科塔惠灵顿切片"
	desc = "一片科塔牛肉惠灵顿，上面浇着浓郁的肉汁。简直美味。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "korta_wellington_slice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("beef" = 3, "mushrooms" = 1, "pancetta" = 1)
	foodtypes = MEAT | VEGETABLES | NUTS
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * (4/3))

/obj/item/food/roast_dinner
	name = "烤大餐"
	desc = "一只奢华烤鸡，配以卷心菜、欧洲防风草、土豆、豌豆、馅料和一艘小船状的肉汁。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "full_roast"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 21,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("chicken" = 3, "vegetables" = 1, "gravy" = 1)
	foodtypes = MEAT | VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_NORMAL
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)

/obj/item/food/roast_dinner/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/roast_slice, 3, 3 SECONDS, table_required = TRUE,  screentip_verb = "Cut")

/obj/item/food/roast_slice
	name = "一盘烤大餐"
	desc = "一小盘烤鸡肉、豌豆、卷心菜、欧洲防风草、土豆、馅料和……等等，我就只有这么点肉汁吗？！"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "roast_slice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("chicken" = 3, "vegetables" = 1, "gravy" = 1)
	foodtypes = MEAT | VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/roast_dinner_lizzy
	name = "无谷物烤大餐"
	desc = "一只奢华烤鸡，配以卷心菜、欧洲防风草、土豆、豌豆、科塔馅料和一艘小船状的科塔血肉汁。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "full_roast_lizzy"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 21,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("chicken" = 3, "vegetables" = 1, "gravy" = 1)
	foodtypes = MEAT | VEGETABLES | NUTS
	w_class = WEIGHT_CLASS_NORMAL
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)

/obj/item/food/roast_dinner_lizzy/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/roast_slice_lizzy, 3, 3 SECONDS, table_required = TRUE,  screentip_verb = "Cut")

/obj/item/food/roast_slice_lizzy
	name = "一盘无谷物烤大餐"
	desc = "一小盘烤鸡肉、豌豆、卷心菜、欧洲防风草、土豆、科塔馅料和……等等，我就只有这么点科塔血肉汁吗？！"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "roast_slice_lizzy"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("chicken" = 3, "vegetables" = 1, "gravy" = 1)
	foodtypes = MEAT | VEGETABLES | NUTS
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/roast_dinner_tofu
	name = "豆腐烤大餐"
	desc = "一只奢华烤制的豆腐“鸡”，配以卷心菜、欧洲防风草、土豆、豌豆、馅料和一艘小船状的豆基肉汁。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "full_roast_tofu"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 21,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("tofu" = 3, "vegetables" = 1, "gravy" = 1)
	foodtypes = GRAIN | VEGETABLES
	w_class = WEIGHT_CLASS_NORMAL
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_5

/obj/item/food/roast_dinner_tofu/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/roast_slice_tofu, 3, 3 SECONDS, table_required = TRUE,  screentip_verb = "Cut")

/obj/item/food/roast_slice_tofu
	name = "一盘豆腐烤大餐"
	desc = "一小盘烤豆腐'鸡'，配豌豆、卷心菜、欧洲防风草、土豆、馅料，还有……等等，这就是我得到的全部酱油肉汁？！"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "roast_slice_tofu"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("tofu" = 3, "vegetables" = 1, "gravy" = 1)
	foodtypes = GRAIN | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_5

/obj/item/food/full_english
	name = "full english breakfast"
	desc = "一份丰盛的盘子，配齐了所有配菜，代表了早餐艺术的巅峰。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "full_english"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("sausage" = 1, "bacon" = 1, "egg" = 1, "tomato" = 1, "mushrooms" = 1, "bread" = 1, "beans" = 1)
	foodtypes = MEAT|VEGETABLES|GRAIN|DAIRY|FRIED|BREAKFAST|EGG
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 4)

/obj/item/food/raw_meatloaf
	name = "生肉糕"
	desc = "一个由肉末、洋葱和大蒜制成的沉重'糕'。把它放进烤箱里烤！"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "raw_meatloaf"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 40,
		/datum/reagent/consumable/nutriment/vitamin = 32,
		/datum/reagent/consumable/nutriment = 32,
	)
	tastes = list("raw meat" = 3, "onions" = 1)
	foodtypes = MEAT | RAW | VEGETABLES
	w_class = WEIGHT_CLASS_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)

/obj/item/food/raw_meatloaf/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/meatloaf, rand(30 SECONDS, 40 SECONDS), TRUE, TRUE)

/obj/item/food/meatloaf
	name = "肉糕"
	desc = "将肉、洋葱和大蒜混合成糕状并在烤箱中烘烤而成。上面慷慨地涂满了番茄酱。用刀把它切成片！"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "meatloaf"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 40,
		/datum/reagent/consumable/nutriment/vitamin = 32,
		/datum/reagent/consumable/nutriment = 32,
	)
	tastes = list("juicy meat" = 3, "onions" = 1, "garlic" = 1, "ketchup" = 1)
	foodtypes = MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)

/obj/item/food/meatloaf/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/meatloaf_slice, 4, 3 SECONDS, table_required = TRUE,  screentip_verb = "Cut")

/obj/item/food/meatloaf_slice
	name = "肉糕切片"
	desc = "一片美味多汁的肉糕，上面淋着番茄酱。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "meatloaf_slice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 8,
		/datum/reagent/consumable/nutriment = 8,
	)
	tastes = list("juicy meat" = 3, "onions" = 1, "garlic" = 1, "ketchup" = 1)
	foodtypes = MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT / 2)

/obj/item/food/sweet_and_sour_meatballs
	name = "糖醋肉丸"
	desc = "裹着粘稠咸味酱汁的金黄色肉丸，配以菠萝和辣椒块。"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "sweet_and_sour_meatballs"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 8,
		/datum/reagent/consumable/nutriment = 8,
	)
	tastes = list("meat" = 5, "savory sauce" = 4, "tangy pineapple" = 3, "pepper" = 2)
	foodtypes = MEAT | VEGETABLES | FRUIT | PINEAPPLE
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/kebab/pineapple_skewer
	name = "菠萝串"
	desc = "涂有酱汁的肉块与菠萝片串在签子上。出乎意料地不错！"
	icon = 'icons/obj/food/meat.dmi'
	icon_state = "pineapple_skewer"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 8,
	)
	tastes = list("juicy meat" = 4, "pineapple" = 3)
	foodtypes = MEAT | FRUIT | PINEAPPLE
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/futomaki_sushi_roll
	name = "太卷寿司卷"
	desc = "一卷太卷寿司，由煮鸡蛋、鱼和黄瓜制成。可切片"
	icon_state = "futomaki_sushi_roll"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("boiled rice" = 4, "fish" = 5, "egg" = 3, "dried seaweed" = 2, "cucumber" = 2)
	foodtypes = MEAT|VEGETABLES|GRAIN|SEAFOOD|EGG
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/futomaki_sushi_roll/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/futomaki_sushi_slice, 4, screentip_verb = "Chop")

/obj/item/food/futomaki_sushi_slice
	name = "太卷寿司切片"
	desc = "一片太卷寿司，由煮鸡蛋、鱼和黄瓜制成。"
	icon_state = "futomaki_sushi_slice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("boiled rice" = 4, "fish" = 5, "egg" = 3, "dried seaweed" = 2, "cucumber" = 2)
	foodtypes = VEGETABLES|GRAIN|DAIRY|SEAFOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/philadelphia_sushi_roll
	name = "philadelphia sushi roll"
	desc = "一卷费城寿司，由奶酪、鱼和黄瓜制成。可切片"
	icon_state = "philadelphia_sushi_roll"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 8,
	)
	tastes = list("boiled rice" = 4, "fish" = 5, "creamy cheese" = 3, "dried seaweed" = 2, "cucumber" = 2)
	foodtypes = VEGETABLES|GRAIN|SEAFOOD|DAIRY
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/philadelphia_sushi_roll/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/philadelphia_sushi_slice, 4, screentip_verb = "Chop")

/obj/item/food/philadelphia_sushi_slice
	name = "philadelphia sushi slice"
	desc = "一份费城寿司卷，由奶酪、鱼肉和黄瓜制成。"
	icon_state = "philadelphia_sushi_slice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("boiled rice" = 4, "fish" = 5, "creamy cheese" = 3, "dried seaweed" = 2, "cucumber" = 2)
	foodtypes = VEGETABLES|GRAIN|SEAFOOD|DAIRY
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3
