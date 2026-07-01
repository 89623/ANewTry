/datum/verbs/menu/Preferences/verb/open_character_preferences()
	set category = "OOC"
	set name = "打开角色预设"
	set desc = "打开角色预设"

	var/datum/preferences/preferences = usr?.client?.prefs
	if (!preferences)
		return

	preferences.current_window = PREFERENCE_TAB_CHARACTER_PREFERENCES
	preferences.update_static_data(usr)
	preferences.ui_interact(usr)

/datum/verbs/menu/Preferences/verb/open_game_preferences()
	set category = "OOC"
	set name = "打开游戏首选项"
	set desc = "打开游戏首选项"

	var/datum/preferences/preferences = usr?.client?.prefs
	if (!preferences)
		return

	preferences.current_window = PREFERENCE_TAB_GAME_PREFERENCES
	preferences.update_static_data(usr)
	preferences.ui_interact(usr)

