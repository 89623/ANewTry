/obj/machinery/button/door/indestructible/ancient_milsim
	name = "静态非玩家角色区域入口控制"
	desc = "一个特殊的按钮，按下后会删除自身。希望能防止意外或恶意的软锁定；并平衡隐藏在战争迷雾后的遭遇。"
	id = "engagement_control"
	var/obj/item/radio/radio

/obj/machinery/button/door/indestructible/ancient_milsim/Initialize(mapload, ndir, built)
	. = ..()
	radio = new(src)
	radio.keyslot = new /obj/item/encryptionkey/headset_syndicate/cybersun()
	radio.set_listening(FALSE)
	radio.recalculateChannels()
	AddElement(/datum/element/bitrunning_objective)

/obj/machinery/button/door/indestructible/ancient_milsim/screwdriver_act()
	return

/obj/machinery/button/door/indestructible/ancient_milsim/attackby(obj/item/attacking_item, mob/user, list/modifiers, list/attack_modifiers)
	return

/obj/machinery/button/door/indestructible/ancient_milsim/emag_act()
	return

/obj/machinery/button/door/indestructible/ancient_milsim/interact(mob/user)
	. = ..()
	if(.)
		return
	radio.talk_into(src, "Fog is down, prepare for contact.", RADIO_CHANNEL_CYBERSUN)
	qdel(src)

/obj/machinery/door/poddoor/ancient_milsim
	name = "战争迷雾"
	desc = "有史以来'最好'的游戏机制。至少它能保护你，对吧？按下按钮后会删除自身。"
	icon = 'icons/effects/anomalies.dmi'
	icon_state = "pyroclastic"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/door/poddoor/ancient_milsim/Initialize(mapload)
	AddElement(/datum/element/update_icon_blocker)
	return ..()

/obj/machinery/door/poddoor/ancient_milsim/screwdriver_act(mob/living/user, obj/item/tool)
	return

/obj/machinery/door/poddoor/ancient_milsim/crowbar_act(mob/living/user, obj/item/tool)
	return

/obj/machinery/door/poddoor/ancient_milsim/welder_act(mob/living/user, obj/item/tool)
	return

/obj/machinery/door/poddoor/ancient_milsim/open(mob/living/user, obj/item/tool)
	qdel(src)
