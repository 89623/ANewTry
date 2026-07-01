GLOBAL_LIST_EMPTY(laugh_types)

/datum/laugh_type
	var/name
	var/list/male_laughsounds
	var/list/female_laughsounds

/datum/laugh_type/none //Why would you want this?
	name = "无笑声"
	male_laughsounds = null
	female_laughsounds = null

/datum/laugh_type/human
	name = "人类笑声"
	male_laughsounds = list('sound/mobs/humanoids/human/laugh/manlaugh1.ogg',,
						'sound/mobs/humanoids/human/laugh/manlaugh2.ogg',)
	female_laughsounds = list('modular_nova/modules/emotes/sound/emotes/female/female_giggle_1.ogg',
					'modular_nova/modules/emotes/sound/emotes/female/female_giggle_2.ogg')

/datum/laugh_type/felinid
	name = "猫族笑声"
	male_laughsounds = list('modular_nova/modules/emotes/sound/emotes/nyahaha1.ogg',
			'modular_nova/modules/emotes/sound/emotes/nyahaha2.ogg',
			'modular_nova/modules/emotes/sound/emotes/nyaha.ogg',
			'modular_nova/modules/emotes/sound/emotes/nyahehe.ogg')
	female_laughsounds = null

/datum/laugh_type/moth
	name = "昆虫笑声（蛾族）"
	male_laughsounds = list('sound/mobs/humanoids/moth/moth_laugh1.ogg')
	female_laughsounds = null

/datum/laugh_type/lizard
	name = "蜥蜴笑声"
	male_laughsounds = list('sound/mobs/humanoids/lizard/lizard_laugh1.ogg')
	female_laughsounds = null

/datum/laugh_type/skrell
	name = "斯克莱尔笑声"
	male_laughsounds = list(
		'modular_nova/modules/emotes/sound/emotes/skrelllaugh1.ogg',
		'modular_nova/modules/emotes/sound/emotes/skrelllaugh2.ogg',
	)
	female_laughsounds = null

/datum/laugh_type/slugcat
	name = "蛞蝓猫笑声"
	male_laughsounds = list('modular_nova/modules/emotes/sound/voice/scuglaugh_1.ogg')
	female_laughsounds = null
