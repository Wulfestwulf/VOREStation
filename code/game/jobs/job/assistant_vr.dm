//////////////////////////////////
//		Intern
//////////////////////////////////

/datum/job/intern
	title = JOB_INTERN
	flag = INTERN
	departments = list(DEPARTMENT_CIVILIAN)
	department_flag = ENGSEC // Ran out of bits
	faction = FACTION_STATION
	total_positions = -1
	spawn_positions = -1
	supervisors = "the staff from the department you're interning in"
	selection_color = "#555555"
	economic_modifier = 2
	access = list()			//See /datum/job/intern/get_access()
	minimal_access = list()	//See /datum/job/intern/get_access()
	outfit_type = /decl/hierarchy/outfit/job/assistant/intern
	alt_titles = list("Apprentice Engineer" = /datum/alt_title/intern_eng,
					  "Medical Intern" = /datum/alt_title/intern_med,
					  "Research Intern" = /datum/alt_title/intern_sci,
					  "Security Cadet" = /datum/alt_title/intern_sec,
					  "Jr. Cargo Tech" = /datum/alt_title/intern_crg,
					  "Server" = /datum/alt_title/server,
					  JOB_ALT_ASSISTANT = /datum/alt_title/assistant)
	job_description = "An " + JOB_INTERN + " does whatever is requested of them, often doing so in process of learning \
						another job. Though they are part of the crew, they have no real authority."
	timeoff_factor = 0 // Interns, noh
	requestable = FALSE

/datum/alt_title/intern_eng
	title = "Apprentice Engineer"
	title_blurb = "An Apprentice Engineer attempts to provide whatever the Engineering department needs. They are not proper Engineers, and are \
					often in training to become an Engineer. An Apprentice Engineer has no real authority."
	title_outfit = /decl/hierarchy/outfit/job/assistant/engineer

/datum/alt_title/intern_med
	title = "Medical Intern"
	title_blurb = "A Medical Intern attempts to provide whatever the Medical department needs. They are not proper Doctors, and are \
					often in training to become a Doctor. A Medical Intern has no real authority."
	title_outfit = /decl/hierarchy/outfit/job/assistant/medic

/datum/alt_title/intern_sci
	title = "Research Intern"
	title_blurb = "A Research Intern attempts to provide whatever the Research department needs. They are not proper " + JOB_SCIENTIST + "s, and are \
					often in training to become a " + JOB_SCIENTIST + ". A Research Intern has no real authority."
	title_outfit = /decl/hierarchy/outfit/job/assistant/scientist

/datum/alt_title/intern_sec
	title = "Security Cadet"
	title_blurb = "A Security Cadet attempts to provide whatever the Security department needs. They are not proper Officers, and are \
					often in training to become an Officer. A Security Cadet has no real authority."
	title_outfit = /decl/hierarchy/outfit/job/assistant/officer

/datum/alt_title/intern_crg
	title = "Jr. Cargo Tech"
	title_blurb = "A Jr. Cargo Tech attempts to provide whatever the Cargo department needs. They are not proper Cargo Technicians, and are \
					often in training to become a " + JOB_CARGO_TECHNICIAN + ". A Jr. Cargo Tech has no real authority."
	title_outfit = /decl/hierarchy/outfit/job/assistant/cargo
/*
/datum/alt_title/intern_exp
	title = "Jr. " + JOB_EXPLORER + ""
	title_blurb = "A Jr. " + JOB_EXPLORER + " attempts to provide whatever the Exploration department needs. They are not proper " + JOB_EXPLORER + "s, and are \
					often in training to become an " + JOB_EXPLORER + ". A Jr. " + JOB_EXPLORER + " has no real authority."
	title_outfit = /decl/hierarchy/outfit/job/assistant/explorer
*/
/datum/alt_title/server
	title = "Server"
	title_blurb = "A Server helps out kitchen and diner staff with various tasks, primarily food delivery. A Server has no real authority."
	title_outfit = /decl/hierarchy/outfit/job/service/server

/datum/alt_title/assistant
	title = JOB_ALT_ASSISTANT
	title_blurb = "An " + JOB_ALT_ASSISTANT + " helps out wherever they might be needed. They have no authority, but can volunteer to help if help is needed."
	title_outfit = /decl/hierarchy/outfit/job/service/server

/datum/job/intern/New()
	..()
	if(config)
		total_positions = config.limit_interns
		spawn_positions = config.limit_interns

/datum/job/intern/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()


//////////////////////////////////
//		Visitor
//////////////////////////////////

/datum/job/assistant		// Visitor
	title = USELESS_JOB
	supervisors = "nobody! You don't work here"
	job_description = "A " + USELESS_JOB + " is just there to visit the place. They have no real authority or responsibility."
	timeoff_factor = 0
	requestable = FALSE
	alt_titles = list("Guest" = /datum/alt_title/guest, "Traveler" = /datum/alt_title/traveler)

/datum/job/assistant/New()
	..()
	if(config)
		total_positions = config.limit_visitors
		spawn_positions = config.limit_visitors

/datum/job/assistant/get_access()
	return list()

/datum/alt_title/guest
	title = "Guest"

/datum/alt_title/traveler
	title = "Traveler"
