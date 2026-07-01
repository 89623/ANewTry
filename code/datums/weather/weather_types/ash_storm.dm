//Ash storms happen frequently on lavaland. They heavily obscure vision, and cause high fire damage to anyone caught outside.
/datum/weather/ash_storm
	name = "灰烬风暴"
	desc = "一场强烈的气象风暴将灰烬从行星表面卷起，并席卷整个区域，对未受保护者造成严重的火焰伤害。"

	telegraph_message = span_boldwarning("风中传来诡异的呻吟。燃烧的灰烬帷幕染黑了地平线。寻找掩体。")
	telegraph_duration = 30 SECONDS
	telegraph_overlay = "light_ash"

	weather_message = span_userdanger("<i>灼热的灰烬云团在你周围翻腾而下！快进去！</i>")
	weather_duration_lower = 1 MINUTES
	weather_duration_upper = 2 MINUTES
	weather_overlay = "ash_storm"

	end_message = span_bolddanger("尖啸的风卷走了最后的灰烬，恢复了往常的低语。现在应该可以安全外出了。")
	end_duration = 30 SECONDS
	end_overlay = "light_ash"

	area_type = /area
	target_trait = ZTRAIT_ASHSTORM
	immunity_type = TRAIT_ASHSTORM_IMMUNE
	probability = 90
	turf_thunder_chance = THUNDER_CHANCE_VERY_RARE
	thunder_color = "#7a0000"

	weather_flags = (WEATHER_MOBS | WEATHER_BAROMETER | WEATHER_THUNDER)

	var/list/weak_sounds = list()
	var/list/strong_sounds = list()

/datum/weather/ash_storm/get_playlist_ref()
	return GLOB.ash_storm_sounds

/datum/weather/ash_storm/telegraph()
	for(var/area/impacted_area as anything in impacted_areas)
		if(impacted_area.outdoors)
			weak_sounds[impacted_area] = /datum/looping_sound/weak_outside_ashstorm
			strong_sounds[impacted_area] = /datum/looping_sound/active_outside_ashstorm
		else
			weak_sounds[impacted_area] = /datum/looping_sound/weak_inside_ashstorm
			strong_sounds[impacted_area] = /datum/looping_sound/active_inside_ashstorm

	//We modify this list instead of setting it to weak/stron sounds in order to preserve things that hold a reference to it
	//It's essentially a playlist for a bunch of components that chose what sound to loop based on the area a player is in
	GLOB.ash_storm_sounds += weak_sounds
	return ..()

/datum/weather/ash_storm/start()
	GLOB.ash_storm_sounds -= weak_sounds
	GLOB.ash_storm_sounds += strong_sounds
	return ..()

/datum/weather/ash_storm/wind_down()
	GLOB.ash_storm_sounds -= strong_sounds
	GLOB.ash_storm_sounds += weak_sounds
	return ..()

/datum/weather/ash_storm/recursive_weather_protection_check(atom/to_check)
	. = ..()
	if(. || !ishuman(to_check))
		return
	var/mob/living/carbon/human/human_to_check = to_check
	if(human_to_check.get_thermal_protection() >= FIRE_IMMUNITY_MAX_TEMP_PROTECT)
		return TRUE

/datum/weather/ash_storm/weather_act_mob(mob/living/victim)
	victim.adjust_fire_loss(4, required_bodytype = BODYTYPE_ORGANIC)
	return ..()

/datum/weather/ash_storm/end()
	GLOB.ash_storm_sounds -= weak_sounds
	for(var/turf/open/misc/asteroid/basalt/basalt as anything in GLOB.dug_up_basalt)
		if(!(basalt.loc in impacted_areas) || !(basalt.z in impacted_z_levels))
			continue
		basalt.refill_dug()
	return ..()

//Emberfalls are the result of an ash storm passing by close to the playable area of lavaland. They have a 10% chance to trigger in place of an ash storm.
/datum/weather/ash_storm/emberfall
	name = "余烬飘落"
	desc = "一场经过的灰烬风暴将这片区域覆盖在无害的余烬中。"

	weather_message = span_notice("温和的余烬像怪诞的雪花一样在你周围飘落。风暴似乎已经过去了……")
	weather_overlay = "light_ash"

	end_message = span_notice("余烬飘落的速度减缓，最终停止。你脚下的玄武岩上又覆盖了一层硬化的煤烟。")
	end_sound = null

	weather_flags = parent_type::weather_flags & ~(WEATHER_MOBS|WEATHER_THUNDER)

	probability = 10
