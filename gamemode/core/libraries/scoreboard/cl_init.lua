
--[[
	TTT -> Scoreboard library (ClientSide)
	by Tesseract Servers (https://github.com/TesseractServers)
--]]

surface.CreateFont("TTT:Scoreboard", {
		font = "Roboto",
		size = ScrH() / 51,
		weight = 500,
		bold = false
})

surface.CreateFont("TTT:Scoreboard2", {
		font = "Roboto",
		size = ScrH() / 47,
		weight = 300,
		bold = false
})



local PLAYER_LINE_TITLE = {

	Init = function(self)
		self.AIconPanel = vgui.Create("DPanel", self)
		self.AIconPanel:SetSize(32, 32)
		self.AIconPanel:Dock(LEFT)
		self.AIconPanel.Paint = function() end

		self.APlayers = self:Add("DLabel")
		self.APlayers:Dock(FILL)
		self.APlayers:SetFont("TTT:Scoreboard")
		self.APlayers:SetTextColor(Color(255, 255, 255))
		self.APlayers:DockMargin(0, 0, 0, 0)

		self.AJobs = self:Add("DLabel")
		self.AJobs:Dock(FILL)
		self.AJobs:SetFont("TTT:Scoreboard")
		self.AJobs:SetTextColor(Color(255, 255, 255))
		self.AJobs:DockMargin(0, 0, 0, 0)
		self.AJobs:SetContentAlignment(5)
		self.AJobs:SetText("Job")

		self.APing = self:Add("DLabel")
		self.APing:Dock(RIGHT)
		self.APing:SetFont("TTT:Scoreboard")
		self.APing:SetTextColor(Color(255, 255, 255))
		self.APing:SetWidth(80)
		self.APing:DockMargin(0, 0, 0, 0)
		self.APing:SetContentAlignment(5)
		self.APing:SetText("Ping")

		self.ADeaths = self:Add("DLabel")
		self.ADeaths:Dock(RIGHT)
		self.ADeaths:SetFont("TTT:Scoreboard")
		self.ADeaths:SetTextColor(Color(255, 255, 255))
		self.ADeaths:SetWidth(80)
		self.ADeaths:DockMargin(0, 0, -10, 0)
		self.ADeaths:SetContentAlignment(5)
		self.ADeaths:SetText("Deaths")

		self.AKills = self:Add("DLabel")
		self.AKills:Dock(RIGHT)
		self.AKills:SetFont("TTT:Scoreboard")
		self.AKills:SetTextColor(Color(255, 255, 255))
		self.AKills:SetWidth(80)
		self.AKills:DockMargin(0, 0, 0, 0)
		self.AKills:SetContentAlignment(5)
		self.AKills:SetText("Score")

		self.ACredits = self:Add("DLabel")
		self.ACredits:Dock(RIGHT)
		self.ACredits:SetFont("TTT:Scoreboard")
		self.ACredits:SetTextColor(Color(255, 255, 255))
		self.ACredits:SetWidth(80)
		self.ACredits:DockMargin(0, 0, 0, 0)
		self.ACredits:SetContentAlignment(5)
		self.ACredits:SetText("Karma")

		self:Dock(TOP)
		self:DockPadding(3, 3, 3, 3)
		self:SetHeight(30)
		self:DockMargin(10, 0, 10, 2)
		self:SetZPos(-6000)
	end,

	Think = function(self)
		self.APlayers:SetText("Players (" .. player.GetCount() .. ")")
	end,

	Paint = function(self, w, h)
		draw.RoundedBox(4, 0, 0, w, h, Color(50, 50, 50, 175))
	end
}

PLAYER_LINE_TITLE = vgui.RegisterTable(PLAYER_LINE_TITLE, "DPanel")

local PLAYER_LINE = {
	Init = function(self)
		self.IconPanel = vgui.Create("DPanel", self)
		self.IconPanel:SetSize(32, 32)
		self.IconPanel:Dock(LEFT)
		self.IconPanel.Paint = function() end

		self.Icon = vgui.Create("DImage", self.IconPanel)
		self.Icon:SetSize(16, 16)
		self.Icon:Center()

		self.AvatarButton = self:Add("DButton")
		self.AvatarButton:Dock(LEFT)
		self.AvatarButton:DockMargin(3, 3, 3, 3)
		self.AvatarButton:SetSize(32, 32)
		self.AvatarButton:SetContentAlignment(5)


		self.Avatar = vgui.Create("AvatarImage", self.AvatarButton)
		self.Avatar:SetSize(32, 32)
		self.Avatar:SetMouseInputEnabled(false)

		self.Name = self:Add("DLabel")
		self.Name:Dock(FILL)
		self.Name:SetFont("TTT:Scoreboard2")
		self.Name:SetTextColor(Color(100, 100, 100))
		self.Name:DockMargin(8, 0, 2, 0)
		self.Name:SetMouseInputEnabled(true)

		self.Name.DoRightClick = function()
			local menu = DermaMenu()
			menu:AddOption("Open player's steam community profile", function()
				gui.OpenURL("http://www.steamcommunity.com/profiles/" .. self.Player:SteamID64())
			end):SetImage("icon16/world.png")

			menu:AddSpacer()
			menu:AddOption("Name: " .. self.Player:SteamName(), function()
				SetClipboardText(self.Player:SteamName())
				LocalPlayer():ChatPrint("Copied to clipboard!")
			end):SetImage("icon16/user_gray.png")

			menu:AddOption("In-Game Name: " .. self.Player:Nick(), function()
				SetClipboardText(self.Player:Nick())
				LocalPlayer():ChatPrint("Copied to clipboard!")
			end):SetImage("icon16/user_suit.png")

			menu:AddOption("SteamID: " .. self.Player:SteamID(), function()
				SetClipboardText(self.Player:SteamID())
				LocalPlayer():ChatPrint("Copied to clipboard!")
			end):SetImage("icon16/vcard.png")

			menu:AddSpacer()
			menu:AddSpacer()
			menu:AddOption("Hours Played: " .. math.floor(self.Player:sam_get_play_time() / 3600) .. " hours", function()
				-- Do nothing
			end):SetImage("icon16/time.png")

			menu:AddOption("Rank: " .. CityRP.GetRank(self.Player).Name, function()
				-- Do nothing
			end):SetImage(CityRP.GetRank(self.Player).Icon)

			menu:Open()
			hook.Add("ScoreboardHide", "onClose", function()
				if IsValid(menu) then
					menu:Hide()
				end;
			end)
		end

		self.Job = self:Add("DLabel")
		self.Job:Dock(FILL)
		self.Job:DockMargin(0, 0, 15, 0)
		self.Job:SetWidth(50)
		self.Job:SetFont("TTT:Scoreboard2")
		self.Job:SetTextColor(Color(100, 100, 100))
		self.Job:SetContentAlignment(5)

		self.Ping = self:Add("DLabel")
		self.Ping:Dock(RIGHT)
		self.Ping:DockMargin(0, 0, 0, 0)
		self.Ping:SetWidth(80)
		self.Ping:SetFont("TTT:Scoreboard2")
		self.Ping:SetTextColor(Color(100, 100, 100))
		self.Ping:SetContentAlignment(5)

		self.Deaths = self:Add("DLabel")
		self.Deaths:Dock(RIGHT)
		self.Deaths:DockMargin(0, 0, 0, 0)
		self.Deaths:SetWidth(80)
		self.Deaths:SetFont("TTT:Scoreboard2")
		self.Deaths:SetTextColor(Color(100, 100, 100))
		self.Deaths:SetContentAlignment(5)

		self.Kill = self:Add("DLabel")
		self.Kill:Dock(RIGHT)
		self.Kill:DockMargin(0, 0, 0, 0)
		self.Kill:SetWidth(80)
		self.Kill:SetFont("TTT:Scoreboard2")
		self.Kill:SetTextColor(Color(100, 100, 100))
		self.Kill:SetContentAlignment(5)

		self.Credits = self:Add("DLabel")
		self.Credits:Dock(RIGHT)
		self.Credits:DockMargin(0, 0, 0, 0)
		self.Credits:SetWidth(80)
		self.Credits:SetFont("TTT:Scoreboard2")
		self.Credits:SetTextColor(Color(100, 100, 100))
		self.Credits:SetContentAlignment(5)

		self:Dock(TOP)
		self:SetHeight(38)
		self:DockMargin(10, 0, 10, 2)
	end,

	Setup = function(self, pl)
		self.Player = pl
		self.Avatar:SetPlayer(pl)
		self:Think(self)
	end,

	Think = function(self)
		if not IsValid(self.Player) then
			self:SetZPos(9999)
			self:Remove()
			return
		end

		self.Name:SetTextColor(Color(255, 255, 255))
		self.Ping:SetTextColor(Color(255, 255, 255))
		self.Job:SetTextColor(Color(255, 255, 255))
		self.Kill:SetTextColor(Color(255, 255, 255))
		self.Deaths:SetTextColor(Color(255, 255, 255))
		self.Credits:SetTextColor(Color(255, 255, 255))

		-- TODO self.Icon:SetImage(CityRP.GetRank(self.Player).Icon)

		if self.PName == nil or self.PName ~= self.Player:Nick() then
			self.PName = self.Player:Nick()
			self.Name:SetText(self.Player:Nick())
		end

		if self.NumPing == nil or self.NumPing ~= self.Player:Ping() then
			self.NumPing = self.Player:Ping()
			self.Ping:SetText(self.NumPing .. " ms")
		end

		-- TODO if self.title_job == nil or self.title_job ~= self.Player:getDarkRPVar("job") then
			-- self.title_job = self.Player:getDarkRPVar("job")
			-- self.Job:SetText(self.title_job)
		-- end

		if self.numcredits == nil or self.numcredits ~= self.Player:GetNWInt("Credits") then
			self.numcredits = self.Player:GetNWInt("Credits")
			self.Credits:SetText("1000")
		end

		if self.numKills == nil or self.numKills ~= self.Player:Frags() then
			self.numKills = self.Player:Frags()
			self.Kill:SetText(self.numKills)
		end

		if self.numdeaths == nil or self.numdeaths ~= self.Player:Deaths() then
			self.numdeaths = self.Player:Deaths()
			self.Deaths:SetText(self.numdeaths)
		end
	end,

	Paint = function(self, w, h)
		if not IsValid(self.Player) then
			return
		end
		draw.RoundedBox(4, 0, 0, w, h, Color(10, 10, 10, 175))
	end
}

PLAYER_LINE = vgui.RegisterTable(PLAYER_LINE, "DPanel")

local scoreboard = {
	Init = function(self)
		self.Scores = self:Add("DScrollPanel")
		self.Scores:Dock(FILL)
		self.Scores:DockMargin(0, 0, 0, 10)
		local scrollBar = self.Scores:GetVBar()
		scrollBar:DockMargin(-5, 0, 0, 0)
		function scrollBar:Paint(w, h)
			surface.SetDrawColor(10, 10, 10, 100)
			surface.DrawOutlinedRect(0, 0, w - 1, h - 1)
		end
		function scrollBar.btnGrip:Paint(w,h)
			draw.RoundedBox(0, 0, 0, w, h, Color(150, 200, 150, 150))
		end
		self.Title = self.Scores:Add(PLAYER_LINE_TITLE)
	end,

	PerformLayout = function(self)
		self:SetSize(1400, ScrH() - 100)
		self:SetPos(ScrW() / 2 - 1400 / 2, 200 / 2)
	end,

	Paint = function(self, w, h)
		draw.RoundedBox(8, 0, 0, w, h, Color(10, 10, 10, 0))
	end,

	Think = function(self, w, h)
		for id, pl in pairs(player.GetAll()) do
			if IsValid(pl.ScoreEntry) then continue end
			pl.ScoreEntry = vgui.CreateFromTable(PLAYER_LINE, pl.ScoreEntry)
			pl.ScoreEntry:Setup(pl)
			self.Scores:AddItem(pl.ScoreEntry)
		end
	end
}

scoreboard = vgui.RegisterTable(scoreboard, "EditablePanel")

function GM:ScoreboardShow()
	if not IsValid(g_Scoreboard) then
		g_Scoreboard = vgui.CreateFromTable(scoreboard)
	end

	if IsValid(g_Scoreboard) then
		g_Scoreboard:Show()
		g_Scoreboard:MakePopup()
		g_Scoreboard:SetKeyboardInputEnabled(false)
	end
end

function GM:ScoreboardHide()
	if IsValid(g_Scoreboard) then
		g_Scoreboard:Hide()
	end
end
