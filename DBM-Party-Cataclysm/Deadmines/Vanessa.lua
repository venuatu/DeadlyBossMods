local mod	= DBM:NewMod("Cookie", "DBM-Party-Cataclysm", 2)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision$"):sub(12, -3))
mod:SetCreatureID(49541)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_CAST_SUCCESS"
)

local warnDeflection	= mod:NewSpellAnnounce(92614, 3)
local warnDeadlyBlades	= mod:NewSpellAnnounce(92622, 3)

local timerDeflection	= mod:NewBuffActiveTimer(10, 92614)
local timerDeadlyBlades	= mod:NewBuffActiveTimer(5, 92622)

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(92614) then
		warnDeflection:Show()
		timerDeflection:Start()
	elseif args:IsSpellID(92622) then
		warnDeadlyBlades:Show()
		timerDeadlyBlades:Start()
	end
end