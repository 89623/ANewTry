GLOBAL_DATUM_INIT(temporary_flavor_text_vis, /obj/effect/overlay/indicator/temporary_flavor_text, new)

/obj/effect/overlay/indicator/temporary_flavor_text
	icon = 'modular_nova/modules/indicators/icons/temporary_flavor_text_indicator.dmi'
	icon_state = "flavor"

/mob/living/verb/set_temporary_flavor()
	set category = "IC"
	set name = "设置临时描述文本"
	set desc = "允许你设置一段临时的描述文本。"

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("你现在无法设置临时描述文本……"))
		return

	var/msg = tgui_input_text(usr, "设置你‘观察’动词中的临时风味文本。这用于描述别人观察你的角色时能看出的信息。", "临时风味文本", temporary_flavor_text, max_length = MAX_FLAVOR_LEN, multiline = TRUE)
	if(msg == null)
		return

	// Turn empty input into no flavor text
	var/result = msg || null
	temporary_flavor_text = result
	if(temporary_flavor_text)
		vis_contents |= GLOB.temporary_flavor_text_vis
	else
		vis_contents -= GLOB.temporary_flavor_text_vis

