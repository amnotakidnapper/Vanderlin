/datum/job/gatemaster
	title = "Gatemaster"
	flag = GATEMASTER
	department_flag = GARRISON
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar"
	)
	allowed_races = list("Humen", "Half-Elf", "Elf", "Dwarf", "Aasimar")
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_IMMORTAL)
	tutorial = "Tales speak of the Gatemaster's legendary ability to stand still at a gate and ask people questions."
	display_order = JDO_GATEMASTER
	whitelist_req = FALSE
	bypass_lastclass = TRUE

	outfit = /datum/outfit/job/gatemaster	//Default outfit.
	advclass_cat_rolls = list(CTAG_GATEMASTER = 20)	//Handles class selection.
	give_bank_account = 30
	min_pq = 10

	cmode_music = 'sound/music/cmode/garrison/CombatManAtArms.ogg'

/datum/job/gatemaster/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/surcoat/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "gatemaster jupon ([index])"

/datum/outfit/job/gatemaster
	job_bitflag = BITFLAG_GARRISON

/datum/outfit/job/gatemaster/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/helmet/townwatch/alt
	neck = /obj/item/clothing/neck/gorget
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	shirt = /obj/item/clothing/armor/gambeson/heavy
	pants = /obj/item/clothing/pants/trou/leather/guard
	wrists = /obj/item/clothing/wrists/bracers/leather
	head = /obj/item/clothing/head/helmet/townwatch/alt
	belt = /obj/item/storage/belt/leather/black
	backl = /obj/item/storage/backpack/satchel/black
	backpack_contents = list(/obj/item/weapon/knife/dagger/steel/special = 1, /obj/item/rope/chain = 1)

/datum/advclass/gatemaster/gatemaster_whip
	name = "Gatemaster "
	tutorial = "Metal chimes in your hands, their skin rough from those heavy chains you pull. \
	Day by day, chains pass through your palms. \
	Day by day, the chains coldness feels more familar. \
	Day by day, trespassers hear your chain whip rattling."
	outfit = /datum/outfit/job/gatemaster/whip

	category_tags = list(CTAG_GATEMASTER)

/datum/outfit/job/gatemaster/whip/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/gorget
	armor = /obj/item/clothing/armor/medium/scale
	gloves = /obj/item/clothing/gloves/chain
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather/black
	beltr = /obj/item/weapon/whip/chain
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.change_stat(STATKEY_STR, 1)
		H.change_stat(STATKEY_END, 2)
		H.change_stat(STATKEY_PER, -1)
		H.verbs |= /mob/proc/haltyell
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

/datum/advclass/gatemaster/gatemaster_mace
	name = "Gatemaster Mace"
	tutorial = "Years of work let your body grow acustome to the job. Gorwing large, fitting to your chair. \
	Even if you may be slower, but you dont need to be fast. \
	They are the ones that need to get past you after all. \
	Let the try to break through your armor, and let them learn how easy skulls break under cold hard steel."
	outfit = /datum/outfit/job/gatemaster/mace
	category_tags = list(CTAG_GATEMASTER)

/datum/outfit/job/gatemaster/mace/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/armor/medium/scale
	neck = /obj/item/clothing/neck/gorget
	gloves = /obj/item/clothing/gloves/chain
	shoes = /obj/item/clothing/shoes/boots/armor/light
	beltr = /obj/item/weapon/mace/steel
	backr = /obj/item/weapon/shield/heater
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.change_stat(STATKEY_STR, 1)
		H.change_stat(STATKEY_CON, 2)
		H.change_stat(STATKEY_END, -1)
		H.change_stat(STATKEY_SPD, -1)
		ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
		H.verbs |= /mob/proc/haltyell

/datum/advclass/gatemaster/gatemaster_bow
	name = "Gatemaster Bow"
	tutorial = "Years of work let your body grow acustome to the job. Gorwing large, fitting to your chair. \
	Even if you may be slower, but you dont need to be fast. \
	They ae the ones that need to get past you after all. \
	Let the try to break through your armor, and let them learn how easy skulls break under cold hard steel."
	outfit = /datum/outfit/job/gatemaster/bow

	category_tags = list(CTAG_GATEMASTER)

/datum/outfit/job/gatemaster/bow/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/helmet/kettle
	cloak = /obj/item/clothing/cloak/stabard/guard
	armor = /obj/item/clothing/armor/leather/hide
	shirt = /obj/item/clothing/armor/gambeson/heavy
	beltr = /obj/item/weapon/mace/cudgel
	neck = /obj/item/clothing/neck/chaincoif/iron
	gloves = /obj/item/clothing/gloves/leather
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.change_stat(STATKEY_STR, 1)
		H.change_stat(STATKEY_PER, 2)
		H.change_stat(STATKEY_END, -2)
		H.change_stat(STATKEY_SPD, 1)
		H.verbs |= /mob/proc/haltyell
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
		var/weapontypec = pickweight(list("Bow" = 4, "Crossbow" = 6)) // Rolls for either a bow or a Crossbow
		switch(weapontypec)
			if("Bow")
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/long
				backr = /obj/item/ammo_holder/quiver/arrows
			if("Crossbow")
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
				backr = /obj/item/ammo_holder/quiver/bolts
