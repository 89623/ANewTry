/obj/structure/closet/body_bag/stasis
	name = "停滞体袋"
	desc = "一种通过集成低温技术和低温隔热网设计用于保存尸体的裹尸袋。由于尺寸限制，它只对尸体有效。"
	icon = 'modular_nova/modules/stasisrework/icons/stasisbag.dmi'
	icon_state = "greenbodybag"
	foldedbag_path = /obj/item/bodybag/stasis
	mob_storage_capacity = 1
	max_mob_size = MOB_SIZE_LARGE

/obj/structure/closet/body_bag/stasis/open(mob/living/user, force = FALSE, special_effects = TRUE)
	for(var/mob/living/M in contents)
		thaw_them(M)
	. = ..()
	if(.)
		mouse_drag_pointer = MOUSE_INACTIVE_POINTER

/obj/structure/closet/body_bag/stasis/close()
	. = ..()
	for(var/mob/living/M in contents)
		if(M.stat == DEAD)
			chill_out(M)
	if(.)
		density = FALSE
		mouse_drag_pointer = MOUSE_ACTIVE_POINTER

/obj/structure/closet/body_bag/stasis/proc/chill_out(mob/living/target)
	var/freq = rand(24750, 26550)
	playsound(src, 'sound/effects/spray.ogg', 5, TRUE, 2, frequency = freq)
	target.apply_status_effect(/datum/status_effect/grouped/stasis, STASIS_MACHINE_EFFECT)
	ADD_TRAIT(target, TRAIT_TUMOR_SUPPRESSED, TRAIT_GENERIC)
	target.extinguish_mob()

/obj/structure/closet/body_bag/stasis/proc/thaw_them(mob/living/target)
	target.remove_status_effect(/datum/status_effect/grouped/stasis, STASIS_MACHINE_EFFECT)
	REMOVE_TRAIT(target, TRAIT_TUMOR_SUPPRESSED, TRAIT_GENERIC)
