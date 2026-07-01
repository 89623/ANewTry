/// Applies the dreaded cone of shame to a target.
/datum/smite/cone_of_shame
	name = "耻辱之锥"

/datum/smite/cone_of_shame/divine
	name = "耻辱之锥（神圣）"
	smite_flags = SMITE_DIVINE

/obj/item/clothing/head/cone_of_shame/bad_dog
	name = "耻辱之锥。"
	desc = "你表现得非常糟糕。"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/item/clothing/head/cone_of_shame/bad_dog/equipped(mob/user, slot)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CLOTHING_TRAIT)

/datum/smite/cone_of_shame/effect(client/user, mob/living/target)
	. = ..()
	if (!iscarbon(target) && !iscyborg(target))
		to_chat(user, span_warning("必须对碳基或机械人生物使用。"), confidential = TRUE)
		return
	var/obj/item/clothing/head/cone_of_shame/bad_dog/thecone = new
	if(iscarbon(target))
		var/mob/living/carbon/shamed = target
		var/obj/item/worn_necky = shamed.wear_neck
		if(istype(worn_necky))
			shamed.dropItemToGround(worn_necky)
		shamed.visible_message(span_warning("一个耻辱之锥出现在 [shamed] 的脖子上！"))
		shamed.equip_to_slot_if_possible(thecone, ITEM_SLOT_NECK ,qdel_on_fail = TRUE, disable_warning = TRUE, redraw_mob = TRUE)
		return
	if(iscyborg(target))
		var/mob/living/silicon/robot/borgy = target
		borgy.place_on_head(thecone)
		borgy.visible_message(span_warning("一个耻辱之锥出现在 [borgy] 的脖子上！"))
		return
	qdel(thecone)

