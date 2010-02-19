LoadAddOn('Quartz');
local Quartz3 = LibStub("AceAddon-3.0"):GetAddon("Quartz3")
local qmodules = {
	'Pet',
	'Buff',
	'Player',
};
for _, q in pairs(qmodules) do
	qt = Quartz3.db:GetNamespace(q).profile
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
Quartz3:ApplySettings();
