/mob/living/update_blind_effects()
	if(has_vision(information_only = TRUE))
		clear_fullscreen("blind")
		clear_alert("blind")
		return FALSE

	overlay_fullscreen("blind", /obj/screen/fullscreen/blind)
	throw_alert("blind", /obj/screen/alert/blind)
	return TRUE


/mob/living/update_blurry_effects()
	var/atom/movable/plane_master_controller/game_plane_master_controller = hud_used?.plane_master_controllers[PLANE_MASTERS_GAME]
	if(!game_plane_master_controller)
		return
	if(AmountEyeBlurry())
		game_plane_master_controller.add_filter("eye_blur", 1, gauss_blur_filter(clamp(AmountEyeBlurry() * EYE_BLUR_TO_FILTER_SIZE_MULTIPLIER, 0.6, MAX_EYE_BLURRY_FILTER_SIZE)))
	else
		game_plane_master_controller.remove_filter("eye_blur")


/mob/living/update_druggy_effects()
	if(AmountDruggy())
		overlay_fullscreen("high", /obj/screen/fullscreen/high)
		throw_alert("high", /obj/screen/alert/high)
		sound_environment_override = SOUND_ENVIRONMENT_DRUGGED
	else
		clear_fullscreen("high")
		clear_alert("high")
		sound_environment_override = SOUND_ENVIRONMENT_NONE

/mob/living/update_nearsighted_effects()
	if(NEARSIGHTED in mutations)
		overlay_fullscreen("nearsighted", /obj/screen/fullscreen/impaired, 1)
	else
		clear_fullscreen("nearsighted")

/mob/living/update_sleeping_effects(no_alert = FALSE)
	if(IsSleeping())
		if(!no_alert)
			throw_alert("asleep", /obj/screen/alert/asleep)
	else
		clear_alert("asleep")

// Querying status of the mob

// Whether the mob can hear things
/mob/living/can_hear()
	return !HAS_TRAIT(src, TRAIT_DEAF)

// Whether the mob is able to see
// `information_only` is for stuff that's purely informational - like blindness overlays
// This flag exists because certain things like angel statues expect this to be false for dead people
/mob/living/has_vision(information_only = FALSE)
	return (information_only && stat == DEAD) || !(AmountBlinded() || (BLINDNESS in mutations) || stat || get_total_tint() >= 3)

// Whether the mob is capable of talking
/mob/living/can_speak()
	if(HAS_TRAIT(src, TRAIT_MUTE))
		return FALSE
	if(is_muzzled())
		var/obj/item/clothing/mask/muzzle/M = wear_mask
		if(M.mute >= MUZZLE_MUTE_MUFFLE)
			return FALSE
	return TRUE

// Whether the mob is capable of standing or not
/mob/living/proc/can_stand()
	return !(IsWeakened() || IsParalyzed() || stat || HAS_TRAIT(src, TRAIT_FAKEDEATH))

// Whether the mob is capable of actions or not
/mob/living/incapacitated(ignore_restraints = FALSE, ignore_grab = FALSE, ignore_lying = FALSE, list/extra_checks = list(), use_default_checks = TRUE)
	// By default, checks for weakness and stunned get added to the extra_checks list.
	// Setting `use_default_checks` to FALSE means that you don't want it checking for these statuses or you are supplying your own checks.
	if(use_default_checks)
		extra_checks += CALLBACK(src, TYPE_PROC_REF(/mob/living, IsWeakened))
		extra_checks += CALLBACK(src, TYPE_PROC_REF(/mob/living, IsStunned))

	if(stat || IsParalyzed() || (!ignore_restraints && restrained()) || (!ignore_lying && lying) || check_for_true_callbacks(extra_checks))
		return TRUE

//Updates canmove, lying and icons. Could perhaps do with a rename but I can't think of anything to describe it.
/mob/living/update_canmove(delay_action_updates = 0)
	var/fall_over = !can_stand()
	var/buckle_lying = !(buckled && !buckled.buckle_lying)
	if(fall_over || resting || IsStunned())
		drop_r_hand()
		drop_l_hand()
	else
		lying = 0
		canmove = 1
	if(buckled)
		lying = 90 * buckle_lying
	else if((fall_over || resting) && !lying)
		fall(fall_over)

	canmove = !(fall_over || resting || IsStunned() || IsFrozen() || buckled || IsImmobilized())
	density = !lying
	if(lying)
		if(layer == initial(layer))
			layer = LYING_MOB_LAYER //so mob lying always appear behind standing mobs
	else
		if(layer == LYING_MOB_LAYER)
			layer = initial(layer)

	update_transform()
	if(!delay_action_updates)
		update_action_buttons_icon()
	return canmove

/mob/living/proc/update_stamina()
	return

/mob/living/vv_edit_var(var_name, var_value)
	. = ..()
	switch(var_name)
		if("maxHealth")
			updatehealth("var edit")
		if("resize")
			update_transform()


/mob/living/proc/update_disgust_alert()
	switch(AmountDisgust())
		if(0 to DISGUST_LEVEL_GROSS)
			clear_alert("disgust")
		if(DISGUST_LEVEL_GROSS to DISGUST_LEVEL_VERYGROSS)
			throw_alert("disgust", /obj/screen/alert/gross)
		if(DISGUST_LEVEL_VERYGROSS to DISGUST_LEVEL_DISGUSTED)
			throw_alert("disgust", /obj/screen/alert/verygross)
		if(DISGUST_LEVEL_DISGUSTED to INFINITY)
			throw_alert("disgust", /obj/screen/alert/disgusted)
