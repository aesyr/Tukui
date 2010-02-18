--  No idea why RequiredDeps won't work, so we force loading of Tukui here
LoadAddOn('Tukui');
LoadAddOn('Quartz');
LoadAddOn('Quartz_Player');
LoadAddOn('Quartz_Target'); -- we have to load it, to disable it, whee!
LoadAddOn('Quartz_Swing'); -- we have to load it, to disable it, whee!
LoadAddOn('Quartz_Focus'); -- we have to load it, to disable it, whee!

-- We disables 'actionbar.lua' when this AddOn is loaded, and prepare the blizzard default actionbars here.

MultiBarBottomLeft:SetScale(0.8);
MultiBarBottomRight:SetScale(0.8);
MainMenuBar:SetScale(0.8);

MainMenuBarLeftEndCap:SetTexture("Interface\\AddOns\\aesyr\\skull-left-small.tga");
MainMenuBarLeftEndCap:ClearAllPoints();
MainMenuBarLeftEndCap:SetPoint("RIGHT", MainMenuBar, "LEFT", 10, 33);
MainMenuBarLeftEndCap:SetWidth(256);
MainMenuBarLeftEndCap:SetHeight(129);

MainMenuBarRightEndCap:SetTexture("Interface\\AddOns\\aesyr\\skull-left-small.tga");
MainMenuBarRightEndCap:ClearAllPoints();
MainMenuBarRightEndCap:SetPoint("LEFT", MainMenuBar, "RIGHT", -10, 33);
MainMenuBarRightEndCap:SetWidth(256);
MainMenuBarRightEndCap:SetHeight(129);

-- fix for the scale fix! (we don't give a shit if people have AutoScale set to true ..the MainMenuBar is so huge, it needs to be scaled all the way down
--[[local scalefixfix = CreateFrame("Frame")
scalefixfix:RegisterEvent("PLAYER_LOGIN")
scalefixfix:SetScript("OnEvent", function() 
	SetCVar("useUiScale", 1);
	SetCVar("uiScale", 0.6);
end);
]]

-- /script Quartz:AcquireDBNamespace("Player").profile.texture = "LiteStep";
-- /script print(Quartz:AcquireDBNamespace("Player").profile.texture);

-- todo: quartz buff bar width/text size

local qmodules = {
	'Pet',
	'Buff',
	'Player',
};
for _, q in pairs(qmodules) do
	qt = Quartz:AcquireDBNamespace(q).profile
	if q == 'Buff' then
		qt.bufftexture = 'Flat';
	else
		qt.texture = 'Flat';
	end
	
	if q == 'Player' then
		qt.x = 833;
		qt.y = 290;
	end	
end

Quartz:ToggleModuleActive('Target', false);
Quartz:ToggleModuleActive('Focus', false);
Quartz:ToggleModuleActive('Swing', false);
Quartz.ApplySettings();

print('Aesyr Theme for Tukui loaded.');
