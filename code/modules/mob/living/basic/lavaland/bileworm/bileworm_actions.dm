/datum/action/cooldown/mob_cooldown/resurface
	name = "重新露面"
	desc = "先潜入地下，然后前往靠近目标的新地点。必须吐出胆汁来恢复体力。"
	shared_cooldown = MOB_SHARED_COOLDOWN_1 | MOB_SHARED_COOLDOWN_2

/datum/action/cooldown/mob_cooldown/resurface/Activate(atom/target_atom)
	StartCooldownSelf(INFINITY)
	burrow(owner, target_atom)
	//spew now off cooldown shortly
	StartCooldownOthers(1.5 SECONDS)

/datum/action/cooldown/mob_cooldown/resurface/proc/burrow(mob/living/burrower, atom/target)
	var/turf/unburrow_turf = get_unburrow_turf(burrower, target)
	if(!unburrow_turf) // means all the turfs nearby are station turfs or something, not lavaland
		to_chat(burrower, span_warning("无法在目标附近任何地方掘地！"))
		if(burrower.ai_controller?.ai_status == AI_STATUS_ON)
			//this is a valid reason to give up on a target
			burrower.ai_controller.clear_blackboard_key(BB_BASIC_MOB_CURRENT_TARGET)
		return
	playsound(burrower, 'sound/effects/break_stone.ogg', 50, TRUE)
	new /obj/effect/temp_visual/mook_dust(get_turf(burrower))
	ADD_TRAIT(burrower, TRAIT_GODMODE, REF(src))
	burrower.SetInvisibility(INVISIBILITY_MAXIMUM, id=type)
	burrower.forceMove(unburrow_turf)
	//not that it's gonna die with godmode but still
	SLEEP_CHECK_DEATH(rand(0.7 SECONDS, 1.2 SECONDS), burrower)
	playsound(burrower, 'sound/effects/break_stone.ogg', 50, TRUE)
	new /obj/effect/temp_visual/mook_dust(unburrow_turf)
	REMOVE_TRAIT(burrower, TRAIT_GODMODE, REF(src))
	burrower.RemoveInvisibility(type)

/datum/action/cooldown/mob_cooldown/resurface/proc/get_unburrow_turf(mob/living/burrower, atom/target)
	//we want the worm to try guaranteeing a hit on a living target if it thinks it can
	var/cardinal_only = FALSE

	if(isliving(target))
		var/mob/living/living_target = target
		if(living_target.stat >= UNCONSCIOUS)
			cardinal_only = TRUE

	var/list/potential_turfs = shuffle(oview(5, target))//get in view, shuffle
	var/list/fallback_turfs = list()
	for(var/turf/open/misc/chosen_one in potential_turfs)//first turf that counts as ground
		if(cardinal_only && !(get_dir(chosen_one, target) in GLOB.cardinals))
			fallback_turfs.Add(chosen_one)
			continue
		return chosen_one
	//even if a worm can't execute someone in crit, it should not fail if it has SOMETHING to move to.
	if(fallback_turfs.len)
		return pick(fallback_turfs)

/datum/action/cooldown/mob_cooldown/projectile_attack/dir_shots/bileworm
	name = "呕吐胆汁"
	desc = "四处喷射出胆汁。使用后必须重新浸入土中以恢复洁净。"
	projectile_type = /obj/projectile/bileworm_acid
	projectile_sound = 'sound/mobs/non-humanoids/bileworm/bileworm_spit.ogg'
	shared_cooldown = MOB_SHARED_COOLDOWN_1 | MOB_SHARED_COOLDOWN_2

/datum/action/cooldown/mob_cooldown/projectile_attack/dir_shots/bileworm/Activate(atom/target_atom)
	StartCooldownSelf(INFINITY)
	attack_sequence(owner, target_atom)
	//resurface now off cooldown shortly
	StartCooldownOthers(2.5 SECONDS)

/datum/action/cooldown/mob_cooldown/projectile_attack/dir_shots/bileworm/attack_sequence(mob/living/firer, atom/target)
	fire_in_directions(firer, target, GLOB.cardinals)
	SLEEP_CHECK_DEATH(0.5 SECONDS, firer)
	fire_in_directions(firer, target, GLOB.diagonals)

/obj/projectile/bileworm_acid
	name = "酸性胆汁"
	icon_state = "neurotoxin"
	hitsound = 'sound/items/weapons/sear.ogg'
	damage = 20
	speed = 0.5
	range = 20
	jitter = 3 SECONDS
	stutter = 3 SECONDS
	damage_type = BURN
	pass_flags = PASSTABLE

/obj/projectile/bileworm_acid/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/parriable_projectile)

/datum/action/cooldown/mob_cooldown/devour
	name = "吞噬"
	desc = "先潜入地下，然后前往目标位置进行攻击。冷却时间较短，但目标必须处于昏迷状态。"
	shared_cooldown = MOB_SHARED_COOLDOWN_2

/datum/action/cooldown/mob_cooldown/devour/Activate(atom/target_atom)
	if(target_atom == owner)
		to_chat(owner, span_warning("你不能吃自己！"))
		return
	if(!isliving(target_atom))
		to_chat(owner, span_warning("那不是食物！"))
		return
	var/mob/living/living_target = target_atom
	if(living_target.stat < UNCONSCIOUS)
		to_chat(owner, span_warning("它还在动，你不可能吃掉它！至少得先让它失去意识。"))
		return
	burrow_and_devour(owner, living_target)

/datum/action/cooldown/mob_cooldown/devour/proc/burrow_and_devour(mob/living/devourer, mob/living/target)
	var/turf/devour_turf = get_turf(target)
	if(!istype(devour_turf, /turf/open/misc)) // means all the turfs nearby are station turfs or something, not lavaland
		to_chat(devourer, span_warning("你的目标所在的位置你无法掘地通过！"))
		return //this will give up on devouring the target which is fine by me
	playsound(devourer, 'sound/effects/break_stone.ogg', 50, TRUE)
	new /obj/effect/temp_visual/mook_dust(get_turf(devourer))
	ADD_TRAIT(devourer, TRAIT_GODMODE, REF(src))
	devourer.SetInvisibility(INVISIBILITY_MAXIMUM, id=type)
	devourer.forceMove(devour_turf)
	//not that it's gonna die with godmode but still
	SLEEP_CHECK_DEATH(rand(0.7 SECONDS, 1.2 SECONDS), devourer)
	playsound(devourer, 'sound/effects/break_stone.ogg', 50, TRUE)
	new /obj/effect/temp_visual/mook_dust(devour_turf)
	REMOVE_TRAIT(devourer, TRAIT_GODMODE, REF(src))
	devourer.RemoveInvisibility(type)
	if(!(target in devour_turf))
		to_chat(devourer, span_warning("有人偷了你的晚餐！"))
		return
	to_chat(target, span_userdanger("你被 [devourer] 吞噬了！"))
	devourer.visible_message(span_warning("[devourer] 吞噬了 [target]！"))
	devourer.fully_heal()
	playsound(devourer, 'sound/effects/splat.ogg', 50, TRUE)
	//to be received on death
	target.forceMove(devourer)
