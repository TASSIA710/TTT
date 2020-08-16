
--[[
	TTT -> Derma library -> Traitor Shop (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

local FRAME = {}

function FRAME:Init()
	local w, h = ScrW() * 0.5, ScrH() * 0.5
	self:SetDeleteOnClose(true)
	self:SetTitle(TTT.Lang.TraitorShop_Title)
	self:SetSize(w, h)
	self:Center()
end

function FRAME:OnRemove()
	TTT.Derma._MenuOpen = false
end

vgui.Register("TTT:TraitorShop", FRAME, "DFrame")
