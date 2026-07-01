GLOBAL_LIST_EMPTY(scream_types)

/datum/scream_type
	var/name
	var/list/male_screamsounds
	var/list/female_screamsounds

/datum/scream_type/none //Why would you want this?
	name = "无尖叫"
	male_screamsounds = null
	female_screamsounds = null

/datum/scream_type/human
	name = "人类尖叫"
	male_screamsounds = list(
		'sound/mobs/humanoids/human/scream/malescream_1.ogg',
		'sound/mobs/humanoids/human/scream/malescream_2.ogg',
		'sound/mobs/humanoids/human/scream/malescream_3.ogg',
		'sound/mobs/humanoids/human/scream/malescream_4.ogg',
		'sound/mobs/humanoids/human/scream/malescream_5.ogg',
		'sound/mobs/humanoids/human/scream/malescream_6.ogg',
	)
	female_screamsounds = list(
		'modular_nova/modules/emotes/sound/voice/scream_f1.ogg',
		'modular_nova/modules/emotes/sound/voice/scream_f2.ogg',
		'modular_nova/modules/emotes/sound/voice/scream_f3.ogg',
	)

/datum/scream_type/human_two
	name = "人类尖叫 2"
	male_screamsounds = list(
		'sound/mobs/humanoids/human/scream/malescream_1.ogg',
		'sound/mobs/humanoids/human/scream/malescream_2.ogg',
		'sound/mobs/humanoids/human/scream/malescream_3.ogg',
		'sound/mobs/humanoids/human/scream/malescream_4.ogg',
		'sound/mobs/humanoids/human/scream/malescream_5.ogg',
		'sound/mobs/humanoids/human/scream/malescream_6.ogg',
	)
	female_screamsounds = list(
		'sound/mobs/humanoids/human/scream/femalescream_1.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_2.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_3.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_4.ogg',
		'sound/mobs/humanoids/human/scream/femalescream_5.ogg',
	)

/datum/scream_type/robotic
	name = "机械尖叫"
	male_screamsounds = list('modular_nova/modules/emotes/sound/voice/scream_silicon.ogg')
	female_screamsounds = null

/datum/scream_type/lizard
	name = "蜥蜴尖叫"
	male_screamsounds = list(
		'sound/mobs/humanoids/lizard/lizard_scream_1.ogg',
		'sound/mobs/humanoids/lizard/lizard_scream_2.ogg',
		'sound/mobs/humanoids/lizard/lizard_scream_3.ogg',
	)
	female_screamsounds = null

/datum/scream_type/lizard2
	name = "蜥蜴尖叫 2"
	male_screamsounds = list('modular_nova/modules/emotes/sound/voice/scream_lizard.ogg')
	female_screamsounds = null

/datum/scream_type/cat
	name = "猫叫"
	male_screamsounds = list('modular_nova/modules/emotes/sound/voice/scream_cat.ogg')
	female_screamsounds = null

/datum/scream_type/moth
	name = "蛾族尖叫"
	male_screamsounds = list('sound/mobs/humanoids/moth/scream_moth.ogg')
	female_screamsounds = null

/datum/scream_type/jelly
	name = "果冻尖叫"
	male_screamsounds = list('modular_nova/modules/emotes/sound/emotes/jelly_scream.ogg')
	female_screamsounds = null

/datum/scream_type/vox
	name = "沃克斯尖叫"
	male_screamsounds = list('modular_nova/modules/emotes/sound/emotes/voxscream.ogg')
	female_screamsounds = null

/datum/scream_type/xeno
	name = "异形尖叫"
	male_screamsounds = list('sound/mobs/non-humanoids/hiss/hiss6.ogg')
	female_screamsounds = null

/datum/scream_type/raptor //This is the Teshari scream ported from CitRP which was a cockatoo scream edited by BlackMajor.
	name = "迅猛龙尖啸"
	male_screamsounds = list('modular_nova/modules/emotes/sound/emotes/raptorscream.ogg')
	female_screamsounds = null

/datum/scream_type/rodent //Ported from Polaris/Virgo.
	name = "啮齿动物尖啸"
	male_screamsounds = list('modular_nova/modules/emotes/sound/emotes/rodentscream.ogg')
	female_screamsounds = null

/datum/scream_type/ethereal
	name = "灵能尖啸"
	male_screamsounds = list(
		'sound/mobs/humanoids/ethereal/ethereal_scream_1.ogg',
		'sound/mobs/humanoids/ethereal/ethereal_scream_2.ogg',
		'sound/mobs/humanoids/ethereal/ethereal_scream_3.ogg')
	female_screamsounds = null

/datum/scream_type/slugcat
	name = "蛞蝓猫尖啸"
	male_screamsounds = list('modular_nova/modules/emotes/sound/voice/scugscream_1.ogg')
	female_screamsounds = null

//DONATOR SCREAMS
/datum/scream_type/zombie
	name = "僵尸尖啸"
	male_screamsounds = list('modular_nova/modules/emotes/sound/emotes/zombie_scream.ogg')
	female_screamsounds = null

/datum/scream_type/monkey
	name = "猴子尖啸"
	male_screamsounds = list('modular_nova/modules/emotes/sound/voice/scream_monkey.ogg')
	female_screamsounds = null

/datum/scream_type/gorilla
	name = "大猩猩尖啸"
	male_screamsounds = list('sound/mobs/non-humanoids/gorilla/gorilla.ogg')
	female_screamsounds = null

/datum/scream_type/skeleton
	name = "骷髅尖啸"
	male_screamsounds = list('modular_nova/modules/emotes/sound/voice/scream_skeleton.ogg')
	female_screamsounds = null

/datum/scream_type/plasmaman
	name = "等离子人尖啸"
	male_screamsounds = list(
		'sound/mobs/humanoids/plasmaman/plasmeme_scream_1.ogg',
		'sound/mobs/humanoids/plasmaman/plasmeme_scream_2.ogg',
		'sound/mobs/humanoids/plasmaman/plasmeme_scream_3.ogg')
	female_screamsounds = null
