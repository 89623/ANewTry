/datum/design/stasisbag
	name = "停滞裹尸袋"
	desc = "一种由低温停滞技术驱动的停滞尸袋。它只能容纳一具尸体，但能防止腐烂。"
	id = "stasisbag"
	build_type = PROTOLATHE | AWAY_LATHE
	build_path = /obj/item/bodybag/stasis
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/plasma = SHEET_MATERIAL_AMOUNT,
		/datum/material/diamond = HALF_SHEET_MATERIAL_AMOUNT,
	)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_MEDICAL,
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE
