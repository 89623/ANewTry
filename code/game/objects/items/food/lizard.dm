//Lizard Foods, for lizards (and weird humans!)

//Meat Dishes

/obj/item/food/raw_tiziran_sausage
	name = "生的提兹兰血肠"
	desc = "一条生的提兹兰血肠，准备在晾架上风干。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "raw_lizard_sausage"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 2,
		/datum/reagent/blood = 3,
	)
	tastes = list("meat" = 1, "black pudding" = 1)
	foodtypes = MEAT|RAW
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/raw_tiziran_sausage/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/dryable, /obj/item/food/tiziran_sausage)

/obj/item/food/tiziran_sausage
	name = "\improper 提兹兰血肠"
	desc = "一种粗制的干腌血肠，传统上由扎戈斯凯尔德周围农田的农民制作。口感类似于旧地球的西班牙辣香肠。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "lizard_sausage"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("meat" = 1, "black pudding" = 1)
	foodtypes = MEAT
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_price = PAYCHECK_CREW
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/raw_headcheese
	name = "生的头肉冻块"
	desc = "提兹拉的一种常见食物，头肉冻传统上由动物的头部制成，去除内脏后，煮至散开，然后收集起来，滤去水分，大量加盐，压制成块，并放置数月进行干燥和陈化。最终得到的硬块尝起来类似奶酪。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "raw_lizard_cheese"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 15,
		/datum/reagent/consumable/salt = 5,
	)
	tastes = list("meat" = 1, "salt" = 1)
	foodtypes = MEAT|RAW|GORE
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/raw_headcheese/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/dryable, /obj/item/food/headcheese)

/obj/item/food/headcheese
	name = "头肉冻块"
	desc = "一块腌制好的头肉冻。如果你是一只蜥蜴，那会很美味。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "lizard_cheese"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 15,
		/datum/reagent/consumable/salt = 5,
	)
	tastes = list("cheese" = 1, "salt" = 1)
	foodtypes = MEAT | GORE
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/headcheese/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/headcheese_slice, 5, 3 SECONDS, table_required = TRUE, screentip_verb = "Slice", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/headcheese_slice
	name = "头肉冻片"
	desc = "一片头肉冻，可用于制作三明治和零食。或者用于度过提兹拉寒冷的冬天。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "lizard_cheese_slice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/consumable/salt = 1,
	)
	tastes = list("cheese" = 1, "salt" = 1)
	foodtypes = MEAT | GORE
	w_class = WEIGHT_CLASS_TINY
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT / 5)

/obj/item/food/shredded_lungs
	name = "香脆炒肺丝"
	desc = "酥脆的肺片，配上蔬菜和辣酱。如果你喜欢肺的话，这道菜会很美味。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "lung_stirfry"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/capsaicin = 2,
	)
	tastes = list("meat" = 1, "heat" = 1, "veggies" = 1)
	foodtypes = MEAT | VEGETABLES | GORE
	trash_type = /obj/item/reagent_containers/cup/bowl
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/tsatsikh
	name = "查齐克"
	desc = "一道提兹兰菜肴，由调味的碎内脏塞入胃袋中煮熟而成。对于不习惯这种口味的人来说相当难以下咽。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "tsatsikh"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 10)
	tastes = list("assorted minced organs" = 1)
	foodtypes = MEAT | GORE
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/liver_pate
	name = "肝酱"
	desc = "一种由肝脏、肉类和少许增味配料制成的浓郁肉酱。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "pate"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 5)
	tastes = list("liver" = 1)
	foodtypes = MEAT|VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/moonfish_eggs
	name = "月鱼卵"
	gender = PLURAL
	desc = "月鱼会产下大颗、半透明的蓝色卵，在蜥蜴烹饪中备受推崇。其风味类似于鱼子酱，但通常被描述为更醇厚、更复杂。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "moonfish_eggs"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("caviar" = 1)
	foodtypes = SEAFOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/moonfish_eggs/Initialize(mapload)
	. = ..()
	//Moonfish can lay eggs inside aquariums (unaffected by breeding, so think of them as unfertilizard)
	RegisterSignal(src, COMSIG_AQUARIUM_CONTENT_GENERATE_APPEARANCE, PROC_REF(generate_aquarium_appearance))
	RegisterSignal(src, COMSIG_AQUARIUM_CONTENT_RANDOMIZE_POSITION, PROC_REF(randomize_aquarium_position))
	AddComponent(/datum/component/aquarium_content)
	RegisterSignal(src, COMSIG_MOVABLE_GET_AQUARIUM_BEAUTY, PROC_REF(get_aquarium_beauty))

/obj/item/food/moonfish_eggs/proc/generate_aquarium_appearance(datum/source, obj/effect/aquarium/visual)
	SIGNAL_HANDLER
	visual.icon = icon
	visual.icon_state = "moonfish_eggs_aquarium"
	visual.layer_mode = AQUARIUM_LAYER_MODE_BOTTOM

/obj/item/food/moonfish_eggs/proc/randomize_aquarium_position(datum/source, obj/structure/aquarium/current_aquarium, obj/effect/aquarium/visual)
	SIGNAL_HANDLER
	var/sprite_width = 5
	var/sprite_height = 4
	var/pw_min = visual.aquarium_zone_min_pw
	var/pw_max = visual.aquarium_zone_max_pw - sprite_width
	var/pz_min = visual.aquarium_zone_min_pz - sprite_height

	visual.pixel_w = rand(pw_min, pw_max)
	visual.pixel_z = pz_min + rand(-1, 1)

/obj/item/food/moonfish_eggs/proc/get_aquarium_beauty(datum/source, list/beauty_holder)
	SIGNAL_HANDLER
	beauty_holder += 100 //moonfish eggs are kinda eye candy

/obj/item/food/moonfish_caviar
	name = "月鱼鱼子酱糊"
	desc = "一种用月鱼卵制成的浓郁酱糊。通常是大多数蜥蜴能获取它们的唯一方式，在沿海烹饪中应用相当广泛。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "moonfish_caviar"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("caviar" = 1)
	foodtypes = SEAFOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/lizard_escargot
	name = "沙漠蜗牛卷"
	desc = "蜥蜴与人类文化交融的又一例证，沙漠蜗牛料理更接近罗马菜肴“卷”（cocleas），而非当代法式蜗牛（escargot）。它是沙漠城市中常见的街头小吃。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "lizard_escargot"
	trash_type = /obj/item/reagent_containers/cup/bowl
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/garlic = 2,
	)
	tastes = list("snails" = 1, "garlic" = 1, "oil" = 1)
	foodtypes = MEAT|VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/fried_blood_sausage
	name = "煎血肠"
	desc = "一种裹上面糊后油炸的血肠。通常搭配薯条，作为扎戈斯凯尔德街头快捷简单的小吃。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "fried_blood_sausage"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 2,
		/datum/reagent/consumable/salt = 1,
		/datum/reagent/consumable/nutriment/fat/oil = 1,
	)
	tastes = list("black pudding" = 1, "batter" = 1, "oil" = 1)
	foodtypes = MEAT|NUTS|FRIED
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

//Why does like, every language on the planet besides English call them pommes? Who knows, who cares- the lizards call them it too, because funny.
/obj/item/food/lizard_fries
	name = "满载薯条"
	desc = "众多传入蜥蜴社会的人类食物之一便是薯条，在龙语中被称为“poms-franzisks”。当配上烤肉和酱汁时，它们便成了一道丰盛的大餐。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "lizard_fries"
	trash_type = /obj/item/plate
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/salt = 1,
		/datum/reagent/consumable/bbqsauce = 2,
	)
	tastes = list("fries" = 2, "bbq sauce" = 1, "barbecued meat" = 1)
	foodtypes = MEAT | VEGETABLES | FRIED
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/brain_pate
	name = "眼球脑髓酱"
	desc = "一种浓稠的粉色酱泥，由精细切碎的汆烫眼球和脑髓、炸洋葱以及脂肪制成。蜥蜴们发誓说这非常美味！"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "brain_pate"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/liquidgibs = 2,
	)
	tastes = list("brains" = 2)
	foodtypes = MEAT | VEGETABLES | GORE
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/crispy_headcheese
	name = "酥脆裹粉头肉冻"
	desc = "来自扎戈斯凯尔德街头的美味小吃，由裹上根茎面包屑的头肉冻制成。通常搭配薯条食用。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "crispy_headcheese"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/fat/oil = 2,
	)
	tastes = list("cheese" = 1, "oil" = 1)
	foodtypes = MEAT | VEGETABLES | NUTS | GORE
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT / 5)

/obj/item/food/kebab/picoss_skewers
	name = "皮科斯肉串"
	desc = "一种提兹兰流行的街头小吃，由醋腌甲胄鱼串与洋葱和辣椒组成。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "picoss_skewer"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/vinegar = 1,
		/datum/reagent/consumable/capsaicin = 1,
	)
	tastes = list("fish" = 1, "acid" = 1, "onion" = 1, "heat" = 1)
	foodtypes = VEGETABLES|SEAFOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/nectar_larvae
	name = "花蜜幼虫"
	desc = "裹在科塔花蜜制成的甜辣酱汁里的小脆幼虫。虫子大餐！"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "nectar_larvae"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/korta_nectar = 3,
		/datum/reagent/consumable/capsaicin = 1,
	)
	tastes = list("meat" = 1, "sweet" = 1, "heat" = 1)
	foodtypes = MEAT|VEGETABLES|BUGS|GORE
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/mushroomy_stirfry
	name = "蘑菇炒菜"
	desc = "多种蘑菇的混合，专为满足你旺盛的食欲而制。妙不可言！"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "mushroomy_stirfry"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("marvelous mushrooms" = 1, "sublime shrooms" = 1)
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

//Fish Dishes
/obj/item/food/grilled_moonfish
	name = "烤月鱼"
	desc = "一大块烤月鱼。传统上搭配扇贝状根茎和以葡萄酒为基础的酱汁食用。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "grilled_moonfish"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("fish" = 1)
	foodtypes = SEAFOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/moonfish_demiglace
	name = "月鱼半釉汁"
	desc = "一块煎得漂亮的月鱼，铺在土豆和胡萝卜床上，上面淋有葡萄酒和半釉汁浓缩酱。简直妙极了。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "moonfish_demiglace"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/nutriment = 2,
	)
	tastes = list("fish" = 2, "potatoes" = 1, "carrots" = 1)
	foodtypes = VEGETABLES|SEAFOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/lizard_surf_n_turf
	name = "\improper 扎戈斯克海陆大餐自助餐"
	desc = "一大盘提兹拉最优质的肉类和海鲜，通常在沙滩上由团体分享。当然，没什么能阻止你一个人独享……死胖子。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "surf_n_turf"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 10,
	)
	tastes = list("surf" = 1, "turf" = 1)
	foodtypes = MEAT | SEAFOOD | VEGETABLES
	w_class = WEIGHT_CLASS_BULKY
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 3)

//Spaghetti Dishes

/obj/item/food/spaghetti/nizaya
	name = "尼扎亚面食"
	desc = "一种根茎和坚果制成的面食，最初原产于提兹拉的沿海地区。其质地和外观类似于意式土豆团子。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "nizaya"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("gnocchi" = 1)
	foodtypes = VEGETABLES | NUTS
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/spaghetti/nizaya/egg
	foodtypes = parent_type::foodtypes | MEAT

/obj/item/food/spaghetti/snail_nizaya
	name = "沙漠蜗牛尼扎亚"
	desc = "一道来自提兹拉瓦林吉亚葡萄园地区的高级面食。传统上只用最优质的提兹兰葡萄酒制作……不过，在紧要关头，人类的劣酒也能凑合。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "snail_nizaya"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("snails" = 1, "wine" = 1, "gnocchi" = 1)
	foodtypes = VEGETABLES | MEAT | NUTS
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/spaghetti/garlic_nizaya
	name = "蒜油尼扎亚"
	desc = "一种蜥蜴人对意大利面食 aglio e olio（蒜油意面）的改编，使用尼扎亚面食制作。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "garlic_nizaya"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/vitamin = 10,
	)
	tastes = list("garlic" = 1, "oil" = 1, "gnocchi" = 1)
	foodtypes = VEGETABLES | NUTS
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/spaghetti/demit_nizaya
	name = "德米特尼扎亚"
	desc = "一道用科塔奶和花蜜制成的甜奶油尼扎亚面食。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "demit_nizaya"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/korta_nectar = 4,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("peppery sweet" = 1, "veggies" = 1, "gnocchi" = 1)
	foodtypes = VEGETABLES|NUTS|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/spaghetti/mushroom_nizaya
	name = "蘑菇尼扎亚"
	desc = "一道用塞拉卡蘑菇和优质油制作的尼扎亚面食。具有明显的坚果风味。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "mushroom_nizaya"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/vitamin = 10,
	)
	tastes = list("savouriness" = 1, "nuttiness" = 1, "gnocchi" = 1)
	foodtypes = VEGETABLES|NUTS
	crafting_complexity = FOOD_COMPLEXITY_4

//Dough Dishes

/obj/item/food/rootdough
	name = "根面团"
	desc = "一种以根茎为基础的面团，由坚果和块茎制成。广泛用于提兹兰烹饪。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "rootdough"
	food_reagents = list(/datum/reagent/consumable/nutriment = 6)
	w_class = WEIGHT_CLASS_SMALL
	tastes = list("potato" = 1, "earthy heat" = 1)
	foodtypes = VEGETABLES | NUTS
	crafting_complexity = FOOD_COMPLEXITY_1
	var/bread_type = /obj/item/food/bread/root
	var/flat_type = /obj/item/food/flatrootdough

/obj/item/food/rootdough/make_bakeable()
	AddComponent(/datum/component/bakeable, bread_type, rand(15 SECONDS, 25 SECONDS), TRUE, TRUE)

/obj/item/food/rootdough/make_processable()
	AddElement(/datum/element/processable, TOOL_ROLLINGPIN, flat_type, 1, 3 SECONDS, table_required = TRUE, screentip_verb = "Flatten", sound_to_play = SFX_ROLLING_PIN_ROLLING)

/obj/item/food/rootdough/egg
	desc = "一种以根茎为基础的面团，由坚果、块茎和鸡蛋制成。广泛用于提兹兰烹饪。"
	foodtypes = parent_type::foodtypes | MEAT
	bread_type = /obj/item/food/bread/root/egg
	flat_type = /obj/item/food/flatrootdough/egg

/obj/item/food/flatrootdough
	name = "扁平根面团"
	desc = "压平的根面团，可以做成扁面包，或者切成段。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "flat_rootdough"
	food_reagents = list(/datum/reagent/consumable/nutriment = 6)
	tastes = list("potato" = 1, "earthy heat" = 1)
	foodtypes = VEGETABLES | NUTS
	crafting_complexity = FOOD_COMPLEXITY_1
	var/process_type = /obj/item/food/rootdoughslice
	var/grill_type = /obj/item/food/root_flatbread

/obj/item/food/flatrootdough/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, process_type, 3, 3 SECONDS, table_required = TRUE, screentip_verb = "Slice", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/flatrootdough/make_grillable()
	AddComponent(/datum/component/grillable, grill_type, rand(15 SECONDS, 25 SECONDS), TRUE, TRUE)

/obj/item/food/flatrootdough/egg
	foodtypes = parent_type::foodtypes | MEAT
	process_type = /obj/item/food/rootdoughslice/egg
	grill_type = /obj/item/food/root_flatbread/egg

/obj/item/food/rootdoughslice
	name = "根面团球"
	desc = "一个根面团球。非常适合制作意大利面或面包卷。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "rootdough_slice"
	food_reagents = list(/datum/reagent/consumable/nutriment = 2)
	w_class = WEIGHT_CLASS_SMALL
	tastes = list("potato" = 1, "earthy heat" = 1)
	foodtypes = VEGETABLES | NUTS
	crafting_complexity = FOOD_COMPLEXITY_1
	var/process_type = /obj/item/food/spaghetti/nizaya
	var/bake_type = /obj/item/food/rootroll

/obj/item/food/rootdoughslice/egg
	foodtypes = parent_type::foodtypes | MEAT

/obj/item/food/rootdoughslice/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/spaghetti/nizaya, 1, 3 SECONDS, table_required = TRUE, screentip_verb = "Slice", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/rootdoughslice/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/rootroll, rand(15 SECONDS, 25 SECONDS), TRUE, TRUE)

/obj/item/food/rootdoughslice/egg
	process_type = /obj/item/food/spaghetti/nizaya/egg
	bake_type = /obj/item/food/rootroll/egg

/obj/item/food/root_flatbread
	name = "根茎扁面包"
	desc = "一块普通的烤根茎扁面包。可以搭配蜥蜴喜欢吃的各种食物。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "root_flatbread"
	food_reagents = list(/datum/reagent/consumable/nutriment = 8)
	tastes = list("bread" = 1, "earthy heat" = 1)
	foodtypes = VEGETABLES | NUTS
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/root_flatbread/egg
	foodtypes = parent_type::foodtypes | MEAT

/obj/item/food/rootroll
	name = "根卷"
	desc = "一种由根茎制成的致密、有嚼劲的面包卷。是汤的好伴侣。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "rootroll"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4)
	w_class = WEIGHT_CLASS_SMALL
	tastes = list("roll" = 1) // the roll tastes of roll.
	foodtypes = VEGETABLES | NUTS
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/rootroll/egg
	foodtypes = parent_type::foodtypes | MEAT

//Bread Dishes

/obj/item/food/bread/root
	name = "根面包"
	desc = "蜥蜴的等价面包，由土豆和山药等块茎与磨碎的坚果和种子混合制成。明显比普通面包更致密。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "lizard_bread"
	food_reagents = list(/datum/reagent/consumable/nutriment = 20)
	tastes = list("bread" = 8, "nuts" = 2)
	foodtypes = VEGETABLES | NUTS
	w_class = WEIGHT_CLASS_SMALL
	venue_value = FOOD_PRICE_CHEAP
	slice_type = /obj/item/food/breadslice/root

/obj/item/food/bread/root/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/ingredients_holder, /obj/item/food/bread/empty, CUSTOM_INGREDIENT_ICON_FILL, max_ingredients = 8)

/obj/item/food/bread/root/egg
	foodtypes = parent_type::foodtypes | MEAT
	slice_type = /obj/item/food/breadslice/root/egg

/obj/item/food/breadslice/root
	name = "根面包片"
	desc = "一片致密、有嚼劲的根面包。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "lizard_breadslice"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4)
	tastes = list("bread" = 8, "nuts" = 2)
	foodtypes = VEGETABLES | NUTS
	venue_value = FOOD_PRICE_TRASH

/obj/item/food/breadslice/root/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/ingredients_holder, null, CUSTOM_INGREDIENT_ICON_STACK)

/obj/item/food/breadslice/root/egg
	foodtypes = parent_type::foodtypes | MEAT

//Pizza Dishes
/obj/item/food/pizza/flatbread
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = null
	abstract_type = /obj/item/food/pizza/flatbread
	slice_type = null

/obj/item/food/pizza/flatbread/rustic
	name = "乡村扁面包"
	desc = "一道简单的提兹兰乡村菜肴，常作为肉类或鱼类菜肴的配菜。上面撒有香草和油。"
	icon_state = "rustic_flatbread"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/nutriment/vitamin = 15,
		/datum/reagent/consumable/garlic = 2,
	)
	tastes = list("bread" = 1, "herb" = 1, "oil" = 1, "garlic" = 1)
	foodtypes = VEGETABLES | NUTS
	boxtag = "Tiziran Flatbread"
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pizza/flatbread/italic
	name = "\improper 意式扁面包"
	desc = "人类食物引入提兹拉后，蜥蜴烹饪技术取得了进步——意式扁面包如今已成为该星球外卖店菜单上的常见菜品。"
	icon_state = "italic_flatbread"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 15,
	)
	tastes = list("bread" = 1, "herb" = 1, "oil" = 1, "garlic" = 1, "tomato" = 1, "meat" = 1)
	foodtypes = VEGETABLES | NUTS | MEAT
	boxtag = "Italic Flatbread"
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/pizza/flatbread/imperial
	name = "\improper 帝国扁面包"
	desc = "一种铺有肉酱、腌菜和方块头肉冻的扁面包。除了蜥蜴人，恐怕不太合任何人的口味。"
	icon_state = "imperial_flatbread"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/nutriment/protein = 15,
		/datum/reagent/consumable/nutriment/vitamin = 10,
	)
	tastes = list("bread" = 1, "herb" = 1, "oil" = 1, "garlic" = 1, "tomato" = 1, "meat" = 1)
	foodtypes = VEGETABLES | MEAT | NUTS | GORE
	boxtag = "Imperial Victory Flatbread"
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 4)

/obj/item/food/pizza/flatbread/rawmeat
	name = "肉食爱好者扁面包"
	desc = "说来奇怪，这道提兹拉菜肴实际上是一些注重健康的人类的最爱。"
	icon_state = "rawmeat_flatbread"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/nutriment/protein = 10,
	)
	tastes = list("bread" = 1, "meat" = 1)
	foodtypes = MEAT|VEGETABLES|RAW|NUTS
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/pizza/flatbread/stinging
	name = "\improper 刺刺扁面包"
	desc = "水母与蜂蛹的刺激混合带来一种风味冲击，让你吃了还想吃！"
	icon_state = "stinging_flatbread"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/nutriment/protein = 20,
		/datum/reagent/consumable/honey = 2,
	)
	tastes = list("bread" = 1, "sweetness" = 1, "stinging" = 1, "slime" = 1)
	foodtypes = MEAT|VEGETABLES|NUTS|SEAFOOD|BUGS|GORE
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pizza/flatbread/zmorgast  // Name is based off of the Swedish dish Smörgåstårta
	name = "\improper 兹莫加斯特扁面包"
	desc = "这是提兹拉人对原版瑞典三明治蛋糕的改良，兹莫加斯特是家庭聚会上的常见菜肴。"
	icon_state = "zmorgast_flatbread"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 16,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("bread" = 1, "liver" = 1, "family" = 1)
	foodtypes = VEGETABLES | NUTS | MEAT | EGG
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pizza/flatbread/fish
	name = "\improper 烧烤鱼扁面包"
	desc = "超引擎解离、小丑行动、外面太冷，看在提兹拉的份上，我只想烧烤！"
	icon_state = "fish_flatbread"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 20,
		/datum/reagent/consumable/nutriment/protein = 15,
		/datum/reagent/consumable/bbqsauce = 2,
	)
	tastes = list("bread" = 1, "fish" = 1)
	foodtypes = VEGETABLES|NUTS|SEAFOOD
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/pizza/flatbread/mushroom
	name = "蘑菇番茄扁面包"
	desc = "这是意式扁面包的简单替代品，适合在你已经在别处吃够了肉的时候享用。"
	icon_state = "mushroom_flatbread"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 18,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes =  list("bread" = 1, "mushroom" = 1, "tomatoes" = 1)
	foodtypes = VEGETABLES | NUTS
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/pizza/flatbread/nutty
	name = "坚果酱扁面包"
	desc = "现代烹饪技术的进步使得这道扁面包的基底和配料都能加倍呈现科尔塔坚果的美味。"
	icon_state = "nutty_flatbread"
	food_reagents = list(/datum/reagent/consumable/nutriment = 20)
	tastes =  list("bread" = 1, "nuts" = 2)
	foodtypes = NUTS
	crafting_complexity = FOOD_COMPLEXITY_3

//Sandwiches/Toast Dishes
/obj/item/food/emperor_roll
	name = "帝王卷"
	desc = "提兹拉上一种流行的三明治，为纪念皇室家族而命名。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "emperor_roll"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("bread" = 1, "cheese" = 1, "liver" = 1, "caviar" = 1)
	foodtypes = VEGETABLES | NUTS | MEAT | GORE | SEAFOOD
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2.25)

/obj/item/food/honey_roll
	name = "蜂蜜甜卷"
	desc = "一种加糖的根茎卷，配有切片水果，是提兹拉上应季享用的甜点。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "honey_roll"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 8,
		/datum/reagent/consumable/honey = 2,
	)
	tastes = list("bread" = 1, "honey" = 1, "fruit" = 1)
	foodtypes = VEGETABLES | NUTS | FRUIT
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_4

//Egg Dishes
/obj/item/food/black_eggs
	name = "黑色炒蛋"
	desc = "一道来自提兹拉乡村的农家菜。由鸡蛋、血液和采集的野菜制成。传统上搭配根茎面包和辣酱食用。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "black_eggs"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("eggs" = 1, "greens" = 1, "blood" = 1)
	foodtypes = MEAT | BREAKFAST | GORE | EGG
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/patzikula
	name = "patzikula"
	desc = "一种顺滑辛辣的番茄酱底，上面铺着鸡蛋烘烤而成。美味可口。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "patzikula"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 8,
		/datum/reagent/consumable/capsaicin = 2,
	)
	tastes = list("eggs" = 1, "tomato" = 1, "heat" = 1)
	foodtypes = VEGETABLES | MEAT | BREAKFAST | EGG
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_3

//Cakes/Sweets

/obj/item/food/cake/korta_brittle
	name = "科塔坚果脆片"
	desc = "一大块科塔坚果脆片。糖分高得简直是一种罪过！"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "korta_brittle"
	food_reagents = list(
		/datum/reagent/consumable/sugar = 20,
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/korta_nectar = 15,
	)
	tastes = list("peppery heat" = 1, "sweetness" = 1)
	foodtypes = NUTS | SUGAR
	slice_type = /obj/item/food/cakeslice/korta_brittle
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/cakeslice/korta_brittle
	name = "科塔坚果脆片切片"
	desc = "一小片科塔坚果脆片。糖尿病患者的头号敌人。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "korta_brittle_slice"
	food_reagents = list(
		/datum/reagent/consumable/sugar = 4,
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/korta_nectar = 3,
	)
	tastes = list("peppery heat" = 1, "sweetness" = 1)
	foodtypes = NUTS | SUGAR

/obj/item/food/snowcones/korta_ice
	name = "科塔冰"
	desc = "刨冰、科塔花蜜和浆果。一种消暑解热的甜点！"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "korta_ice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 8,
		/datum/reagent/consumable/ice = 4,
		/datum/reagent/consumable/berryjuice = 6,
	)
	tastes = list("peppery sweet" = 1, "berry" = 1)
	foodtypes = NUTS | SUGAR | FRUIT

/obj/item/food/kebab/candied_mushrooms
	name = "糖渍蘑菇"
	desc = "一道来自提兹拉的略为奇特的菜肴，由裹着焦糖的塞拉卡蘑菇串成。带有明显的'甜咸'风味。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "candied_mushrooms"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/caramel = 4,
	)
	tastes = list("savouriness" = 1, "sweetness" = 1)
	foodtypes = SUGAR | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_2

//Misc Dishes
/obj/item/food/sauerkraut
	name = "酸菜"
	desc = "腌制的卷心菜，因德国人而闻名，并已在蜥蜴人的烹饪中变得常见，在那里它被称为Zauerkrat。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "sauerkraut"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4)
	tastes = list("cabbage" = 1, "acid" = 1)
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/lizard_dumplings
	name = "\improper 提兹拉饺子"
	desc = "将根茎类蔬菜捣碎，与科塔面粉混合后煮熟，制成一种大而圆、略带辣味的饺子。通常配汤食用。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "lizard_dumplings"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("potato" = 1, "earthy heat" = 1)
	foodtypes = VEGETABLES | NUTS
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/steeped_mushrooms
	name = "浸泡过的塞拉卡蘑菇"
	desc = "在碱性水中浸泡过的塞拉卡蘑菇，以去除提取物，从而使其完全安全可食用。"
	icon = 'icons/obj/food/lizard.dmi'
	icon_state = "steeped_mushrooms"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("savouriness" = 1, "nuttiness" = 1)
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/canned/jellyfish
	name = "罐装炮手水母"
	desc = "一罐用盐水包装的炮手水母。含有一种轻微的致幻剂，烹饪后会破坏。"
	icon_state = "jellyfish"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/toxin/mindbreaker = 2,
		/datum/reagent/consumable/salt = 1,
	)
	trash_type = /obj/item/trash/can/food/jellyfish
	tastes = list("slime" = 1, "burning" = 1, "salt" = 1)
	foodtypes = SEAFOOD | GORE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/canned/desert_snails
	name = "罐装沙漠蜗牛"
	desc = "来自提兹兰沙漠的巨型蜗牛，用盐水封装。包含外壳。最好不要生吃，除非你是蜥蜴人。"
	icon_state = "snails"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/salt = 2,
	)
	trash_type = /obj/item/trash/can/food/desert_snails
	tastes = list("snails" = 1)
	foodtypes = MEAT | GORE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/canned/larvae
	name = "罐装蜜蜂幼虫"
	desc = "一罐用蜂蜜封装的蜜蜂幼虫。可能对某些人来说很开胃。"
	icon_state = "larvae"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/honey = 2,
	)
	trash_type = /obj/item/trash/can/food/larvae
	tastes = list("sweet bugs" = 1)
	foodtypes = MEAT | GORE | BUGS
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/rootbread_peanut_butter_jelly
	name = "花生酱果酱根面包三明治"
	desc = "经典的PB&J根面包三明治，就像那个取代了你妈妈的复制人过去常做的那样。"
	icon_state = "peanutbutter-jelly"
	icon = 'icons/obj/food/lizard.dmi'
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("peanut butter" = 1, "jelly" = 1, "rootbread" = 2)
	foodtypes = FRUIT|VEGETABLES|NUTS
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/rootbread_peanut_butter_banana
	name = "花生酱香蕉根面包三明治"
	desc = "一款混入香蕉片的花生酱根面包三明治，是优质的高蛋白点心。"
	icon_state = "peanutbutter-banana"
	icon = 'icons/obj/food/lizard.dmi'
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/banana = 5,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("peanut butter" = 1, "banana" = 1, "rootbread" = 2)
	foodtypes = FRUIT|VEGETABLES|NUTS
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/burger/plain/korta
	name = "原味根堡"
	desc = "根面团面包里夹着一块简单的肉饼。"
	icon_state = "kortaburger"
	icon = 'icons/obj/food/lizard.dmi'
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	foodtypes = MEAT|VEGETABLES|NUTS
	crafting_complexity = FOOD_COMPLEXITY_3 //Gotta make the dough, +1
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/rat/korta
	name = "鼠肉根堡"
	desc = "差不多就是你想象的那样……只不过用的是根面团面包。"
	icon_state = "ratburger"
	icon = 'icons/obj/food/lizard.dmi'
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("dead rat" = 4, "bun" = 2)
	foodtypes = NUTS | MEAT | GORE | VEGETABLES | RAW
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/burger/rootguffin
	name = "根-古芬"
	desc = "一种廉价油腻、对蜥蜴人友好的班尼迪克蛋仿制品。"
	icon_state = "rootguffin"
	icon = 'icons/obj/food/lizard.dmi'
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/eggyolk = 3,
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("muffin" = 2, "bacon" = 3)
	foodtypes = NUTS | MEAT | BREAKFAST | VEGETABLES | FRIED | EGG
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)

/obj/item/food/burger/rootrib
	name = "根肋排堡"
	desc = "一种在银河系中供应有限、难以寻觅的肋排形状汉堡。现已满足亚人种需求。"
	icon_state = "rootrib"
	icon = 'icons/obj/food/lizard.dmi'
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/bbqsauce = 1,
	)
	tastes = list("bun" = 2, "pork patty" = 4)
	foodtypes = NUTS | MEAT | VEGETABLES | SUGAR
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT * 2)

/obj/item/food/burger/rootchicken
	name = "鸡肉根面包三明治"
	desc = "美味的鸡肉三明治，夹在柔软的根面包卷里。"
	icon_state = "rootchicken"
	icon = 'icons/obj/food/lizard.dmi'
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/mayonnaise = 3,
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/consumable/nutriment/fat/oil = 2,
	)
	tastes = list("bun" = 2, "chicken" = 4, "God's covenant" = 1)
	foodtypes = NUTS | MEAT | VEGETABLES
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/burger/rootfish
	name = "fish rootwich"
	desc = "轻炸鱼排，夹在根面包卷里。"
	icon_state = "rootfish"
	icon = 'icons/obj/food/lizard.dmi'
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/protein = 6,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("bun" = 4, "fish" = 4)
	foodtypes = VEGETABLES | NUTS | SEAFOOD
	venue_value = FOOD_PRICE_EXOTIC
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/burger/sloppyroot
	name = "邋遢莫伊"
	desc = "碎肉与洋葱和烧烤酱混合，随意地堆在根茎卷上。美味，但保证会弄脏你的手。"
	icon_state = "sloppyroot"
	icon = 'icons/obj/food/lizard.dmi'
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 10,
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("juicy meat" = 4, "BBQ sauce" = 3, "onions" = 2, "bun" = 2)
	foodtypes = NUTS | MEAT | VEGETABLES
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT * 2)
