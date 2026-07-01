//reforming
/obj/item/ectoplasm/revenant
	name = "微光残渣"
	desc = "一堆细腻的蓝色尘埃。微小的紫罗兰色雾状触须环绕着它。"
	icon = 'icons/effects/effects.dmi'
	icon_state = "revenantEctoplasm"
	w_class = WEIGHT_CLASS_SMALL
	/// Are we currently reforming?
	var/reforming = TRUE
	/// Are we inert (aka distorted such that we can't reform)?
	var/inert = FALSE
	/// The key of the revenant that we started the reform as
	var/old_ckey
	/// The revenant we're currently storing
	var/mob/living/basic/revenant/revenant

/obj/item/ectoplasm/revenant/Initialize(mapload)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(try_reform)), 1 MINUTES)

/obj/item/ectoplasm/revenant/Destroy()
	if(!QDELETED(revenant))
		qdel(revenant)
	return ..()

/obj/item/ectoplasm/revenant/attack_self(mob/user)
	if(!reforming || inert)
		return ..()
	user.visible_message(
		span_notice("[user] 将 [src] 向四面八方撒开。"),
		span_notice("你将 [src] 撒遍这片区域。粒子缓缓消散。"),
	)
	user.dropItemToGround(src)
	qdel(src)

/obj/item/ectoplasm/revenant/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(inert)
		return
	visible_message(span_notice("[src] 在撞击时碎裂成粒子，随后消散于无形。"))
	qdel(src)

/obj/item/ectoplasm/revenant/examine(mob/user)
	. = ..()
	if(inert)
		. += span_revennotice("它似乎没有活性。")
	else if(reforming)
		. += span_revenwarning("它正在变幻扭曲。明智之举是将其摧毁。")

/obj/item/ectoplasm/revenant/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] 正在吸入 [src]！看起来 [user.p_theyre()] 试图前往暗影界！"))
	qdel(src)
	return OXYLOSS

/obj/item/ectoplasm/revenant/proc/try_reform()
	if(reforming)
		reforming = FALSE
		reform()
	else
		inert = TRUE
		visible_message(span_warning("[src] 平息下来，似乎失去了生命迹象。"))

/// Actually moves the revenant out of ourself
/obj/item/ectoplasm/revenant/proc/reform()
	if(QDELETED(src) || QDELETED(revenant) || inert)
		return

	message_admins("Revenant ectoplasm was left undestroyed for 1 minute and is reforming into a new revenant.")
	forceMove(drop_location()) //In case it's in a backpack or someone's hand

	var/user_name = old_ckey
	if(isnull(revenant.client))
		var/mob/potential_user = get_new_user()
		revenant.PossessByPlayer(potential_user.key)
		user_name = potential_user.ckey
		qdel(potential_user)

	message_admins("[user_name] has been [old_ckey == user_name ? "re":""]made into a revenant by reforming ectoplasm.")
	revenant.log_message("was [old_ckey == user_name ? "re":""]made as a revenant by reforming ectoplasm.", LOG_GAME)
	visible_message(span_revenboldnotice("[src] 突然升到空中，随后消散。"))

	revenant.death_reset()
	revenant = null
	qdel(src)

/// Handles giving the revenant a new client to control it
/obj/item/ectoplasm/revenant/proc/get_new_user()
	message_admins("The new revenant's old client either could not be found or is in a new, living mob - grabbing a random candidate instead...")
	var/mob/chosen_one = SSpolling.poll_ghosts_for_target("你想成为 [span_notice(revenant.name)]（正在重组）吗？", check_jobban = ROLE_REVENANT, role = ROLE_REVENANT, poll_time = 5 SECONDS, checked_target = revenant, alert_pic = revenant, role_name_text = "正在重组的怨魂", chat_text_border_icon = revenant)
	if(isnull(chosen_one))
		message_admins("No candidates were found for the new revenant.")
		inert = TRUE
		visible_message(span_revenwarning("[src] 平息下来，似乎失去了生命迹象。"))
		qdel(revenant)
		return null
	return chosen_one
