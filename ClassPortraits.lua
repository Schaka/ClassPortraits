local ClassPortraits = CreateFrame("Frame", nil, UIParent);
local iconPath="Interface\\Addons\\ClassPortraits\\UI-CLASSES-CIRCLES"
hooksecurefunc("UnitFrame_Update",  function()
    local unit = this:GetAttribute("unit")
    
    if UnitExists(unit) and this.portrait ~= nil then
        if UnitIsPlayer(unit) then
            local _, class = UnitClass(unit)
			local iconCoords = CLASS_BUTTONS[class]
			this.portrait:SetTexture(iconPath, true)
			this.portrait:SetTexCoord(unpack(iconCoords))
        else
            this.portrait:SetTexCoord(0, 1, 0, 1);
        end
    end
 end
)
ClassPortraits:SetScript("OnUpdate",  function()
	if PlayerFrame.portrait~=nil then
		local _, class = UnitClass("player")
		local iconCoords = CLASS_BUTTONS[class]
		PlayerFrame.portrait:SetTexture(iconPath, true)
		PlayerFrame.portrait:SetTexCoord(unpack(iconCoords))
	end
end
)