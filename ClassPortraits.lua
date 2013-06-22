local function log(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end -- alias for convenience

local function firstToUpper(str) -- for convience with unitId and UnitFrame
    if (str~=nil) then
        return (str:gsub("^%l", string.upper));
    else
        return nil;
    end
end

local iconPath="Interface\\Addons\\ClassPortraits\\UI-CLASSES-CIRCLES.BLP";

local classIcons = {
-- UpperLeftx, UpperLefty, LowerLeftx, LowerLefty, UpperRightx, UpperRighty, LowerRightx, LowerRighty
    ["WARRIOR"] = {0, 0, 0, 0.25, 0.25, 0, 0.25, 0.25},
    ["ROGUE"] = {0.5, 0, 0.5, 0.25, 0.75, 0, 0.75, 0.25},
    ["DRUID"] = {0.75, 0, 0.75, 0.25, 1, 0, 1, 0.25},
    ["WARLOCK"] = {0.75, 0.25, 0.75, 0.5, 1, 0.25, 1, 0.5},
    ["HUNTER"] = {0, 0.25, 0, 0.5, 0.25, 0.25, 0.25, 0.5},
    ["PRIEST"] = {0.5, 0.25, 0.5, 0.5, 0.75, 0.25, 0.75, 0.5},
    ["PALADIN"] = {0, 0.5, 0, 0.75, 0.25, 0.5, 0.25, 0.75},
    ["SHAMAN"] = {0.25, 0.25, 0.25, 0.5, 0.5, 0.25, 0.5, 0.5},
    ["MAGE"] = {0.25, 0, 0.25, 0.25, 0.5, 0, 0.5, 0.25}
};

hooksecurefunc("UnitFrame_Update",  function()
    local unit = this:GetAttribute("unit")
    
    -- Coment the next line if you want your player unit to be affected as well
    if unit == "player" then return end
    
    if UnitExists(unit) and this.portrait ~= nil then
        if UnitIsPlayer(unit) then
            local _, class = UnitClass(unit)
            local iconCoords = classIcons[class]
            this.portrait:SetTexture(iconPath, true)
            this.portrait:SetTexCoord(unpack(iconCoords))
        else
            this.portrait:SetTexCoord(0, 1, 0, 1);
        end
    end
end
)
