/obj/item/pizzavoucher
	name = "披萨券"
	desc = "一张口袋大小的塑料片，中间有个按钮。上面的字迹似乎已经褪色。"
	icon = 'modular_nova/modules/pizza_voucher/icons/pizza_voucher.dmi'
	icon_state = "pizza_voucher"
	///Was it used already?
	var/spent = FALSE
	///Whether we announce our presence loudly or not.
	var/special_delivery = FALSE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/pizzavoucher/Initialize(mapload)
	. = ..()
	var/list/descstrings = list("24/7 PIZZA PIE HEAVEN",
		"WE ALWAYS DELIVER!",
		"24-HOUR PIZZA PIE POWER!",
		"TOMATO SAUCE, CHEESE, WE'VE BOTH BOTH OF THESE!",
		"COOKED WITH LOVE INSIDE A BIG OVEN!",
		"WHEN YOU NEED A SLICE OF JOY IN YOUR LIFE!",
		"WHEN YOU NEED A DISK OF OVEN BAKED BLISS!",
		"EVERY TIME YOU DREAM OF CIRCULAR CUISINE!",
		"WE ALWAYS DELIVER! WE ALWAYS DELIVER! WE ALWAYS DELIVER!",
		)
	desc = "一张口袋大小的塑料片，中间有个按钮。背面写着“[pick(descstrings)]”。"

/obj/item/pizzavoucher/attack_self(mob/user)
	. = ..()
	if(spent)
		to_chat(user, span_warning("[src] 已使用！"))
		return FALSE
	user.visible_message(span_notice("[user] 按下了 [src] 上的按钮！"))
	desc = desc + "这张看起来已经用过了。"
	spent = TRUE
	user.visible_message(span_notice("一个小小的蓝空裂隙在 [user] 头顶打开，吐出了一个披萨盒！"),
		span_notice("一个小小的蓝空裂隙在你头顶打开，吐出了一个披萨盒！"),
		span_notice("你听到一阵呼啸声，接着是砰的一声。"),
	)
	if(special_delivery)
		priority_announce(
			text = "SPECIAL DELIVERY PIZZA ORDER #[rand(1000,9999)]-[rand(100,999)] HAS BEEN RECEIVED. SHIPMENT DISPATCHED \
				VIA EXTRA-POWERFUL BALLISTIC LAUNCHERS FOR IMMEDIATE DELIVERY! THANK YOU AND ENJOY YOUR PIZZA!",
			title = "我们使命必达！",
			sound = SSstation.announcer.get_rand_report_sound(),
			has_important_message = TRUE,
		)
	podspawn(list(
	"target" = get_turf(src),
	"style" = /datum/pod_style/seethrough,
	"spawn" = pick(\
		/obj/item/pizzabox/meat, \
		/obj/item/pizzabox/margherita, \
		/obj/item/pizzabox/vegetable, \
		/obj/item/pizzabox/mushroom, \
		/obj/item/pizzabox/meat, \
		/obj/item/pizzabox/sassysage, \
		/obj/item/pizzabox/pineapple, \
		),
	))

/obj/item/pizzavoucher/emag_act(mob/user)
	if(spent)
		to_chat(user, span_warning("[src] 已使用！"))
		return FALSE
	if(special_delivery)
		to_chat(user, span_warning("[src] 已处于特殊配送模式！"))
		return FALSE
	to_chat(user, span_warning("你激活了[src]上的特殊配送协议！"))
	special_delivery = TRUE
	return TRUE

/obj/item/pizzavoucher/free
	name = "免费披萨券"

/obj/item/pizzavoucher/free/Initialize(mapload)
	. = ..()
	desc += "<br> And it's free! Wow!"
