include('shared.lua')

surface.CreateFont("ixCPMenuText", {
	font = "Roboto",
	size = 18,
	weight = 64,
	antialias = true,
	shadow = false,
} )

-- Colors
local white = Color(255, 255, 255, 150)
local black = Color(25, 25, 25, 250)
local gray = Color(44, 43, 43, 150)
local DivisionInfo = CP_Divisions[DivisionID]
local RankInfo = CP_Ranks[RankID]

function CPNPCMenu()
	CPNPCMenu = vgui.Create("DFrame")
	CPNPCMenu:SetTitle("Change your Division and Rank!")
	CPNPCMenu:SetSize(512, 440)
	CPNPCMenu:Center()
	CPNPCMenu:SetVisible( true )
	CPNPCMenu:MakePopup()
	CPNPCMenu.Paint = function( self, w, h )
		ix.util.DrawBlur(self)
		draw.RoundedBox( 0, 0, 0, w, 25, gray )
		draw.RoundedBox( 0, 0, 0, w, 0, black )
	end
	
	local DDivisionBoxCP = vgui.Create( "DComboBox", CPNPCMenu )
	DDivisionBoxCP:SetSortItems(false)
	DDivisionBoxCP:SetPos( 5, 30 )
	DDivisionBoxCP:SetSize( 270, 20 )
	DDivisionBoxCP:SetTextColor( Color(0, 0, 0, 255) )
	DDivisionBoxCP:SetFont("ixCPMenuText")
	DDivisionBoxCP:SetValue( "Choose your Division" )
	DDivisionBoxCP:AddChoice( "UNION - Patrol Unit", 1 )
	DDivisionBoxCP:AddChoice( "HELIX - Medical Unit", 2 )
	DDivisionBoxCP:AddChoice( "GRID - Technician Unit", 3 )
	DDivisionBoxCP:AddChoice( "Jury - 404 Patrol Unit", 4 )
	DDivisionBoxCP:AddChoice( "CMD - Commanding Unit - Whitelisted!", 5 )
	DDivisionBoxCP:AddChoice( "Heavy - Fat scout Unit - Whitelisted!", 6 )
	DDivisionBoxCP.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, gray )
	end
	DDivisionBoxCP.OnSelect = function( panel, index, value )
		Division = value
		DivisionNumber = index
		UpdateButton()
	end
	
	local DRankBoxCP = vgui.Create( "DComboBox", CPNPCMenu )
	DRankBoxCP:SetSortItems(false)
	DRankBoxCP:SetPos( 5, 210 )
	DRankBoxCP:SetSize( 270, 20 )
	DRankBoxCP:SetTextColor( Color(0, 0, 0, 255) )
	DRankBoxCP:SetFont("ixCPMenuText")
	DRankBoxCP:SetValue( "Choose your Rank" )
	DRankBoxCP:AddChoice( "RCT - Recruit", 1 )
	DRankBoxCP:AddChoice( "i4 - Ground Unit", 2 )
	DRankBoxCP.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, 20, gray )
	end
	DRankBoxCP.OnSelect = function( panel, index, value )
		Rank = value
		RankNumber = index
		UpdateButton()
	end
	local icon = vgui.Create( "DModelPanel", CPNPCMenu )
	icon:SetSize( 256, 384 )
	icon:SetPos( 256, 50 )
	icon:SetFOV( 45, 51, 51 )
	icon:SetModel( LocalPlayer():GetModel() )
	icon:SetSkin( LocalPlayer():GetSkin() )
	local ChooseButtonCP = vgui.Create( "DButton", CPNPCMenu )
	ChooseButtonCP:SetText( "Choose a Division and a rank to continue." )
	ChooseButtonCP:SetPos( 5, 400 )
	ChooseButtonCP:SetSize( 300, 30 )
	ChooseButtonCP:SetFont("ixCPMenuText")
	ChooseButtonCP.Paint = function( self, w, h )
		if ChooseButtonCP:IsHovered() then
			draw.RoundedBox( 0, 0, 0, w, 50, Color( 26,25,23, 200 ) )
		else
			draw.RoundedBox( 0, 0, 0, w, 50, Color( 36,35,33, 200 ) )
		end
	end
	ChooseButtonCP.DoClick = function()
		LocalPlayer():ConCommand( "ix_cp_division "..RankNumber.." "..DivisionNumber )
		CPNPCMenu:Close()
	end
	function UpdateButton()
		icon:SetModel( CP_Divisions[DivisionNumber].model )
		icon:SetSkin( CP_Divisions[DivisionNumber].skin )
		ChooseButtonCP:SetText( "Become the Division and Rank" )
	end
end

usermessage.Hook("CPNPCMenu", CPNPCMenu)