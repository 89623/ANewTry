/obj/item/food/canned/tuna
	name = "金枪鱼罐头"
	desc = "你可以给钢琴调音，但你不能给金枪鱼调音。"
	icon = 'modular_nova/master_files/icons/obj/food/irnbru.dmi'
	icon_state = "tunacan"
	trash_type = /obj/item/trash/can/food/tuna
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4, 
		/datum/reagent/consumable/nutriment/protein = 9, 
		/datum/reagent/consumable/nutriment/vitamin = 6
	)
	tastes = list("tuna" = 1)
	foodtypes = SEAFOOD

/obj/item/trash/can/food/tuna
	name = "金枪鱼罐头"
	icon = 'modular_nova/master_files/icons/obj/food/irnbru.dmi'
	icon_state = "tunacan_empty"
