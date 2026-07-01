/client/proc/mentor_follow(mob/living/M)
	if(!is_mentor())
		return
	var/orbiting = TRUE
	if(!isobserver(usr))
		mentor_datum.following = M
		usr.reset_perspective(M)
		add_verb(src,/client/proc/mentor_unfollow)
		to_chat(usr, span_info("点击此处或导师选项卡中的<a href='byond://?_src_=mentor;mentor_unfollow=1;[MentorHrefToken(TRUE)]'>\"停止跟随\"</a>按钮来停止跟随[key_name(M)]。"))
		orbiting = FALSE
	else
		var/mob/dead/observer/O = usr
		O.ManualFollow(M)
	to_chat(GLOB.admins, span_mentor(span_prefix("导师：</span> <EM>[key_name(usr)]</EM> 现在正在 [orbiting ? "orbiting" : "following"] <EM>[key_name(M)][key_name(M)][orbiting ? " as a ghost" : ""]。")))
	log_mentor("[key_name(usr)] [orbiting ? "is now orbiting" : "began following"][key_name(M)][orbiting ? " as a ghost" : ""].")

/client/proc/mentor_unfollow()
	set category = "Mentor"
	set name = "停止跟随"
	set desc = "停止跟随目标。"

	if(!is_mentor())
		return
	usr.reset_perspective()
	remove_verb(src,/client/proc/mentor_unfollow)
	to_chat(GLOB.admins, span_mentor(span_prefix("MENTOR:</span> <EM>[key_name(usr)]</EM> 不再跟随 <EM>[key_name(mentor_datum.following)]。")))
	log_mentor("[key_name(usr)] stopped following [key_name(mentor_datum.following)].")
	mentor_datum.following = null
