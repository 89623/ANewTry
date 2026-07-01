/obj/item/food/meat
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)
	w_class = WEIGHT_CLASS_SMALL
	icon = 'icons/obj/food/meat.dmi'
	abstract_type = /obj/item/food/meat
	var/subjectname = ""
	var/subjectjob = null
	var/blood_decal_type = /obj/effect/decal/cleanable/blood

/obj/item/food/meat/Initialize(mapload, blood_dna_list = list("meaty DNA" = get_blood_type(BLOOD_TYPE_MEAT)))
	. = ..()

	if(!blood_decal_type || !length(custom_materials))
		return

	AddComponent(
		/datum/component/blood_walk,\
		blood_type = blood_decal_type,\
		blood_spawn_chance = 45,\
		transfer_blood_dna = TRUE,\
		max_blood = custom_materials[custom_materials[1]] / SHEET_MATERIAL_AMOUNT,\
		blood_dna_info = blood_dna_list,\
	)

	AddComponent(
		/datum/component/bloody_spreader,\
		blood_left = custom_materials[custom_materials[1]] / SHEET_MATERIAL_AMOUNT,\
		blood_dna = blood_dna_list,\
	)

/obj/item/food/meat/slab
	name = "肉"
	desc = "一块肉排。"
	icon_state = "meat"
	bite_consumption = 3
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/fat = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	) //Meat has fats that a food processor can process into cooking oil
	tastes = list("meat" = 1)
	foodtypes = MEAT | RAW
	///Legacy code, handles the coloring of the overlay of the cutlets made from this.
	var/slab_color = COLOR_RED


/obj/item/food/meat/slab/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/dryable,  /obj/item/food/sosjerky/healthy)

/obj/item/food/meat/slab/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/plain, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE) //Add medium rare later maybe?

/obj/item/food/meat/slab/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/meat/rawcutlet/plain, MEATSLAB_PROCESSED_AMOUNT, 3 SECONDS, table_required = TRUE, screentip_verb = "Cut", sound_to_play = SFX_KNIFE_SLICE)

///////////////////////////////////// HUMAN MEATS //////////////////////////////////////////////////////

/obj/item/food/meat/slab/human
	name = "肉"
	tastes = list("tender meat" = 1)
	foodtypes = MEAT | RAW | GORE
	venue_value = FOOD_MEAT_HUMAN

/obj/item/food/meat/slab/human/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/plain/human, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE) //Add medium rare later maybe?

/obj/item/food/meat/slab/human/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/meat/rawcutlet/plain/human, 3, 3 SECONDS, table_required = TRUE, screentip_verb = "Cut", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/meat/slab/human/mutant
	abstract_type = /obj/item/food/meat/slab/human/mutant

/obj/item/food/meat/slab/human/mutant/slime
	icon_state = "slimemeat"
	desc = "因为果冻对素食者来说还不够冒犯。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/toxin/slimejelly = 3,
	)
	tastes = list("slime" = 1, "jelly" = 1)
	foodtypes = MEAT | RAW | TOXIC
	venue_value = FOOD_MEAT_MUTANT_RARE
	blood_decal_type = null

/obj/item/food/meat/slab/human/mutant/golem
	icon_state = "golemmeat"
	desc = "可食用的岩石，欢迎来到未来。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/iron = 3,
	)
	tastes = list("rock" = 1)
	foodtypes = MEAT | RAW | GROSS
	venue_value = FOOD_MEAT_MUTANT_RARE
	blood_decal_type = null

/obj/item/food/meat/slab/human/mutant/golem/adamantine
	icon_state = "agolemmeat"
	desc = "从史莱姆围栏到符文再到厨房，这就是科学。"
	foodtypes = MEAT | RAW | GROSS

/obj/item/food/meat/slab/human/mutant/lizard
	icon_state = "lizardmeat"
	desc = "美味的恐龙伤害。"
	tastes = list("meat" = 4, "scales" = 1)
	foodtypes = MEAT | RAW | GORE
	venue_value = FOOD_MEAT_MUTANT
	starting_reagent_purity = 0.4 // Take a look at their diet

/obj/item/food/meat/slab/human/mutant/lizard/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/plain/human/lizard, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE)

/obj/item/food/meat/slab/human/mutant/plant
	icon_state = "plantmeat"
	desc = "健康饮食的所有乐趣，加上食人行为的所有趣味。"
	tastes = list("salad" = 1, "wood" = 1)
	foodtypes = VEGETABLES
	venue_value = FOOD_MEAT_MUTANT_RARE
	blood_decal_type = /obj/effect/decal/cleanable/food/plant_smudge

/obj/item/food/meat/slab/human/mutant/shadow
	icon_state = "shadowmeat"
	desc = "哎哟，这锋利感。"
	tastes = list("darkness" = 1, "meat" = 1)
	foodtypes = MEAT | RAW | GORE
	venue_value = FOOD_MEAT_MUTANT_RARE

/obj/item/food/meat/slab/human/mutant/fly
	icon_state = "flymeat"
	desc = "没有什么比充满蛆虫的放射性突变肉体更能说明美味了。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/uranium = 3,
	)
	tastes = list("maggots" = 1, "the inside of a reactor" = 1)
	foodtypes = MEAT | RAW | GROSS | BUGS | GORE
	venue_value = FOOD_MEAT_MUTANT
	blood_decal_type = /obj/effect/decal/cleanable/insectguts

/obj/item/food/meat/slab/human/mutant/moth
	icon_state = "mothmeat"
	desc = "令人不快的粉状和干燥。不过，有点漂亮。"
	tastes = list("dust" = 1, "powder" = 1, "meat" = 2)
	foodtypes = MEAT | RAW | BUGS | GORE
	venue_value = FOOD_MEAT_MUTANT

/obj/item/food/meat/slab/human/mutant/skeleton
	name = "骨头"
	icon_state = "skeletonmeat"
	desc = "这件事总得有个限度，显然我们已经越界了。"
	tastes = list("bone" = 1)
	foodtypes = GROSS | GORE
	venue_value = FOOD_MEAT_MUTANT_RARE
	blood_decal_type = null

/obj/item/food/meat/slab/human/mutant/skeleton/make_processable()
	return //skeletons don't have cutlets

/obj/item/food/meat/slab/human/mutant/skeleton/make_grillable()
	return

/obj/item/food/meat/slab/human/mutant/zombie
	name = "肉（腐烂的）"
	icon_state = "rottenmeat"
	desc = "半途而废，即将成为你花园的肥料。"
	tastes = list("brains" = 1, "meat" = 1)
	foodtypes = RAW | MEAT | TOXIC | GORE | GROSS

/obj/item/food/meat/slab/human/mutant/ethereal
	icon_state = "etherealmeat"
	desc = "如此闪亮，让你觉得吃下它可能也会让你发光"
	food_reagents = list(/datum/reagent/consumable/liquidelectricity/enriched = 10)
	tastes = list("pure electricity" = 2, "meat" = 1)
	foodtypes = RAW | MEAT | TOXIC | GORE
	venue_value = FOOD_MEAT_MUTANT
	blood_decal_type = null

////////////////////////////////////// OTHER MEATS ////////////////////////////////////////////////////////

/obj/item/food/meat/slab/synthmeat
	name = "合成肉"
	icon_state = "meat_old"
	desc = "一块合成肉排。"
	foodtypes = RAW | MEAT //hurr durr chemicals were harmed in the production of this meat thus its non-vegan.
	venue_value = FOOD_PRICE_WORTHLESS
	starting_reagent_purity = 0.3

/obj/item/food/meat/slab/synthmeat/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/plain/synth, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE)

/obj/item/food/meat/slab/meatproduct
	name = "肉制品"
	icon_state = "meatproduct"
	desc = "一块经过空间站回收和化学处理的肉制品。"
	tastes = list("meat flavoring" = 2, "modified starches" = 2, "natural & artificial dyes" = 1, "butyric acid" = 1)
	foodtypes = RAW | MEAT
	starting_reagent_purity = 0.3

/obj/item/food/meat/slab/meatproduct/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/meatproduct, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE)

/obj/item/food/meat/slab/monkey
	name = "猴子肉"
	foodtypes = RAW | MEAT
	starting_reagent_purity = 0.3 // Monkeys are considered synthetic life

/obj/item/food/meat/slab/bugmeat
	name = "虫子肉"
	icon_state = "spidermeat"
	foodtypes = RAW | MEAT | BUGS
	blood_decal_type = /obj/effect/decal/cleanable/insectguts

/obj/item/food/meat/slab/bugmeat/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/raptor_food, health_modifier = 2, color_chances = string_list(list(/datum/raptor_color/green = 2)))

/obj/item/food/meat/slab/mouse
	name = "老鼠肉"
	desc = "一块老鼠肉。最好不要生吃。"
	foodtypes = RAW | MEAT | GORE

/obj/item/food/meat/slab/mouse/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_MOUSE, CELL_VIRUS_TABLE_GENERIC_MOB)

/obj/item/food/meat/slab/corgi
	name = "柯基肉"
	desc = "尝起来……嗯，你懂的……"
	tastes = list("meat" = 4, "a fondness for wearing hats" = 1)
	foodtypes = RAW | MEAT | GORE

/obj/item/food/meat/slab/corgi/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_CORGI, CELL_VIRUS_TABLE_GENERIC_MOB)

/obj/item/food/meat/slab/mothroach
	name = "蛾螂肉"
	desc = "一块轻质的肉。"
	foodtypes = RAW | MEAT | GROSS

/obj/item/food/meat/slab/mothroach/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/swabable, CELL_VIRUS_TABLE_GENERIC_MOB)

/obj/item/food/meat/slab/pug
	name = "哈巴狗肉"
	desc = "尝起来……嗯，你懂的……"
	foodtypes = RAW | MEAT | GORE

/obj/item/food/meat/slab/pug/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_PUG, CELL_VIRUS_TABLE_GENERIC_MOB)

/obj/item/food/meat/slab/killertomato
	name = "杀手番茄肉"
	desc = "来自一个巨大番茄的切片。"
	icon_state = "tomatomeat"
	food_reagents = list(/datum/reagent/consumable/nutriment = 2)
	custom_materials = null
	tastes = list("tomato" = 1)
	foodtypes = FRUIT
	blood_decal_type = /obj/effect/decal/cleanable/food/tomato_smudge

/obj/item/food/meat/slab/killertomato/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/killertomato, rand(70 SECONDS, 85 SECONDS), TRUE, TRUE)

/obj/item/food/meat/slab/killertomato/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/meat/rawcutlet/killertomato, 3, 3 SECONDS, table_required = TRUE, screentip_verb = "Cut", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/meat/slab/bear
	name = "熊肉"
	desc = "一块非常男子汉的肉。"
	icon_state = "bearmeat"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 16,
		/datum/reagent/medicine/morphine = 5,
		/datum/reagent/consumable/nutriment/vitamin = 2,
		/datum/reagent/consumable/nutriment/fat = 6,
	)
	tastes = list("meat" = 1, "salmon" = 1)
	foodtypes = RAW | MEAT

/obj/item/food/meat/slab/bear/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/meat/rawcutlet/bear, 3, 3 SECONDS, table_required = TRUE, screentip_verb = "Cut", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/meat/slab/bear/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/bear, rand(40 SECONDS, 70 SECONDS), TRUE, TRUE)

/obj/item/food/meat/slab/bear/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_BEAR, CELL_VIRUS_TABLE_GENERIC_MOB)

/obj/item/food/meat/slab/xeno
	name = "异形肉"
	desc = "一块肉。"
	icon_state = "xenomeat"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 8,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	bite_consumption = 4
	tastes = list("meat" = 1, "acid" = 1)
	foodtypes = RAW | MEAT
	blood_decal_type = /obj/effect/decal/cleanable/blood/xeno

/obj/item/food/meat/slab/xeno/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/meat/rawcutlet/xeno, 3, 3 SECONDS, table_required = TRUE, screentip_verb = "Cut", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/meat/slab/xeno/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/xeno, rand(40 SECONDS, 70 SECONDS), TRUE, TRUE)

/obj/item/food/meat/slab/spider
	name = "蜘蛛肉"
	desc = "一块蜘蛛肉。真是卡夫卡式的。"
	icon_state = "spidermeat"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/toxin = 3,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("cobwebs" = 1)
	foodtypes = RAW | MEAT | TOXIC
	blood_decal_type = /obj/effect/decal/cleanable/insectguts

/obj/item/food/meat/slab/spider/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/meat/rawcutlet/spider, 3, 3 SECONDS, table_required = TRUE, screentip_verb = "Cut", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/meat/slab/spider/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/spider, rand(40 SECONDS, 70 SECONDS), TRUE, TRUE)

/obj/item/food/meat/slab/goliath
	name = "歌利亚肉"
	desc = "一块歌利亚肉排。现在还不怎么适合食用，但在熔岩里烹饪会很棒。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/toxin = 5,
		/datum/reagent/consumable/nutriment/fat = 3,
	)
	icon_state = "goliathmeat"
	tastes = list("meat" = 1)
	foodtypes = RAW | MEAT | TOXIC

/obj/item/food/meat/slab/goliath/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/raptor_food, attack_modifier = 0.5, speed_modifier = -0.05, color_chances = string_list(list(/datum/raptor_color/red = 5)))

/obj/item/food/meat/slab/goliath/burn()
	visible_message(span_notice("[src] 烹饪完成了！"))
	new /obj/item/food/meat/steak/goliath(loc)
	qdel(src)

/obj/item/food/meat/slab/meatwheat
	name = "肉麦团块"
	desc = "这看起来不像肉，但你的标准本来也没<i>那么</i>高。"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 4, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/blood = 5, /datum/reagent/consumable/nutriment/fat = 1)
	icon_state = "meatwheat_clump"
	bite_consumption = 4
	tastes = list("meat" = 1, "wheat" = 1)

/obj/item/food/meat/slab/gorilla
	name = "大猩猩肉"
	desc = "比猴子肉肉感多了。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 7,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/consumable/nutriment/fat = 5, //Plenty of fat!
	)

/obj/item/food/meat/rawbacon
	name = "生培根片"
	desc = "一片生培根。"
	icon_state = "bacon"
	bite_consumption = 2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/fat = 3,
	)
	tastes = list("bacon" = 1)
	foodtypes = RAW | MEAT
	crafting_complexity = FOOD_COMPLEXITY_1

/obj/item/food/meat/rawbacon/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/bacon, rand(25 SECONDS, 45 SECONDS), TRUE, TRUE)

/obj/item/food/meat/bacon
	name = "培根片"
	desc = "一片美味的培根。"
	icon_state = "baconcooked"
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
		/datum/reagent/consumable/nutriment/fat = 2,
	)
	tastes = list("bacon" = 1)
	foodtypes = MEAT | BREAKFAST
	crafting_complexity = FOOD_COMPLEXITY_1
	blood_decal_type = null

/obj/item/food/meat/slab/gondola
	name = "冈多拉肉"
	desc = "根据古老的传说，生食冈多拉肉能让人获得内心的平静。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/gondola_mutation_toxin = 5,
		/datum/reagent/consumable/nutriment/fat = 3,
	)
	tastes = list("meat" = 4, "tranquility" = 1)
	foodtypes = RAW | MEAT | GORE

/obj/item/food/meat/slab/gondola/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/meat/rawcutlet/gondola, 3, 3 SECONDS, table_required = TRUE, screentip_verb = "Cut", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/meat/slab/gondola/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/gondola, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE) //Add medium rare later maybe?

/obj/item/food/meat/slab/penguin
	name = "企鹅肉"
	icon_state = "birdmeat"
	desc = "一块企鹅肉排。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/fat = 3,
	)
	tastes = list("beef" = 1, "cod fish" = 1)

/obj/item/food/meat/slab/penguin/make_processable()
	. = ..()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/meat/rawcutlet/penguin, 3, 3 SECONDS, table_required = TRUE, screentip_verb = "Cut", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/meat/slab/penguin/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/penguin, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE) //Add medium rare later maybe?

/obj/item/food/meat/slab/rawcrab
	name = "生蟹肉"
	desc = "一堆生蟹肉。"
	icon_state = "crabmeatraw"
	bite_consumption = 3
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/consumable/nutriment/fat = 3,
	)
	tastes = list("raw crab" = 1)
	foodtypes = RAW | MEAT

/obj/item/food/meat/slab/rawcrab/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/crab, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE) //Add medium rare later maybe?

/obj/item/food/meat/crab
	name = "蟹肉"
	desc = "一些美味烹制的蟹肉。"
	icon_state = "crabmeat"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/vitamin = 2,
		/datum/reagent/consumable/nutriment/fat = 2,
	)
	tastes = list("crab" = 1)
	foodtypes = SEAFOOD
	crafting_complexity = FOOD_COMPLEXITY_1
	blood_decal_type = null

/obj/item/food/meat/slab/chicken
	name = "鸡肉"
	icon_state = "birdmeat"
	desc = "一块生鸡肉。记得洗手！"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 6) //low fat
	tastes = list("chicken" = 1)
	starting_reagent_purity = 1

/obj/item/food/meat/slab/chicken/make_processable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/meat/rawcutlet/chicken, 3, 3 SECONDS, table_required = TRUE, screentip_verb = "Cut", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/meat/slab/chicken/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/chicken, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE) //Add medium rare later maybe? (no this is chicken)

/obj/item/food/meat/slab/chicken/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_CHICKEN, CELL_VIRUS_TABLE_GENERIC_MOB)

/obj/item/food/meat/slab/pig
	name = "生猪肉"
	desc = "一块生猪肉。这只小猪去了屠夫那里。"
	icon_state = "pig_meat"
	tastes = list("pig" = 1)
	foodtypes = RAW | MEAT | GORE
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/fat = 5,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	) // Fatty piece
	starting_reagent_purity = 1

/obj/item/food/meat/slab/pig/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/plain/pig, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE)

/obj/item/food/meat/slab/grassfed
	name = "生态肉"
	desc = "一块100%草饲的获奖农场肉。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 3,
		/datum/reagent/consumable/nutriment/fat = 4,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	) // Marble
	starting_reagent_purity = 1

/obj/item/food/meat/slab/blood_worm
	name = "血虫肉"
	desc = "谁觉得吃这东西是个好主意？至少它多汁..."
	foodtypes = RAW | MEAT | BUGS | GORE
	food_reagents = list(
		/datum/reagent/blood = 30, // What did you expect?
		/datum/reagent/consumable/nutriment/protein = 5, // Rich in protein.
		/datum/reagent/consumable/nutriment/vitamin = 3, // Rich in vitamins.
		/datum/reagent/consumable/nutriment/fat = 2, // Rather lean.
	)
	bite_consumption = 10
	starting_reagent_purity = 1

/obj/item/food/meat/slab/blood_worm/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/blood_worm, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE) //Add medium rare later maybe?

////////////////////////////////////// MEAT STEAKS ///////////////////////////////////////////////////////////
/obj/item/food/meat/steak
	name = "牛排"
	desc = "一块热辣辣的肉。"
	icon_state = "meatsteak"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/fat = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	foodtypes = MEAT
	tastes = list("meat" = 1)
	crafting_complexity = FOOD_COMPLEXITY_1
	blood_decal_type = null

/obj/item/food/meat/steak/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_ITEM_MICROWAVE_COOKED, PROC_REF(on_microwave_cooked))

/obj/item/food/meat/steak/proc/on_microwave_cooked(datum/source, atom/source_item, cooking_efficiency = 1)
	SIGNAL_HANDLER

	name = "[source_item.name]牛排"

/obj/item/food/meat/steak/plain

/obj/item/food/meat/steak/plain/human
	tastes = list("tender meat" = 1)
	foodtypes = MEAT | GORE

///Make sure the steak has the correct name
/obj/item/food/meat/steak/plain/human/on_microwave_cooked(datum/source, atom/source_item, cooking_efficiency = 1)
	. = ..()
	if(!istype(source_item, /obj/item/food/meat))
		return

	var/obj/item/food/meat/origin_meat = source_item
	subjectname = origin_meat.subjectname
	subjectjob = origin_meat.subjectjob
	if(subjectname)
		name = "[origin_meat.subjectname]肉排"
	else if(subjectjob)
		name = "[origin_meat.subjectjob]肉排"


/obj/item/food/meat/steak/killertomato
	name = "杀手番茄牛排"
	tastes = list("tomato" = 1)
	foodtypes = FRUIT

/obj/item/food/meat/steak/bear
	name = "熊排"
	tastes = list("meat" = 1, "salmon" = 1)

/obj/item/food/meat/steak/xeno
	name = "异形牛排"
	tastes = list("meat" = 1, "acid" = 1)

/obj/item/food/meat/steak/spider
	name = "蜘蛛排"
	tastes = list("cobwebs" = 1)
	foodtypes = parent_type::foodtypes | TOXIC

/obj/item/food/meat/steak/goliath
	name = "歌利亚牛排"
	desc = "一道美味的、用熔岩烹制的牛排。"
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	icon_state = "goliathsteak"
	trash_type = null
	tastes = list("meat" = 1, "rock" = 1)

/obj/item/food/meat/steak/goliath/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/raptor_food, attack_modifier = 1, speed_modifier = -0.075, color_chances = string_list(list(/datum/raptor_color/red = 7)))

/obj/item/food/meat/steak/gondola
	name = "冈多拉牛排"
	tastes = list("meat" = 1, "tranquility" = 1)

/obj/item/food/meat/steak/penguin
	name = "企鹅排"
	icon_state = "birdsteak"
	tastes = list("beef" = 1, "cod fish" = 1)

/obj/item/food/meat/steak/chicken
	name = "鸡排" //Can you have chicken steaks? Maybe this should be renamed once it gets new sprites.
	icon_state = "birdsteak"
	tastes = list("chicken" = 1)

/obj/item/food/meat/steak/plain/human/lizard
	name = "蜥蜴肉排"
	icon_state = "birdsteak"
	tastes = list("juicy chicken" = 3, "scales" = 1)
	foodtypes = MEAT | GORE

/obj/item/food/meat/steak/meatproduct
	name = "热加工肉制品"
	icon_state = "meatproductsteak"
	tastes = list("enhanced char" = 2, "suspicious tenderness" = 2, "natural & artificial dyes" = 2, "emulsifying agents" = 1)

/obj/item/food/meat/steak/plain/synth
	name = "合成肉排"
	desc = "一块合成肉排。它看起来不太对劲，不是吗？"
	icon_state = "meatsteak_old"
	tastes = list("meat" = 4, "cryoxandone" = 1)

/obj/item/food/meat/steak/plain/pig
	name = "猪排"
	desc = "一块猪排。别再烦我了！"
	icon_state = "pigsteak"
	tastes = list("pig" = 1)
	foodtypes = MEAT

/obj/item/food/meat/steak/blood_worm
	name = "血虫肉排"
	desc = "这才叫血淋淋的好肉排！"
	tastes = list("meat" = 1)
	foodtypes = MEAT | BUGS

//////////////////////////////// MEAT CUTLETS ///////////////////////////////////////////////////////

//Raw cutlets

/obj/item/food/meat/rawcutlet
	name = "生肉片"
	desc = "一块生肉片。"
	icon_state = "rawcutlet"
	bite_consumption = 2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("meat" = 1)
	foodtypes = MEAT | RAW
	var/meat_type = "meat"

/obj/item/food/meat/rawcutlet/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/food_storage)

/obj/item/food/meat/rawcutlet/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/cutlet/plain, rand(35 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/meat/rawcutlet/OnCreatedFromProcessing(mob/living/user, obj/item/work_tool, list/chosen_option, atom/original_atom)
	. = ..()
	if(!istype(original_atom, /obj/item/food/meat/slab))
		return
	var/obj/item/food/meat/slab/original_slab = original_atom
	var/mutable_appearance/filling = mutable_appearance(icon, "rawcutlet_coloration")
	filling.color = original_slab.slab_color
	add_overlay(filling)
	name = "生[original_atom.name]肉片"
	meat_type = original_atom.name

/obj/item/food/meat/rawcutlet/plain
	foodtypes = MEAT

/obj/item/food/meat/rawcutlet/plain/human
	tastes = list("tender meat" = 1)
	foodtypes = MEAT | RAW | GORE

/obj/item/food/meat/rawcutlet/plain/human/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/cutlet/plain/human, rand(35 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/meat/rawcutlet/plain/human/OnCreatedFromProcessing(mob/living/user, obj/item/item, list/chosen_option, atom/original_atom)
	. = ..()
	if(!istype(original_atom, /obj/item/food/meat))
		return
	var/obj/item/food/meat/origin_meat = original_atom
	subjectname = origin_meat.subjectname
	subjectjob = origin_meat.subjectjob
	if(subjectname)
		name = "生[origin_meat.subjectname]肉片"
	else if(subjectjob)
		name = "生[origin_meat.subjectjob]肉片"

/obj/item/food/meat/rawcutlet/killertomato
	name = "生杀手番茄肉片"
	tastes = list("tomato" = 1)
	foodtypes = FRUIT
	blood_decal_type = /obj/effect/decal/cleanable/food/tomato_smudge

/obj/item/food/meat/rawcutlet/killertomato/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/cutlet/killertomato, rand(35 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/meat/rawcutlet/bear
	name = "生熊肉片"
	tastes = list("meat" = 1, "salmon" = 1)

/obj/item/food/meat/rawcutlet/bear/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_BEAR, CELL_VIRUS_TABLE_GENERIC_MOB)

/obj/item/food/meat/rawcutlet/bear/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/cutlet/bear, rand(35 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/meat/rawcutlet/xeno
	name = "生异形肉片"
	tastes = list("meat" = 1, "acid" = 1)
	blood_decal_type = /obj/effect/decal/cleanable/blood/xeno

/obj/item/food/meat/rawcutlet/xeno/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/cutlet/xeno, rand(35 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/meat/rawcutlet/spider
	name = "生蜘蛛肉片"
	tastes = list("cobwebs" = 1)
	blood_decal_type = /obj/effect/decal/cleanable/insectguts
	foodtypes = parent_type::foodtypes | TOXIC

/obj/item/food/meat/rawcutlet/spider/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/cutlet/spider, rand(35 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/meat/rawcutlet/gondola
	name = "生冈多拉肉片"
	tastes = list("meat" = 1, "tranquility" = 1)

/obj/item/food/meat/rawcutlet/gondola/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/cutlet/gondola, rand(35 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/meat/rawcutlet/penguin
	name = "生企鹅肉片"
	tastes = list("beef" = 1, "cod fish" = 1)

/obj/item/food/meat/rawcutlet/penguin/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/cutlet/penguin, rand(35 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/meat/rawcutlet/chicken
	name = "生鸡肉片"
	tastes = list("chicken" = 1)

/obj/item/food/meat/rawcutlet/chicken/make_grillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/cutlet/chicken, rand(35 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/meat/rawcutlet/chicken/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_CHICKEN, CELL_VIRUS_TABLE_GENERIC_MOB)

//Cooked cutlets

/obj/item/food/meat/cutlet
	name = "肉排"
	desc = "一块煮熟的肉排。"
	icon_state = "cutlet"
	bite_consumption = 2
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("meat" = 1)
	foodtypes = MEAT
	crafting_complexity = FOOD_COMPLEXITY_1
	blood_decal_type = null

/obj/item/food/meat/cutlet/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_ITEM_MICROWAVE_COOKED, PROC_REF(on_microwave_cooked))

/obj/item/food/meat/cutlet/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/food_storage)

///This proc handles setting up the correct meat name for the cutlet, this should definitely be changed with the food rework.
/obj/item/food/meat/cutlet/proc/on_microwave_cooked(datum/source, atom/source_item, cooking_efficiency)
	SIGNAL_HANDLER

	if(!istype(source_item, /obj/item/food/meat/rawcutlet))
		return

	var/obj/item/food/meat/rawcutlet/original_cutlet = source_item
	name = "[original_cutlet.meat_type] 肉排"

/obj/item/food/meat/cutlet/plain

/obj/item/food/meat/cutlet/plain/human
	tastes = list("tender meat" = 1)
	foodtypes = MEAT | GORE

/obj/item/food/meat/cutlet/plain/human/on_microwave_cooked(datum/source, atom/source_item, cooking_efficiency)
	. = ..()
	if(!istype(source_item, /obj/item/food/meat))
		return

	var/obj/item/food/meat/origin_meat = source_item
	if(subjectname)
		name = "[origin_meat.subjectname] [initial(name)]"
	else if(subjectjob)
		name = "[origin_meat.subjectjob] [initial(name)]"

/obj/item/food/meat/cutlet/killertomato
	name = "杀手番茄肉排"
	tastes = list("tomato" = 1)
	foodtypes = FRUIT

/obj/item/food/meat/cutlet/bear
	name = "熊肉排"
	tastes = list("meat" = 1, "salmon" = 1)

/obj/item/food/meat/cutlet/xeno
	name = "异形肉排"
	tastes = list("meat" = 1, "acid" = 1)

/obj/item/food/meat/cutlet/spider
	name = "蜘蛛肉排"
	tastes = list("cobwebs" = 1)
	foodtypes = parent_type::foodtypes | TOXIC

/obj/item/food/meat/cutlet/gondola
	name = "冈多拉肉排"
	tastes = list("meat" = 1, "tranquility" = 1)

/obj/item/food/meat/cutlet/penguin
	name = "企鹅肉排"
	tastes = list("beef" = 1, "cod fish" = 1)

/obj/item/food/meat/cutlet/chicken
	name = "鸡肉排"
	tastes = list("chicken" = 1)
