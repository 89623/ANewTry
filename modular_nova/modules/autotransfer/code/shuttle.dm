/datum/controller/subsystem/shuttle
	var/endvote_passed = FALSE

/datum/controller/subsystem/shuttle/proc/autoEnd()
	if(EMERGENCY_IDLE_OR_RECALLED)
		SSshuttle.emergency.request(silent = TRUE)
		priority_announce("轮班已结束，穿梭机已呼叫。[SSsecurity_level.get_current_level_as_number() == SEC_LEVEL_RED ? "Red Alert state confirmed: Dispatching priority shuttle. " : "" ]它将在 [emergency.timeLeft(600)] 分钟后抵达。", null, ANNOUNCER_SHUTTLECALLED, "优先", color_override = "橙色")
		log_game("Round end vote passed. Shuttle has been auto-called.")
		message_admins("Round end vote passed. Shuttle has been auto-called.")
	emergency_no_recall = TRUE
	endvote_passed = TRUE
	SSevents.can_fire = FALSE // we're going home
