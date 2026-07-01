/datum/personality/nt
	groups = list(PERSONALITY_GROUP_NT)
	processes = TRUE
	/// What mood event to apply when seeing NT propaganda
	var/mood_event_type

/datum/personality/nt/proc/can_see_nt_propaganda(mob/living/subject)
	for(var/obj/structure/sign/nearby in view(subject, 5))
		if(istype(nearby, /obj/structure/sign/nanotrasen))
			return TRUE
		if(istype(nearby, /obj/structure/sign/poster/official/nanotrasen_logo))
			return TRUE

	return FALSE

/datum/personality/nt/on_tick(mob/living/subject, seconds_per_tick)
	if(can_see_nt_propaganda(subject))
		subject.add_mood_event("nt_personality", mood_event_type)
	else
		subject.clear_mood_event("nt_personality")

/datum/personality/nt/remove_from_mob(mob/living/who)
	. = ..()
	who.clear_mood_event("nt_personality")

/datum/personality/nt/loyalist
	savefile_key = "loyalist"
	name = "忠诚型"
	desc = "我相信空间站和中央指挥部，直到最后一刻！"
	pos_gameplay_desc = "Likes company posters and signs"
	mood_event_type = /datum/mood_event/nt_loyalist

/datum/personality/nt/disillusioned
	savefile_key = "disillusioned"
	name = "幻灭型"
	desc = "纳米特拉森已今非昔比。这不是我当初签约时想的那样。"
	neg_gameplay_desc = "Dislikes company posters and signs"
	mood_event_type = /datum/mood_event/nt_disillusioned
