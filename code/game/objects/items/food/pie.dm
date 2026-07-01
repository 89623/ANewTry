/obj/item/food/pie
	icon = 'icons/obj/food/piecake.dmi'
	inhand_icon_state = "pie"
	bite_consumption = 3
	w_class = WEIGHT_CLASS_NORMAL
	max_volume = 80
	food_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("pie" = 1)
	foodtypes = GRAIN | DAIRY
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_2
	/// type is spawned 5 at a time and replaces this pie when processed by cutting tool
	var/obj/item/food/pieslice/slice_type
	/// so that the yield can change if it isn't 5
	var/yield = 5

/obj/item/food/pie/make_processable()
	if (slice_type)
		AddElement(/datum/element/processable, TOOL_KNIFE, slice_type, yield, table_required = TRUE, screentip_verb = "Slice", sound_to_play = SFX_KNIFE_SLICE)

/obj/item/food/pieslice
	name = "馅饼切片"
	icon = 'icons/obj/food/piecake.dmi'
	w_class = WEIGHT_CLASS_TINY
	food_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("pie" = 1, "uncertainty" = 1)
	foodtypes = GRAIN | DAIRY
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/pie/plain
	name = "素馅饼"
	desc = "一个简单的馅饼，依然美味。"
	icon_state = "pie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
	tastes = list("pie" = 1)
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/pie/plain/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/ingredients_holder, /obj/item/food/pie/empty, CUSTOM_INGREDIENT_ICON_FILL, max_ingredients = 8)

/obj/item/food/pie/empty
	name = "馅饼"
	desc = "一个由疯狂的厨师制作的自定义馅饼。"
	icon_state = "pie_custom"
	slice_type = /obj/item/food/pieslice/empty

/obj/item/food/pieslice/empty
	name = "馅饼切片"
	desc = "一个由疯狂的厨师制作的自定义馅饼切片。"
	icon_state = "pie_custom_slice"

/obj/item/food/pieslice/empty/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/ingredients_holder, null, CUSTOM_INGREDIENT_ICON_FILL, max_ingredients = 8)

/obj/item/food/pie/cream
	name = "香蕉奶油派"
	desc = "就像回到家乡，小丑星球！HONK！"
	icon_state = "pie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/consumable/banana = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("pie" = 1)
	foodtypes = GRAIN|DAIRY|SUGAR|FRUIT
	var/stunning = TRUE
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/cream/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/splat, hit_callback = CALLBACK(src, PROC_REF(stun_and_blur)))

/obj/item/food/pie/cream/proc/stun_and_blur(mob/living/victim, can_splat_on)
	if(stunning)
		victim.Paralyze(2 SECONDS) //splat!
	if(can_splat_on)
		victim.adjust_eye_blur(2 SECONDS)
	victim.visible_message(span_warning("[victim] 被 [src] 糊了一脸奶油！"), span_userdanger("你被 [src] 糊了一脸奶油！"))
	playsound(victim, SFX_DESECRATION, 50, TRUE)

/obj/item/food/pie/cream/nostun
	stunning = FALSE

/obj/item/food/pie/berryclafoutis
	name = "浆果克拉芙缇"
	desc = "没有黑鸟，这是个好兆头。"
	icon_state = "berryclafoutis"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/berryjuice = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("pie" = 1, "blackberries" = 1)
	foodtypes = GRAIN|FRUIT|DAIRY|SUGAR
	venue_value = FOOD_PRICE_NORMAL
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/bearypie
	name = "熊肉派"
	desc = "没有棕熊，这是个好兆头。"
	icon_state = "bearypie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/protein = 5,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("pie" = 1, "meat" = 1, "salmon" = 1)
	foodtypes = GRAIN|DAIRY|SUGAR|MEAT|FRUIT
	crafting_complexity = FOOD_COMPLEXITY_4
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/pie/meatpie
	name = "肉派"
	icon_state = "meatpie"
	desc = "一份老理发师传下来的食谱，非常美味！"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 10,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		/datum/reagent/consumable/nutriment/protein = 2,
	)
	tastes = list("pie" = 1, "meat" = 1)
	foodtypes = GRAIN|DAIRY|MEAT
	venue_value = FOOD_PRICE_NORMAL
	slice_type = /obj/item/food/pieslice/meatpie
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/pieslice/meatpie
	name = "肉派切片"
	desc = "噢，太好了，是肉派！"
	icon_state = "meatpie_slice"
	tastes = list("pie" = 1, "meat" = 1)
	foodtypes = GRAIN|DAIRY|MEAT
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT / 5)

/obj/item/food/pie/tofupie
	name = "豆腐派"
	icon_state = "meatpie"
	desc = "一份美味的豆腐派。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/protein = 1,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("pie" = 1, "tofu" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES
	slice_type = /obj/item/food/pieslice/tofupie
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/tofupie
	name = "豆腐派切片"
	desc = "噢，太好了，是肉派——等等！！"
	icon_state = "meatpie_slice"
	tastes = list("pie" = 1, "disappointment" = 1, "tofu" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/amanita_pie
	name = "毒蝇伞派"
	desc = "香甜可口的毒派。"
	icon_state = "amanita_pie"
	bite_consumption = 4
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/toxin/amatoxin = 3,
		/datum/reagent/drug/mushroomhallucinogen = 1,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("pie" = 1, "mushroom" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES|TOXIC|GROSS
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/plump_pie
	name = "肥美蘑菇派"
	desc = "我打赌你一定喜欢用肥美蘑菇做的东西！"
	icon_state = "plump_pie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("pie" = 1, "mushroom" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/plump_pie/Initialize(mapload)
	var/fey = prob(10)
	if(fey)
		name = "极品肥美蘑菇派"
		desc = "微波炉被一股狂热的情绪占据了！它烹饪出了一个极品的肥美蘑菇派！"
		food_reagents = list(
			/datum/reagent/consumable/nutriment = 11,
			/datum/reagent/medicine/omnizine = 5,
			/datum/reagent/consumable/nutriment/vitamin = 4,
		)
	. = ..()

/obj/item/food/pie/xemeatpie
	name = "异形派"
	icon_state = "xenomeatpie"
	desc = "一份美味的肉派。可能属于异端。"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("pie" = 1, "meat" = 1, "acid" = 1)
	foodtypes = MEAT|GRAIN|DAIRY
	slice_type = /obj/item/food/pieslice/xemeatpie
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT)

/obj/item/food/pieslice/xemeatpie
	name = "异形派切片"
	desc = "天啊……它还在动吗？"
	icon_state = "xenopie_slice"
	tastes = list("pie" = 1, "acid" = 1, "meat" = 1)
	foodtypes = GRAIN|DAIRY|MEAT
	crafting_complexity = FOOD_COMPLEXITY_3
	custom_materials = list(/datum/material/meat = MEATDISH_MATERIAL_AMOUNT / 5)

/obj/item/food/pie/applepie
	name = "苹果派"
	desc = "一个包含着甜蜜的爱……或者苹果的派。"
	icon_state = "applepie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("pie" = 1, "apple" = 1)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	slice_type = /obj/item/food/pieslice/apple
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/apple
	name = "苹果派切片"
	desc = "一片舒适的苹果派，温暖的秋日回忆即将到来。"
	icon_state = "applepie_slice"
	tastes = list("pie" = 1, "apples" = 1)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3


/obj/item/food/pie/cherrypie
	name = "樱桃派"
	desc = "美味到让一个成年男人落泪。"
	icon_state = "cherrypie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("pie" = 7, "Nicole Paige Brooks" = 2)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	slice_type = /obj/item/food/pieslice/cherry
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/cherry
	name = "樱桃派切片"
	desc = "一片美味的樱桃派，希望是莫雷洛樱桃！"
	icon_state = "cherrypie_slice"
	tastes = list("pie" = 1, "apples" = 1)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/pumpkinpie
	name = "南瓜派"
	desc = "适合秋月的美味点心。"
	icon_state = "pumpkinpie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 11,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("pie" = 1, "pumpkin" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES|SUGAR
	slice_type = /obj/item/food/pieslice/pumpkin
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/pumpkin
	name = "南瓜派切片"
	desc = "一片南瓜派，上面有搅打奶油。完美。"
	icon_state = "pumpkinpieslice"
	tastes = list("pie" = 1, "pumpkin" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/appletart
	name = "黄金苹果酥粒挞"
	desc = "一道美味的甜点，它无法通过金属探测器。"
	icon_state = "gappletart"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 8,
		/datum/reagent/gold = 5,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("pie" = 1, "apple" = 1, "expensive metal" = 1)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/pie/grapetart
	name = "葡萄挞"
	desc = "一道美味的甜点，让你想起你没酿成的葡萄酒。"
	icon_state = "grapetart"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("pie" = 1, "grape" = 1)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/pie/mimetart
	name = "默剧挞"
	desc = "..."
	icon_state = "mimetart"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 5,
		/datum/reagent/consumable/nutriment/vitamin = 5,
		/datum/reagent/consumable/nothing = 10,
	)
	tastes = list("nothing" = 3)
	foodtypes = GRAIN|DAIRY|SUGAR
	crafted_food_buff = /datum/status_effect/food/trait/mute

/obj/item/food/pie/berrytart
	name = "浆果挞"
	desc = "一道美味的甜点，由许多不同的小浆果放在薄薄的派皮上制成。"
	icon_state = "berrytart"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 3,
		/datum/reagent/consumable/nutriment/vitamin = 5,
	)
	tastes = list("pie" = 1, "berries" = 2)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR

/obj/item/food/pie/cocolavatart
	name = "巧克力熔岩挞"
	desc = "一种美味的巧克力甜点，带有流心内馅。" //But it doesn't even contain chocolate...
	icon_state = "cocolavatart"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("pie" = 1, "dark chocolate" = 3)
	foodtypes = GRAIN|DAIRY|SUGAR

/obj/item/food/pie/blumpkinpie
	name = "蓝南瓜派"
	desc = "一种用有毒蓝南瓜制成的古怪蓝色派。"
	icon_state = "blumpkinpie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 13,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("pie" = 1, "a mouthful of pool water" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES|SUGAR
	slice_type = /obj/item/food/pieslice/blumpkin
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/blumpkin
	name = "蓝南瓜派切片"
	desc = "一块蓝南瓜派切片，顶部有生奶油。这真的能吃吗？"
	icon_state = "blumpkinpieslice"
	tastes = list("pie" = 1, "a mouthful of pool water" = 1)
	foodtypes = GRAIN|DAIRY|VEGETABLES|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/dulcedebatata
	name = "红薯甜糕"
	desc = "一种用红薯制成的美味果冻。"
	icon_state = "dulcedebatata"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 14,
		/datum/reagent/consumable/nutriment/vitamin = 8,
	)
	tastes = list("jelly" = 1, "sweet potato" = 1)
	foodtypes = VEGETABLES | SUGAR
	venue_value = FOOD_PRICE_EXOTIC
	slice_type = /obj/item/food/pieslice/dulcedebatata
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/dulcedebatata
	name = "红薯甜糕切片"
	desc = "一块香甜的红薯甜糕果冻切片。"
	icon_state = "dulcedebatataslice"
	tastes = list("jelly" = 1, "sweet potato" = 1)
	foodtypes = VEGETABLES | SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/frostypie
	name = "冰霜派"
	desc = "尝起来像蓝色和寒冷。"
	icon_state = "frostypie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 14,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("mint" = 1, "pie" = 1)
	foodtypes = GRAIN|DAIRY|FRUIT|SUGAR
	slice_type = /obj/item/food/pieslice/frostypie
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/frostypie
	name = "冰霜派切片"
	desc = "美味的蓝色，就像我最喜欢的蜡笔！"
	icon_state = "frostypie_slice"
	tastes = list("pie" = 1, "mint" = 1)
	foodtypes = GRAIN | FRUIT | SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/baklava
	name = "果仁蜜饼"
	desc = "一种由坚果层和薄面包制成的美味健康小吃。"
	icon_state = "baklava"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
	tastes = list("nuts" = 1, "pie" = 1)
	foodtypes = GRAIN|DAIRY|SUGAR
	slice_type = /obj/item/food/pieslice/baklava
	yield = 6
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/pieslice/baklava
	name = "果仁蜜饼碟"
	desc = "一份由坚果层和薄面包制成的美味健康小吃"
	icon_state = "baklavaslice"
	tastes = list("nuts" = 1, "pie" = 1)
	foodtypes = GRAIN|DAIRY|SUGAR
	crafting_complexity = FOOD_COMPLEXITY_4

/obj/item/food/pie/frenchsilkpie
	name = "法式丝绸派"
	desc = "一种奢华的派，由奶油巧克力慕斯馅料制成，顶部覆盖一层生奶油和巧克力屑。可切片。"
	icon_state = "frenchsilkpie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("pie" = 1, "smooth chocolate" = 1, "whipped cream" = 1)
	foodtypes = GRAIN | DAIRY | SUGAR
	slice_type = /obj/item/food/pieslice/frenchsilk
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pieslice/frenchsilk
	name = "法式丝绸派切片"
	desc = "一片法式丝绸派，内馅是巧克力慕斯，顶部覆盖着一层鲜奶油和巧克力屑。美味到足以让你落泪。"
	icon_state = "frenchsilkpieslice"
	tastes = list("pie" = 1, "smooth chocolate" = 1, "whipped cream" = 1)
	foodtypes = GRAIN | DAIRY | SUGAR
	crafting_complexity = FOOD_COMPLEXITY_3

/obj/item/food/pie/shepherds_pie
	name = "牧羊人派"
	desc = "一道由碎肉和混合蔬菜制成，上面覆盖着奶油土豆泥烘烤而成的菜肴。可切片。"
	icon_state = "shepherds_pie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 40,
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment/protein = 20,
	)
	tastes = list("juicy meat" = 2, "mashed potatoes" = 2, "baked veggies" = 2)
	foodtypes = MEAT | DAIRY | VEGETABLES
	slice_type = /obj/item/food/pieslice/shepherds_pie
	yield = 4
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = MEATSLAB_MATERIAL_AMOUNT)

/obj/item/food/pieslice/shepherds_pie
	name = "牧羊人派切片"
	desc = "一片凌乱的牧羊人派，由碎肉和混合蔬菜制成，上面覆盖着奶油土豆泥烘烤而成。危险地美味。"
	icon_state = "shepherds_pie_slice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 10,
		/datum/reagent/consumable/nutriment/vitamin = 3,
		/datum/reagent/consumable/nutriment/protein = 5,
	)
	tastes = list("juicy meat" = 1, "mashed potatoes" = 1, "baked veggies" = 1)
	foodtypes = MEAT | DAIRY | VEGETABLES
	crafting_complexity = FOOD_COMPLEXITY_5
	custom_materials = list(/datum/material/meat = SHEET_MATERIAL_AMOUNT)

/obj/item/food/pie/asdfpie
	name = "派味派"
	desc = "我给你烤了个派！"
	icon_state = "asdfpie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 16,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
	tastes = list("pie" = 1, "the far off year of 2010" = 1)
	foodtypes = GRAIN|DAIRY
	crafting_complexity = FOOD_COMPLEXITY_2

/obj/item/food/pie/bacid_pie
	name = "电池酸液派"
	desc = "哦，这是一个用……电池酸液做的派？你觉得以太族可能会享受吃这个。"
	icon_state = "bacid_pie"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 18,
		/datum/reagent/consumable/liquidelectricity/enriched = 18
	)
	tastes = list("battery acid" = 2, "electricity" = 2, "a cyber world" = 2)
	foodtypes = GRAIN|DAIRY|TOXIC
	slice_type = /obj/item/food/pieslice/bacid_pie
	yield = 4
	crafting_complexity = FOOD_COMPLEXITY_3


/obj/item/food/pieslice/bacid_pie
	name = "电池酸液派切片"
	desc = "电池酸液馅料呈现出一种令人不安的诱人亮绿色"
	icon_state = "bacid_pie_slice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4.5,
		/datum/reagent/consumable/liquidelectricity/enriched = 4.5
	)
	tastes = list("battery acid" = 1, "electricity" = 1, "a cyber world" = 1)
	foodtypes = TOXIC
	crafting_complexity = FOOD_COMPLEXITY_3
