ENT.Base 			= "base_ai"
ENT.Type 			= "ai"
ENT.PrintName		= "CP NPC"
ENT.Author			= "shadowfigure"
ENT.Purpose			= "Ranks and divisions for cp characters"
ENT.Instructions	= "Press E"
ENT.Category 		= "Nexus"

ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.bNoPersist = true

CP_Ranks = {}
CP_Divisions = {}

CP_Ranks[1] = {
	id = 1,
	name = "RCT",
	head = 0
}

CP_Ranks[2] = {
	id = 2,
	name = "i4",
	head = 0
}


CP_Divisions[1] = {
	id = 1,
	name = "UNION",
	model = "models/DPFilms/Metropolice/Playermodels/pm_HDpolice.mdl",
	skin = 0,
	health = 100,
	armor = 40,
	weapons = {}
}
CP_Divisions[1].weapons[1] = {"Stunstick"}
CP_Divisions[1].weapons[2] = {"pistol", "pistolammo"}
CP_Divisions[1].weapons[6] = {"smg1", "smg1ammo", "smg1ammo"}

CP_Divisions[2] = {
	id = 2,
	name = "HELIX",
	model = "models/DPFilms/Metropolice/Playermodels/pm_civil_medic.mdl",
	skin = 1,
	health = 110,
	armor = 40,
	weapons = {}
}
CP_Divisions[2].weapons[1] = {"Stunstick", "medkit"}
CP_Divisions[2].weapons[2] = {"pistol", "pistolammo"}
CP_Divisions[2].weapons[9] = {"spas12", "shotgunammo"}

CP_Divisions[3] = {
	id = 3,
	name = "GRID",
	model = "models/DPFilms/Metropolice/Playermodels/pm_hl2concept.mdl",
	skin = 3,
	health = 100,													
	armor = 50,
	weapons = {}
}
CP_Divisions[3].weapons[1] = {"Stunstick"}
CP_Divisions[3].weapons[2] = {"pistol", "pistolammo"}
CP_Divisions[3].weapons[6] = {"smg1", "smg1ammo", "smg1ammo"}

CP_Divisions[4] = {
	id = 4,
	name = "Jurry",
	model = "models/DPFilms/Metropolice/Playermodels/pm_policetrench.mdl",
	skin = 2,
	health = 120,
	armor = 60,
	weapons = {}
}
CP_Divisions[4].weapons[1] = {"Stunstick"}
CP_Divisions[4].weapons[2] = {"pistol", "pistolammo"}
CP_Divisions[4].weapons[9] = {"spas12", "shotgunammo"}

CP_Divisions[5] = {
	id = 5,
	name = "COMMANDER",
	model = "models/DPFilms/Metropolice/Playermodels/pm_police_bt.mdl",
	skin = 10,
	health = 120,
	armor = 80,
	weapons = {"Stunstick", "pistol", "pistolammo", "ar2", "ar2ammo", "ar2ammo", "smg1", "smg1ammo", "smg1ammo"}
}
CP_Divisions[6] = {
	id = 6,
	name = "Heavy",
	model = "models/DPFilms/Metropolice/Playermodels/pm_rtb_police.mdl",			-- Custom combine unit for Nexus hl2rp server
	skin = 10,
	health = 300,
	armor = 0,
	weapons = {}
}
CP_Divisions[6].weapons[1] = {"shotgun", "shotgunammo"}
