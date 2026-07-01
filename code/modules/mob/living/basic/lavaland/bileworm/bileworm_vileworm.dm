/mob/living/basic/mining/bileworm/vileworm
	name = "卑鄙虫"
	desc = "卑鄙虫是拉瓦兰这片土地上腐朽环境对自然生物造成影响的产物。"
	icon_state = "vileworm"
	icon_living = "vileworm"
	icon_dead = "vileworm_dead"
	maxHealth = 150
	health = 150

	attack_action_path = /datum/action/cooldown/mob_cooldown/projectile_attack/dir_shots/bileworm/vileworm
	evolve_path = null

/datum/action/cooldown/mob_cooldown/projectile_attack/dir_shots/bileworm/vileworm
	name = "喷出被污染的胆汁"
	desc = "四处喷射着污浊的胆汁。使用完毕后必须重新浸入土中以恢复洁净。"
	projectile_type = /obj/projectile/bileworm_acid/vile

/datum/action/cooldown/mob_cooldown/projectile_attack/dir_shots/bileworm/vileworm/Activate(atom/target_atom)
	StartCooldownSelf(INFINITY)
	attack_sequence(owner, target_atom)
	//faster than unevolved
	StartCooldownOthers(1.5 SECONDS)

/datum/action/cooldown/mob_cooldown/projectile_attack/dir_shots/bileworm/vileworm/attack_sequence(mob/living/firer, atom/target)
	fire_in_directions(firer, target, GLOB.cardinals)
	SLEEP_CHECK_DEATH(0.25 SECONDS, firer)
	fire_in_directions(firer, target, GLOB.diagonals)
	SLEEP_CHECK_DEATH(0.25 SECONDS, firer)
	fire_in_directions(firer, target, GLOB.cardinals)
	// surprise!
	if(prob(25))
		SLEEP_CHECK_DEATH(0.25 SECONDS, firer)
		fire_in_directions(firer, target, GLOB.diagonals)

/obj/projectile/bileworm_acid/vile
	name = "被污染的胆汁"
	icon_state = "vileworm"
