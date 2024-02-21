//Not to be confused with /obj/item/reagent_containers/food/drinks/bottle


/obj/item/reagent_containers/glass/bottle
	name = "bottle"
	desc = "A small bottle."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "round_bottle"
	item_state = "atoxinbottle"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25,30)
	container_type = OPENCONTAINER
	volume = 30

/obj/item/reagent_containers/glass/bottle/on_reagent_change()
	update_icon(UPDATE_OVERLAYS)


/obj/item/reagent_containers/glass/bottle/update_overlays()
	. = ..()
	underlays.Cut()
	if(reagents.total_volume)
		var/image/filling = image('icons/obj/reagentfillings.dmi', src, "[icon_state]10")

		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if(0 to 24)
				filling.icon_state = "[icon_state]10"
			if(25 to 49)
				filling.icon_state = "[icon_state]25"
			if(50 to 74)
				filling.icon_state = "[icon_state]50"
			if(75 to 90)
				filling.icon_state = "[icon_state]75"
			if(91 to INFINITY)
				filling.icon_state = "[icon_state]100"

		filling.icon += mix_color_from_reagents(reagents.reagent_list)
		underlays += filling

	if(!is_open_container())
		. += "lid_[icon_state]"


/obj/item/reagent_containers/glass/bottle/decompile_act(obj/item/matter_decompiler/C, mob/user)
	if(!reagents.total_volume)
		C.stored_comms["glass"] += 3
		qdel(src)
		return TRUE
	return ..()

/obj/item/reagent_containers/glass/bottle/toxin
	name = "toxin bottle"
	desc = "A small bottle containing toxic compounds."
	icon_state = "small_bottle"
	list_reagents = list("toxin" = 30)

/obj/item/reagent_containers/glass/bottle/atropine
	name = "atropine bottle"
	desc = "A small bottle containing atropine, used for cardiac emergencies."
	icon_state = "small_bottle"
	list_reagents = list("atropine" = 30)

/obj/item/reagent_containers/glass/bottle/saline
	name = "saline-glucose bottle"
	desc = "A small bottle containing saline-glucose solution."
	icon_state = "small_bottle"
	list_reagents = list("salglu_solution" = 30)

/obj/item/reagent_containers/glass/bottle/salicylic
	name = "salicylic acid bottle"
	desc = "A small bottle containing medicine for pain and fevers."
	icon_state = "small_bottle"
	list_reagents = list("sal_acid" = 30)

/obj/item/reagent_containers/glass/bottle/cyanide
	name = "cyanide bottle"
	desc = "A small bottle of cyanide. Bitter almonds?"
	icon_state = "small_bottle"
	list_reagents = list("cyanide" = 30)

/obj/item/reagent_containers/glass/bottle/mutagen
	name = "unstable mutagen bottle"
	desc = "A small bottle of unstable mutagen. Randomly changes the DNA structure of whoever comes in contact."
	icon_state = "bottle"
	list_reagents = list("mutagen" = 30)

/obj/item/reagent_containers/glass/bottle/ammonia
	name = "ammonia bottle"
	desc = "A small bottle."
	icon_state = "bottle"
	list_reagents = list("ammonia" = 30)

/obj/item/reagent_containers/glass/bottle/diethylamine
	name = "diethylamine bottle"
	desc = "A small bottle."
	icon_state = "round_bottle"
	list_reagents = list("diethylamine" = 30)

/obj/item/reagent_containers/glass/bottle/facid
	name = "Fluorosulfuric Acid Bottle"
	desc = "A small bottle. Contains a small amount of Fluorosulfuric Acid"
	icon_state = "round_bottle"
	list_reagents = list("facid" = 30)

/obj/item/reagent_containers/glass/bottle/adminordrazine
	name = "Adminordrazine Bottle"
	desc = "A small bottle. Contains the liquid essence of the gods."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "holyflask"
	list_reagents = list("adminordrazine" = 30)

/obj/item/reagent_containers/glass/bottle/capsaicin
	name = "Capsaicin Bottle"
	desc = "A small bottle. Contains hot sauce."
	icon_state = "round_bottle"
	list_reagents = list("capsaicin" = 30)

/obj/item/reagent_containers/glass/bottle/frostoil
	name = "Frost Oil Bottle"
	desc = "A small bottle. Contains cold sauce."
	icon_state = "round_bottle"
	list_reagents = list("frostoil" = 30)

/obj/item/reagent_containers/glass/bottle/morphine
	name = "Morphine Bottle"
	desc = "A small bottle of morphine, a powerful painkiller."
	icon_state = "bottle"
	list_reagents = list("morphine" = 30)

/obj/item/reagent_containers/glass/bottle/ether
	name = "Ether Bottle"
	desc = "A small bottle of an ether, a strong anesthetic and sedative."
	icon_state = "round_bottle"
	list_reagents = list("ether" = 30)

/obj/item/reagent_containers/glass/bottle/charcoal
	name = "Charcoal Bottle"
	desc = "A small bottle. Contains charcoal."
	icon_state = "wide_bottle"
	list_reagents = list("charcoal" = 30)

/obj/item/reagent_containers/glass/bottle/epinephrine
	name = "Epinephrine Bottle"
	desc = "A small bottle. Contains epinephrine - used to stabilize patients."
	icon_state = "round_bottle"
	list_reagents = list("epinephrine" = 30)

/obj/item/reagent_containers/glass/bottle/pancuronium
	name = "Pancuronium Bottle"
	desc = "A small bottle of pancuronium."
	icon_state = "round_bottle"
	list_reagents = list("pancuronium" = 30)

/obj/item/reagent_containers/glass/bottle/sulfonal
	name = "Sulfonal Bottle"
	desc = "A small bottle of Sulfonal."
	icon_state = "round_bottle"
	list_reagents = list("sulfonal" = 30)

//Reagent bottles

/obj/item/reagent_containers/glass/bottle/reagent
	name = "Reagent Bottle"
	desc = "A bottle for storing reagents"
	icon_state = "reagent_bottle"
	volume = 50

/obj/item/reagent_containers/glass/bottle/reagent/oil
	name = "Oil Bottle"
	desc = "A reagent bottle. Contains oil."
	list_reagents = list("oil" = 50)
	pixel_x = -4
	pixel_y = 6

/obj/item/reagent_containers/glass/bottle/reagent/phenol
	name = "Phenol Bottle"
	desc = "A reagent bottle. Contains phenol."
	list_reagents = list("phenol" = 50)
	pixel_x = 6
	pixel_y = 6

/obj/item/reagent_containers/glass/bottle/reagent/acetone
	name = "Acetone Bottle"
	desc = "A reagent bottle. Contains acetone."
	list_reagents = list("acetone" = 50)
	pixel_x = -4

/obj/item/reagent_containers/glass/bottle/reagent/ammonia
	name = "Ammonia Bottle"
	desc = "A reagent bottle. Contains ammonia."
	list_reagents = list("ammonia" = 50)
	pixel_x = 6

/obj/item/reagent_containers/glass/bottle/reagent/diethylamine
	name = "Diethylamine Bottle"
	desc = "A reagent bottle. Contains diethylamine."
	list_reagents = list("diethylamine" = 50)
	pixel_x = -4
	pixel_y = -6

/obj/item/reagent_containers/glass/bottle/reagent/acid
	name = "Acid Bottle"
	desc = "A reagent bottle. Contains sulfuric acid."
	list_reagents = list("sacid" = 50)
	pixel_x = 6
	pixel_y = -6

/obj/item/reagent_containers/glass/bottle/reagent/formaldehyde
	name = "Formaldehyde Bottle"
	desc = "A reagent bottle. Contains formaldehyde."
	list_reagents = list("formaldehyde" = 50)

/obj/item/reagent_containers/glass/bottle/reagent/synaptizine
	name = "Synaptizine Bottle"
	desc = "A reagent bottle. Contains synaptizine."
	list_reagents = list("synaptizine" = 50)

/obj/item/reagent_containers/glass/bottle/reagent/morphine
	name = "Morphine Bottle"
	desc = "A reagent bottle. Contains morphine."
	list_reagents = list("morphine" = 50)

/obj/item/reagent_containers/glass/bottle/reagent/insulin
	name = "Insulin Bottle"
	desc = "A reagent bottle. Contains insulin."
	list_reagents = list("insulin" = 50)

/obj/item/reagent_containers/glass/bottle/reagent/hairgrownium
	name = "Hair Grow Gel"
	desc = "A bottle full of a stimulative hair growth formula"
	list_reagents = list("hairgrownium" = 50)

/obj/item/reagent_containers/glass/bottle/reagent/hair_dye
	name = "Quantum Hair Dye Bottle"
	desc = "A bottle of the ever-changing quantum hair dye."
	list_reagents = list("hair_dye" = 50)

/obj/item/reagent_containers/glass/bottle/reagent/omnizine
	name = "Omnizine Bottle"
	desc = "A reagent bottle. Contains Omnizine."
	list_reagents = list("omnizine" = 50)

/obj/item/reagent_containers/glass/bottle/reagent/strange_reagent
	name = "Strange Reagent Bottle"
	desc = "A bottle of glowing fluid."
	list_reagents = list("strange_reagent" = 30)

////////////////////Traitor Poison Bottle//////////////////////////////

/obj/item/reagent_containers/glass/bottle/traitor
	desc = "It has a small skull and crossbones on it. Uh-oh!"
	possible_transfer_amounts = list(5,10,15,25,30,40)
	volume = 40

/obj/item/reagent_containers/glass/bottle/traitor/Initialize(mapload)
	reagents.add_reagent(pick_list("chemistry_tools.json", "traitor_poison_bottle"), 40)
	. = ..()

/obj/item/reagent_containers/glass/bottle/plasma
	name = "plasma dust bottle"
	desc = "A small bottle of plasma in dust form. Extremely toxic and reacts with micro-organisms inside blood."
	icon_state = "wide_bottle"
	list_reagents = list("plasma_dust" = 30)

/obj/item/reagent_containers/glass/bottle/diphenhydramine
	name = "diphenhydramine bottle"
	desc = "A small bottle of diphenhydramine."
	icon_state = "round_bottle"
	list_reagents = list("diphenhydramine" = 30)

/obj/item/reagent_containers/glass/bottle/oculine
	name = "oculine bottle"
	desc = "A small bottle of combined eye and ear medication."
	icon_state = "round_bottle"
	list_reagents = list("oculine" = 30)

/obj/item/reagent_containers/glass/bottle/potassium_iodide
	name = "potassium iodide bottle"
	desc = "A small bottle of potassium iodide."
	icon_state = "wide_bottle"
	list_reagents = list("potass_iodide" = 30)

/obj/item/reagent_containers/glass/bottle/cold
	name = "Rhinovirus culture bottle"
	desc = "A small bottle. Contains XY-rhinovirus culture in synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/cold

/obj/item/reagent_containers/glass/bottle/flu
	name = "Flu virion culture bottle"
	desc = "A small bottle. Contains H13N1 flu virion culture in synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/flu

/obj/item/reagent_containers/glass/bottle/sneezing
	name = "Sneezing symptom bottle"
	desc = "A small bottle. Contains a simple advanced virus in synthblood medium that makes infected sneeze."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/sneezing

/obj/item/reagent_containers/glass/bottle/cough
	name = "Cough symptom bottle"
	desc = "A small bottle. Contains a simple advanced virus in synthblood medium that makes infected cough."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/cough

/obj/item/reagent_containers/glass/bottle/epiglottis_virion
	name = "Epiglottis virion culture bottle"
	desc = "A small bottle. Contains Epiglottis virion culture in synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/voice_change

/obj/item/reagent_containers/glass/bottle/liver_enhance_virion
	name = "Liver enhancement virion culture bottle"
	desc = "A small bottle. Contains liver enhancement virion culture in synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/heal

/obj/item/reagent_containers/glass/bottle/hullucigen_virion
	name = "Hullucigen virion culture bottle"
	desc = "A small bottle. Contains hullucigen virion culture in synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/hullucigen

/obj/item/reagent_containers/glass/bottle/pierrot_throat
	name = "Pierrot's Throat culture bottle"
	desc = "A small bottle. Contains H0NI<42 virion culture in synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/pierrot_throat

/obj/item/reagent_containers/glass/bottle/mind_restoration
	name = "Reality Purifier culture bottle"
	desc = "A small bottle. Contains Reality Purifier culture in synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/mind_restoration

/obj/item/reagent_containers/glass/bottle/advanced_regeneration
	name = "Advanced Neogenesis culture bottle"
	desc = "A small bottle. Contains Advanced Neogenesis culture in synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/advanced_regeneration

/obj/item/reagent_containers/glass/bottle/super_regeneration
	name = "Super Neogenesis culture bottle"
	desc = "A small bottle. Contains Advanced Neogenesis culture in synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/super_regeneration


/obj/item/reagent_containers/glass/bottle/stealth_necrosis
	name = "Necroeyrosis culture bottle"
	desc = "A small bottle. Contains Necroeyrosis culture in synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/stealth_necrosis

/obj/item/reagent_containers/glass/bottle/pre_kingstons
	name = "Neverlasting Stranger culture bottle"
	desc = "A small bottle. Contains Neverlasting Stranger culture in synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/pre_kingstons

/obj/item/reagent_containers/glass/bottle/love
	name = "love"
	desc = "love"
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/love

/obj/item/reagent_containers/glass/bottle/aggression
	name = "aggression"
	desc = "aggression"
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/aggression

/obj/item/reagent_containers/glass/bottle/obsession
	name = "obsession"
	desc = "obsession"
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/obsession

/obj/item/reagent_containers/glass/bottle/confusion
	name = "confusion"
	desc = "confusion"
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/confusion

/obj/item/reagent_containers/glass/bottle/bones
	name = "bones"
	desc = "bones"
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/bones

/obj/item/reagent_containers/glass/bottle/limb_throw
	name = "limb_throw"
	desc = "limb_throw"
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/limb_throw

/obj/item/reagent_containers/glass/bottle/laugh
	name = "laugh"
	desc = "laugh"
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/laugh

/obj/item/reagent_containers/glass/bottle/moan
	name = "moan"
	desc = "moan"
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/moan

/obj/item/reagent_containers/glass/bottle/infection
	name = "infection"
	desc = "infection"
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/infection

/obj/item/reagent_containers/glass/bottle/loyalty
	name = "loyalty"
	desc = "loyalty"
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/loyalty

/obj/item/reagent_containers/glass/bottle/pre_loyalty
	name = "pre_loyalty"
	desc = "pre_loyalty"
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/pre_loyalty

/obj/item/reagent_containers/glass/bottle/retrovirus
	name = "Retrovirus culture bottle"
	desc = "A small bottle. Contains a retrovirus culture in a synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/dna_retrovirus

/obj/item/reagent_containers/glass/bottle/gbs
	name = "GBS culture bottle"
	desc = "A small bottle. Contains Gravitokinetic Bipotential SADS+ culture in synthblood medium."//Or simply - General BullShit
	icon_state = "round_bottle"
	amount_per_transfer_from_this = 5
	spawned_disease = /datum/disease/virus/gbs

/obj/item/reagent_containers/glass/bottle/fake_gbs
	name = "GBS culture bottle"
	desc = "A small bottle. Contains Gravitokinetic Bipotential SADS- culture in synthblood medium."//Or simply - General BullShit
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/fake_gbs

/obj/item/reagent_containers/glass/bottle/brainrot
	name = "Brainrot culture bottle"
	desc = "A small bottle. Contains Cryptococcus Cosmosis culture in synthblood medium."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/brainrot

/obj/item/reagent_containers/glass/bottle/magnitis
	name = "Magnitis culture bottle"
	desc = "A small bottle. Contains a small dosage of Fukkos Miracos."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/magnitis

/obj/item/reagent_containers/glass/bottle/wizarditis
	name = "Wizarditis culture bottle"
	desc = "A small bottle. Contains a sample of Rincewindus Vulgaris."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/wizarditis

/obj/item/reagent_containers/glass/bottle/anxiety
	name = "Severe Anxiety culture bottle"
	desc = "A small bottle. Contains a sample of Lepidopticides."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/anxiety

/obj/item/reagent_containers/glass/bottle/beesease
	name = "Beesease culture bottle"
	desc = "A small bottle. Contains a sample of invasive Apidae."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/beesease

/obj/item/reagent_containers/glass/bottle/fluspanish
	name = "Spanish flu culture bottle"
	desc = "A small bottle. Contains a sample of Inquisitius."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/fluspanish

/obj/item/reagent_containers/glass/bottle/tuberculosis
	name = "Fungal Tuberculosis culture bottle"
	desc = "A small bottle. Contains a sample of Fungal Tubercle bacillus."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/tuberculosis

/obj/item/reagent_containers/glass/bottle/regeneration
	name = "Regeneration culture bottle"
	desc = "A small bottle. Contains a sample of a virus that heals toxin damage."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/heal

/obj/item/reagent_containers/glass/bottle/sensory_restoration
	name = "Sensory Restoration culture bottle"
	desc = "A small bottle. Contains a sample of a virus that heals sensory damage."
	icon_state = "round_bottle"
	spawned_disease = /datum/disease/virus/advance/preset/sensory_restoration

/obj/item/reagent_containers/glass/bottle/tuberculosiscure
	name = "BVAK bottle"
	desc = "A small bottle containing Bio Virus Antidote Kit."
	icon_state = "wide_bottle"
	list_reagents = list("atropine" = 5, "epinephrine" = 5, "salbutamol" = 10, "spaceacillin" = 10)

/obj/item/reagent_containers/glass/bottle/monkeylangue
	name = "bottle of monkey language potion"
	desc = "A bottle of monkey language potion."
	icon_state = "round_bottle"
	list_reagents = list("monkeylanguage" = 30)
