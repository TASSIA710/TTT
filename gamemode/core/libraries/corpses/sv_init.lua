
--[[
	TTT -> Corpses library (ServerSide)
	by Tassilo (https://github.com/TASSIA710)
--]]

TTT.Corpses = {}



--- Creates a new corpse with the given death reason.
-- @param ply [Player] - the (now dead) player
-- @param attacker [Entity] - the entity (should be a player, but can also be an entity)
-- @param dmginfo [CTakeDamageInfo] - the damage information
-- @returns ragdoll [Entity] - the corpse
function TTT.Corpses.CreateCorpse(ply, attacker, dmginfo)
	-- This code is partially ported from the original gamemode
	-- https://github.com/Facepunch/garrysmod/blob/394ae745df8f8f353ea33c8780f012fc000f4f56/garrysmod/gamemodes/terrortown/gamemode/corpse.lua
	if not IsValid(ply) then return nil end

	-- Create the actual ragdoll entity
	local rag = ents.Create("prop_ragdoll")
	if not IsValid(rag) then return nil end

	-- Make the ragdoll look like the player
	rag:SetPos(ply:GetPos())
	rag:SetModel(ply:GetModel())
	rag:SetSkin(ply:GetSkin())
	for _, value in pairs(ply:GetBodyGroups()) do
		rag:SetBodygroup(value.id, ply:GetBodygroup(value.id))
	end
	rag:SetAngles(ply:GetAngles())
	rag:SetColor(ply:GetColor())

	-- Spawn the ragdoll
	rag:Spawn()
	rag:Activate()

	-- Configure the collision for this corpse
	rag:SetCollisionGroup(COLLISION_GROUP_WEAPON or COLLISION_GROUP_DEBRIS_TRIGGER)

	-- Put player data on corpse
	rag._Corpse = true
	rag._Player = ply
	rag._SteamID = ply:SteamID()
	rag._Nick = ply:Nick()
	rag._Role = ply:GetRole()
	rag._Found = false
	rag._Credits = ply:GetCredits()
	rag._Attacker = attacker
	rag._DMGInfo = dmginfo
	rag._Date = CurTime()

	-- Position the bones
	local num = rag:GetPhysicsObjectCount() - 1
	local v = ply:GetVelocity()

	-- Dampen bullet force
	if dmginfo:IsDamageType(DMG_BULLET) or dmginfo:IsDamageType(DMG_SLASH) then
		v = v / 5
	end

	for i = 0, num do
		local bone = rag:GetPhysicsObjectNum(i)
		if not IsValid(bone) then continue end
		local bp, ba = ply:GetBonePosition(rag:TranslatePhysBoneToBone(i))
		if bp and ba then
			bone:SetPos(bp)
			bone:SetAngles(ba)
		end
		bone:SetVelocity(v)
	end

	--- This hook is called just after a corpse has been created.
	-- This allows plugins to put their own data on the corpse if desired.
	-- @param ply [Player] - the died player
	-- @param rag [Entity] - the corpse entity
	hook.Run("TTT_CreateCorpse", ply, rag)
	return rag
end
