/datum/antagonist/santa
	name = "\improper 圣诞老人"
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	show_to_ghosts = TRUE
	suicide_cry = "FOR CHRISTMAS!!"

/datum/antagonist/santa/on_gain()
	. = ..()
	give_equipment()
	give_objective()

	owner.add_traits(list(TRAIT_CANNOT_OPEN_PRESENTS, TRAIT_PRESENT_VISION), TRAIT_SANTA)

/datum/antagonist/santa/greet()
	. = ..()
	to_chat(owner, span_bolddanger("你的目标是为这座空间站上的人们带来欢乐。你有一个魔法袋，只要拥有它就能不断生成礼物！你可以检查礼物来窥探内部，确保将合适的礼物送给合适的人。"))

/datum/antagonist/santa/proc/give_equipment()
	var/mob/living/carbon/human/H = owner.current
	if(istype(H))
		H.equipOutfit(/datum/outfit/santa)
		H.dna.update_dna_identity()

	var/datum/action/cooldown/spell/teleport/area_teleport/wizard/santa/teleport = new(owner)
	teleport.Grant(H)

/datum/antagonist/santa/proc/give_objective()
	var/datum/objective/santa_objective = new()
	santa_objective.explanation_text = "Bring joy and presents to the station!"
	santa_objective.completed = TRUE //lets cut our santas some slack.
	santa_objective.owner = owner
	objectives |= santa_objective
