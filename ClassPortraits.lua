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

hooksecurefunc("UnitFrame_Update",  function() -- not returning any UnitID, have to check all frames manually
		
		if(UnitGUID("player")~=nil) then
		PlayerFrame.portrait:SetTexture(iconPath, true);
		local p=classIcons[select(2, UnitClass("player"))];
		PlayerFrame.portrait:SetTexCoord(unpack(p));
		end
		
		if(UnitGUID("target")~=nil and UnitIsPlayer("target") ~= nil) then
			TargetFrame.portrait:SetTexture(iconPath, true);
			local t=classIcons[select(2, UnitClass("target"))];
			TargetFrame.portrait:SetTexCoord(unpack(t));
		elseif(UnitGUID("target")~=nil) then
			TargetFrame.portrait:SetTexCoord(0,1,0,1);
		end
		
		if(UnitGUID("targettarget")~=nil and UnitIsPlayer("targettarget") ~= nil) then
		TargetofTargetFrame.portrait:SetTexture(iconPath, true);
		local tt=classIcons[select(2, UnitClass("targettarget"))];
		TargetofTargetFrame.portrait:SetTexCoord(unpack(tt));
		elseif(UnitGUID("targettarget")~=nil) then
			TargetofTargetFrame.portrait:SetTexCoord(0,1,0,1);
		end
		
		if(UnitGUID("focus") ~= nil and UnitIsPlayer("focus") ~= nil) then
		FocusFrame.portrait:SetTexture(iconPath, true);
		local f=classIcons[select(2, UnitClass("focus"))];
		FocusFrame.portrait:SetTexCoord(unpack(f));
		elseif(UnitGUID("focus")~=nil) then
			TargetFrame.portrait:SetTexCoord(0,1,0,1);
		end
		
		if(UnitGUID("focustarget")~=nil and UnitIsPlayer("focustarget") ~= nil) then
		TargetofFocusFrame.portrait:SetTexture(iconPath, true);
		local ft=classIcons[select(2, UnitClass("focustarget"))];
		TargetofFocusFrame.portrait:SetTexCoord(unpack(ft));
		elseif(UnitGUID("focustarget")~=nil) then
			TargetofFocusFrame.portrait:SetTexCoord(0,1,0,1);
		end
		
		if (UnitGUID("party1")~=nil) then
		PartyMemberFrame1.portrait:SetTexture(iconPath, true);
		local p1=classIcons[select(2, UnitClass("party1"))];
		PartyMemberFrame1.portrait:SetTexCoord(unpack(p1));
		end
		
		if(UnitGUID("party2")~=nil) then
		PartyMemberFrame2.portrait:SetTexture(iconPath, true);
		local p2=classIcons[select(2, UnitClass("party2"))];
		PartyMemberFrame2.portrait:SetTexCoord(unpack(p2));
		end
		
		if(UnitGUID("party3")~=nil) then
		PartyMemberFrame3.portrait:SetTexture(iconPath, true);
		local p3=classIcons[select(2, UnitClass("party3"))];
		PartyMemberFrame3.portrait:SetTexCoord(unpack(p3));
		end
		
		if(UnitGUID("party4")~=nil) then
		PartyMemberFrame4.portrait:SetTexture(iconPath, true);
		local p4=classIcons[select(2, UnitClass("party4"))];
		PartyMemberFrame4.portrait:SetTexCoord(unpack(p4));
		end
		
		if(UnitGUID("party5")~=nil) then
		PartyMemberFrame5.portrait:SetTexture(iconPath, true);
		local p5=classIcons[select(2, UnitClass("party5"))];
		PartyMemberFrame5.portrait:SetTexCoord(unpack(p5));
		end
		
		

end
);