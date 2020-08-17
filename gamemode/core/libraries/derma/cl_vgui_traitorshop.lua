
--[[
	TTT -> Derma library -> Traitor Shop (ClientSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

local FRAME = {}

function FRAME:SetItem(item)
	self._Title:SetText(item.Name)
	self._Description:SetText(item.Description)
	self._Price:SetText("Price: " .. item.Price .. " credits")
	if item.Slot ~= -1 then self._Slot:SetText("Slot: " .. item.Slot)
	else self._Slot:SetText("") end

	self._ButtonBuy:SetText("Buy " .. item.Name .. "!")
	self._ButtonBuy:SizeToContents()
	local x = self._ButtonBuy:GetSize()
	self._ButtonBuy:SetWidth(x + 32)
	self._ButtonBuy:SetHeight(32)
	self._ButtonBuy.DoClick = function()
		self._ButtonBuy:SetEnabled(false)
		net.Start("TTT:BuyItem")
		net.WriteUInt(SHOP_TRAITOR, 8)
		net.WriteString(item.ID)
		net.SendToServer()
	end
	self._ButtonBuy:SetVisible(true)
	if LocalPlayer():GetCredits() < item.Price then
		self._ButtonBuy:SetEnabled(false)
		self._ButtonBuy:SetTooltip("You don't have enough credits.")
	else
		self._ButtonBuy:SetEnabled(true)
		self._ButtonBuy:SetTooltip(nil)
	end
	if item.IsPurchased(LocalPlayer()) then
		self._ButtonBuy:SetEnabled(false)
		self._ButtonBuy:SetTooltip("You have already purchased this item.")
	end
end

function FRAME:Init()
	local w, h = ScrW() * 0.5, ScrH() * 0.5
	self:SetDeleteOnClose(true)
	self:SetTitle(TTT.Lang.TraitorShop_Title)
	self:SetSize(w, h)
	self:Center()

	self._Grid = vgui.Create("DGrid", self)
	self._Grid:Dock(LEFT)
	self._Grid:DockMargin(16, 16, 16, 16)
	self._Grid:SetCols(3)
	self._Grid:SetColWide(96)
	self._Grid:SetRowHeight(96)

	for _, item in pairs(TTT.Items.GetItems(SHOP_TRAITOR)) do
		local btn = vgui.Create("DButton")
		btn:SetText(item.Name)
		btn:SetSize(96, 96)
		btn.DoClick = function()
			self:SetItem(item)
		end
		self._Grid:AddItem(btn)
	end

	self._Panel = vgui.Create("Panel", self)
	self._Panel:Dock(FILL)
	self._Panel:DockMargin(24, 24, 24, 24)

	self._Title = vgui.Create("DLabel", self._Panel)
	self._Title:Dock(TOP)
	self._Title:SetText("")
	self._Title:SetFont("TTTHUD")

	self._Description = vgui.Create("DLabel", self._Panel)
	self._Description:Dock(TOP)
	self._Description:DockMargin(0, 8, 0, 0)
	self._Description:SetText("")
	self._Description:SetFont("TTTHUD2")

	self._Price = vgui.Create("DLabel", self._Panel)
	self._Price:Dock(TOP)
	self._Price:DockMargin(0, 32, 0, 0)
	self._Price:SetText("")
	self._Price:SetFont("TTTHUD2")

	self._Slot = vgui.Create("DLabel", self._Panel)
	self._Slot:Dock(TOP)
	self._Slot:DockMargin(0, 4, 0, 0)
	self._Slot:SetText("")
	self._Slot:SetFont("TTTHUD2")

	self._ButtonsPanel = vgui.Create("Panel", self._Panel)
	self._ButtonsPanel:Dock(TOP)
	self._ButtonsPanel:DockMargin(0, 32, 0, 0)
	self._ButtonsPanel:SetHeight(32)

	self._ButtonBuy = vgui.Create("DButton", self._ButtonsPanel)
	self._ButtonBuy:SetText("Buy %namenamename%!")
	self._ButtonBuy:SetFont("TTTHUD2")
	self._ButtonBuy:SizeToContents()
	local x = self._ButtonBuy:GetSize()
	self._ButtonBuy:SetWidth(x + 32)
	self._ButtonBuy:SetHeight(32)
	self._ButtonBuy:SetVisible(false)
end

function FRAME:OnRemove()
	TTT.Derma._MenuOpen = false
end

vgui.Register("TTT:TraitorShop", FRAME, "DFrame")
