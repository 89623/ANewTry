/obj/item/cane
	name = "手杖"
	desc = "真正绅士使用的手杖。或者小丑。"
	icon = 'icons/obj/weapons/staff.dmi'
	icon_state = "cane"
	inhand_icon_state = "stick"
	icon_angle = 135
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 5
	throwforce = 5
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron= SMALL_MATERIAL_AMOUNT * 0.5)
	attack_verb_continuous = list("bludgeons", "whacks", "disciplines", "thrashes")
	attack_verb_simple = list("bludgeon", "whack", "discipline", "thrash")

/obj/item/cane/examine(mob/user, thats)
	. = ..()
	. += span_notice("此物品可用于支撑你的体重，防止因腿部骨折而跛行。")

/obj/item/cane/equipped(mob/living/user, slot, initial)
	..()
	if(!(slot & ITEM_SLOT_HANDS))
		return
	movement_support_add(user)

/obj/item/cane/dropped(mob/living/user, silent = FALSE)
	. = ..()
	movement_support_del(user)

/obj/item/cane/proc/movement_support_add(mob/living/user)
	RegisterSignal(user, COMSIG_CARBON_LIMPING, PROC_REF(handle_limping))
	return TRUE

/obj/item/cane/proc/movement_support_del(mob/living/user)
	UnregisterSignal(user, list(COMSIG_CARBON_LIMPING))
	return TRUE

/obj/item/cane/proc/handle_limping(mob/living/user)
	SIGNAL_HANDLER
	return COMPONENT_CANCEL_LIMP

/obj/item/cane/crutch
	name = "医用拐杖"
	desc = "供缺腿人士使用的医用拐杖。不过，如果你两条腿都没了，就没那么有用了。"
	icon = 'icons/obj/weapons/staff.dmi'
	icon_state = "crutch_med"
	inhand_icon_state = "crutch_med"
	icon_angle = 45
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 12
	throwforce = 8
	w_class = WEIGHT_CLASS_BULKY
	custom_materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 0.5)
	attack_verb_continuous = list("bludgeons", "whacks", "thrashes")
	attack_verb_simple = list("bludgeon", "whack", "thrash")

/obj/item/cane/crutch/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/cuffable_item)

/obj/item/cane/crutch/examine(mob/user, thats)
	. = ..()
	// tacked on after the cane string
	. += span_notice("作为拐杖，它也能帮助减轻因缺腿而导致的减速影响。")

/obj/item/cane/crutch/movement_support_add(mob/living/user)
	. = ..()
	if(!.)
		return
	RegisterSignal(user, COMSIG_LIVING_LIMBLESS_SLOWDOWN, PROC_REF(handle_slowdown))
	user.update_usable_leg_status()
	user.AddElementTrait(TRAIT_WADDLING, REF(src), /datum/element/waddling)

/obj/item/cane/crutch/movement_support_del(mob/living/user)
	. = ..()
	if(!.)
		return
	UnregisterSignal(user, list(COMSIG_LIVING_LIMBLESS_SLOWDOWN, COMSIG_CARBON_LIMPING))
	user.update_usable_leg_status()
	REMOVE_TRAIT(user, TRAIT_WADDLING, REF(src))

/obj/item/cane/crutch/proc/handle_slowdown(mob/living/user, limbless_slowdown, list/slowdown_mods)
	SIGNAL_HANDLER
	var/leg_amount = user.usable_legs
	// Don't do anything if the number is equal (or higher) to the usual.
	if(leg_amount >= user.default_num_legs)
		return
	// If we have at least one leg and it's less than the default, reduce slowdown by 60%.
	if(leg_amount && (leg_amount < user.default_num_legs))
		slowdown_mods += 0.4

/obj/item/cane/crutch/wood
	name = "木制拐杖"
	desc = "手工制作的拐杖。如果需要，也能当不错的钝器用。"
	icon_state = "crutch_wood"
	inhand_icon_state = "crutch_wood"
	custom_materials = list(/datum/material/wood = SHEET_MATERIAL_AMOUNT * 5)

/obj/item/cane/white
	name = "白手杖"
	desc = "传统上由盲人使用以帮助他们“看见”。可折叠以便于携带。"
	icon_state = "cane_white"
	inhand_icon_state = "cane_white"
	icon_angle = 45
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 1
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 6)

/obj/item/cane/white/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/cuffable_item)
	AddComponent( \
		/datum/component/transforming, \
		force_on = 7, \
		hitsound_on = hitsound, \
		w_class_on = WEIGHT_CLASS_BULKY, \
		clumsy_check = FALSE, \
		attack_verb_continuous_on = list("smacks", "strikes", "cracks", "beats"), \
		attack_verb_simple_on = list("smack", "strike", "crack", "beat"), \
	)
	RegisterSignal(src, COMSIG_TRANSFORMING_ON_TRANSFORM, PROC_REF(on_transform))

/obj/item/cane/white/handle_limping(mob/living/user)
	return HAS_TRAIT(src, TRAIT_TRANSFORM_ACTIVE) ? COMPONENT_CANCEL_LIMP : NONE

/*
 * Signal proc for [COMSIG_TRANSFORMING_ON_TRANSFORM].
 *
 * Gives feedback to the user and makes it show up inhand.
 */
/obj/item/cane/white/proc/on_transform(obj/item/source, mob/user, active)
	SIGNAL_HANDLER

	if(user)
		balloon_alert(user, active ? "展开" : "收起")

	if(!HAS_TRAIT(src, TRAIT_BLIND_TOOL))
		ADD_TRAIT(src, TRAIT_BLIND_TOOL, INNATE_TRAIT)
	else
		REMOVE_TRAIT(src, TRAIT_BLIND_TOOL, INNATE_TRAIT)

	playsound(src, 'sound/items/weapons/batonextend.ogg', 50, TRUE)
	return COMPONENT_NO_DEFAULT_MESSAGE
