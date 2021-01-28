AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

function ENT:Initialize()
	self:SetModel( "models/DPFilms/Metropolice/Playermodels/pm_police_bt.mdl" )
	self:SetHullType( HULL_HUMAN )
	self:SetHullSizeNormal( )
	self:SetNPCState( NPC_STATE_SCRIPT )
	self:SetSolid(  SOLID_BBOX )
	self:CapabilitiesAdd( CAP_ANIMATEDFACE, CAP_TURN_HEAD )
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()
	self:SetPersistent( false )

end
 
function ENT:OnTakeDamage()
	return false
end 

function ENT:AcceptInput( Name, Activator, Caller )
	if Name == "Use" and Caller:IsPlayer() then
		if Caller:Team() == FACTION_MPF then
			self:EmitSound("npc/metropolice/vo/ten4.wav")
			umsg.Start("CPNPCMenu", Caller)
			umsg.End()
		else
			Caller:Notify("You are not part of the Civil Protection Team!")
		end
	end
end

function RemoveInventory(ply)
	local char = ply:GetCharacter()
	local inventory = char:GetInventory()
	local items = char:GetInventory():GetItems()
	local item = inventory:HasItem("currency_default")
	local amount = char:GetMoney()
	ply:SetPData("TokenAmount", amount)
	if (item) then
		inventory:Add("currency_default")
		char:GiveMoney(ply:GetPData("TokenAmount", 0), true, "default")			--could cause tokens to be deleted
	end
	for _, v in pairs(items) do
		v:Remove()
	end
	ply:Notify("Your Inventory has been wiped since you changed Division.")
end

function GiveWeapons(ply, weapons)
	for i, weapon in ipairs(weapons) do
		ply:Give(weapon)
	end
end

function GiveWeaponsInventory(ply, weapons)
	local char = ply:GetCharacter()
	local inventory = char:GetInventory()
	for i, weapon in ipairs(weapons) do
		inventory:Add(weapon)
	end
end


concommand.Add( "ix_cp_division", function( ply, cmd, args )
	if ply:Team() == FACTION_MPF then
		for id, ent in pairs( ents.FindInSphere( ply:GetPos(), 96) ) do
			if ( ent:GetClass() == "ix_cp_npc" ) then
				local RandomNumbers = math.random(1000,9999) 
				local Paladin = "Set to steam id you want"   -- Whitelists     -- Overwatch Commander
				local DivisionID = tonumber(args[2])
				local RankID = tonumber(args[1])
				local DivisionInfo = CP_Divisions[DivisionID]
				local RankInfo = CP_Ranks[RankID]
				local CommandingName = DivisionInfo.name.."."..RandomNumbers
				local StandardName = DivisionInfo.name.."-"..RankInfo.name.."."..RandomNumbers
				local char = ply:GetCharacter()
				local inventory = char:GetInventory()
				local BasicWeapons = {"weapon_physgun", "gmod_tool", "ix_hands", "ix_keys"}


				if DivisionID == 6 then
					if (ply:SteamID() == Paladin) or ply:IsStaffMember() then
						RemoveInventory(ply)
						ply:StripWeapons()
						char:SetName(CommandingName)
						char:SetModel(DivisionInfo.model)
						ply:SetBodygroup(2, 0)
						ply:SetBodygroup(3, 1)
						ply:SetBodygroup(4, 1)
						ply:SetBodygroup(5, 1)
						ply:SetSkin(DivisionInfo.skin)
						ply:Notify("You are now a: "..CommandingName)
						ply:Notify("Your Health has been set to "..DivisionInfo.health.."\nYour Armor has been set to "..DivisionInfo.armor)
						ply:SetMaxHealth(DivisionInfo.health)
						ply:SetHealth(DivisionInfo.health)
						ply:SetArmor(DivisionInfo.armor)
						ply:ConCommand("say 10-8")
						GiveWeapons(ply, BasicWeapons)
						GiveWeaponsInventory(ply, DivisionInfo.weapons)
					else
						ply:Notify("This Division is whitelisted!")
						return false
					end 
				end	
				if DivisionID == 5 then
					if (ply:SteamID() == Paladin) or ply:IsStaffMember() then
						RemoveInventory(ply)
						ply:StripWeapons()
						char:SetName(CommandingName)
						char:SetModel(DivisionInfo.model)
						ply:SetBodygroup(2, 0)
						ply:SetBodygroup(3, 1)
						ply:SetBodygroup(4, 1)
						ply:SetBodygroup(5, 1)
						ply:SetSkin(DivisionInfo.skin)
						ply:Notify("You are now a: "..CommandingName)
						ply:Notify("Your Health has been set to "..DivisionInfo.health.."\nYour Armor has been set to "..DivisionInfo.armor)
						ply:SetMaxHealth(DivisionInfo.health)
						ply:SetHealth(DivisionInfo.health)
						ply:SetArmor(DivisionInfo.armor)
						ply:ConCommand("say 10-8")
						GiveWeapons(ply, BasicWeapons)
						GiveWeaponsInventory(ply, DivisionInfo.weapons)
					else
						ply:Notify("This Division is whitelisted!")
						return false
					end
				elseif DivisionID == 4 then
					RemoveInventory(ply)
					ply:StripWeapons()
					ply:StripAmmo()
					char:SetName(StandardName)
					char:SetModel(DivisionInfo.model)
					ply:SetBodygroup(2, 6)
					ply:SetBodygroup(3, 1)
					ply:SetBodygroup(4, 0)
					ply:SetBodygroup(5, 1)
					ply:SetBodygroup(6, 1)
					ply:SetSkin(DivisionInfo.skin)
					ply:Notify("You are now a: "..StandardName)
					ply:Notify("Your Health has been set to "..DivisionInfo.health.."\nYour Armor has been set to "..DivisionInfo.armor)
					ply:SetMaxHealth(DivisionInfo.health)
					ply:SetHealth(DivisionInfo.health)
					ply:SetArmor(DivisionInfo.armor)
					ply:ConCommand("say 10-8")
					GiveWeapons(ply, BasicWeapons)
					GiveWeaponsInventory(ply, DivisionInfo.weapons)
				else
					RemoveInventory(ply)
					ply:StripWeapons()
					ply:StripAmmo()
					char:SetName(StandardName)
					char:SetModel(DivisionInfo.model)
					ply:SetBodygroup(2, RankInfo.head)
					ply:SetBodygroup(3, 0)
					ply:SetBodygroup(4, 0)
					ply:SetBodygroup(5, 0)
					ply:SetSkin(DivisionInfo.skin)
					ply:Notify("You are now a: "..StandardName)
					ply:Notify("Your Health has been set to "..DivisionInfo.health.."\nYour Armor has been set to "..DivisionInfo.armor)
					ply:SetMaxHealth(DivisionInfo.health)
					ply:SetHealth(DivisionInfo.health)
					ply:SetArmor(DivisionInfo.armor)
					ply:ConCommand("say 10-8")
					GiveWeapons(ply, BasicWeapons)
					for i = 1, RankID do 
						if (DivisionInfo.weapons[i]) then
							GiveWeaponsInventory(ply, DivisionInfo.weapons[i])
						end
					end 
				end
			end
		end
	else
		ply:Notify("You must become a Civil Protection Unit to use this Command!")
		return false
	end
end)