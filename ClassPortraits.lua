local function log(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end -- alias for convenience
local ClassPortraits = CreateFrame("Frame", nil, UIParent);
local iconPath="Interface\\Addons\\ClassPortraits\\UI-CLASSES-CIRCLES"

hooksecurefunc("UnitFrame_Update", function()
	local unit = this.unit
    if UnitExists(unit) then
        if UnitIsPlayer(unit) then
			if not CLASS_BUTTONS[select(2,UnitClass(this.unit))] then return end
			this.portrait:SetTexture(iconPath)
			this.portrait:SetTexCoord(unpack(CLASS_BUTTONS[select(2,UnitClass(this.unit))]))
        else
            this.portrait:SetTexCoord(0, 1, 0, 1)
        end
    end
end)

local partyFrames = {
	[1] = PartyMemberFrame1,
	[2] = PartyMemberframe2,
	[3] = PartyMemberframe3,
	[4] = PartyMemberframe4,
}

ClassPortraits:SetScript("OnUpdate",  function()
	if PlayerFrame.portrait~=nil then
		local _, class = UnitClass("player")
		local iconCoords = CLASS_BUTTONS[class]
		PlayerFrame.portrait:SetTexture(iconPath, true)
		PlayerFrame.portrait:SetTexCoord(unpack(iconCoords))
	end
	for i=1, GetNumPartyMembers() do
		if partyFrames[i].portrait~=nil then
			if not CLASS_BUTTONS[select(2,UnitClass("party"..i))] then return end
			partyFrames[i].portrait:SetTexture(iconPath, true)
			partyFrames[i].portrait:SetTexCoord(unpack(CLASS_BUTTONS[select(2,UnitClass("party"..i))]))
		end
	end
end
)