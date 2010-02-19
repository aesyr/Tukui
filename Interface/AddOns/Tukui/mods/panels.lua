Stats = CreateFrame("Frame")
Stats.TTSpacing = 1
local statColor = { }
local tpanelsDB

FONT 				= "fonts\\ARIALN.ttf"

--------------------------------------------------------------------
-- INFOS LEFT
--------------------------------------------------------------------

	local ileft = CreateFrame("Frame", infoleft, UIParent)
	ileft:SetFrameLevel(2)
	ileft:SetFrameStrata("background")
	ileft:SetHeight(23)
	ileft:SetWidth(tinfowidth)
	ileft:SetPoint("bottomleft",14,18)
	ileft:SetScale(1)
	
	ileft:SetBackdrop( { 
	  bgFile = BLANK_TEXTURE, 
	  edgeFile = BLANK_TEXTURE, 
	  tile = false, tileSize = 0, edgeSize = 1, 
	  insets = { left = -1, right = -1, top = -1, bottom = -1 }
	})
	ileft:SetBackdropColor(.1,.1,.1,1)
	ileft:SetBackdropBorderColor(unpack(TUKUI_BORDER_COLOR))


--------------------------------------------------------------------
-- INFOS RIGHT
--------------------------------------------------------------------

	local iright = CreateFrame("Frame", inforight, UIParent)
	iright:SetFrameLevel(2)
	iright:SetFrameStrata("background")
	iright:SetHeight(23)
	iright:SetWidth(tinfowidth)
	iright:SetPoint("bottomright",-14,18)
	iright:SetScale(1)
	
	iright:SetBackdrop( { 
	  bgFile = BLANK_TEXTURE, 
	  edgeFile = BLANK_TEXTURE, 
	  tile = false, tileSize = 0, edgeSize = 1, 
	  insets = { left = -1, right = -1, top = -1, bottom = -1 }
	})
	iright:SetBackdropColor(.1,.1,.1,1)
	iright:SetBackdropBorderColor(unpack(TUKUI_BORDER_COLOR))


--------------------------------------------------------------------
-- CHAT BACKGROUND
--------------------------------------------------------------------

	local chatbg = CreateFrame("Frame", chatbackground, UIParent)
	chatbg:SetFrameLevel(2)
	chatbg:SetFrameStrata("background")
	chatbg:SetHeight(120)
	chatbg:SetWidth(tinfowidth)
	chatbg:SetPoint("bottomleft", ileft, "topleft", 0, -1)
		
	chatbg:SetBackdrop( { 
	  bgFile = BLANK_TEXTURE, 
	  edgeFile = BLANK_TEXTURE, 
	  tile = false, tileSize = 0, edgeSize = 1, 
	  insets = { left = -1, right = -1, top = -1, bottom = -1 }
	})
	chatbg:SetBackdropColor(.1,.1,.1,1)
	chatbg:SetBackdropBorderColor(unpack(TUKUI_BORDER_COLOR))
	
--------------------------------------------------------------------
-- CHATEDITBOX
--------------------------------------------------------------------

	local ceb = CreateFrame("Frame", chateditbox, ChatFrameEditBox)
	ceb:SetFrameLevel(2)
	ceb:SetFrameStrata("HIGH")
	ceb:SetHeight(23)
	ceb:SetPoint("TOPLEFT", ChatFrameEditBox, "BOTTOMLEFT", 3, 27)
	ceb:SetPoint("TOPRIGHT", ChatFrameEditBox, "BOTTOMRIGHT", -4, 27)
	ceb:SetScale(1)
	
	ceb:SetBackdrop( { 
	  bgFile = BLANK_TEXTURE, 
	  edgeFile = BLANK_TEXTURE, 
	  tile = false, tileSize = 0, edgeSize = 1, 
	  insets = { left = -1, right = -1, top = -1, bottom = -1 }
	})
	ceb:SetBackdropColor(.1,.1,.1,1)
	
	-- idea from haleth
	-- above code was "stolen" from neonchat
	-- credit to neonchat and mikma
	local function colorize(r,g,b)
		ceb:SetBackdropBorderColor(r,g,b)
	end

	hooksecurefunc("ChatEdit_UpdateHeader", function()
      local type = DEFAULT_CHAT_FRAME.editBox:GetAttribute("chatType")
         if ( type == "CHANNEL" ) then
            local id = GetChannelName(DEFAULT_CHAT_FRAME.editBox:GetAttribute("channelTarget"))
            if id == 0 then   colorize(0.6,0.6,0.6)
            else colorize(ChatTypeInfo[type..id].r,ChatTypeInfo[type..id].g,ChatTypeInfo[type..id].b)
            end
         else colorize(ChatTypeInfo[type].r,ChatTypeInfo[type].g,ChatTypeInfo[type].b)
         end
    end)
	
----------------------------------------------------------------------------------------
-- panel for stat #7 and #8
----------------------------------------------------------------------------------------


local statpanel7 = CreateFrame("frame",leftrectanglelol, Minimap)
	statpanel7:SetFrameLevel(2)
	statpanel7:SetFrameStrata("BACKGROUND")
	statpanel7:SetHeight(20)
	statpanel7:SetWidth(70)
	statpanel7:SetPoint("TOPLEFT", Minimap,"BOTTOMLEFT",-2,-5)
	statpanel7:SetScale(1)
	statpanel7:SetBackdrop( {
		bgFile = BLANK_TEXTURE,
		edgeFile = BLANK_TEXTURE,
		tile = false, tileSize = 0, edgeSize = 1,
		insets = { left = -1, right = -1, top = -1, bottom = -1 }
	})
	statpanel7:SetBackdropColor(.1,.1,.1,1)
	statpanel7:SetBackdropBorderColor(unpack(TUKUI_BORDER_COLOR))
	

	local statpanel8 = CreateFrame("frame",rightrectanglelol, Minimap)
	statpanel8:SetFrameLevel(2)
	statpanel8:SetFrameStrata("BACKGROUND")
	statpanel8:SetHeight(20)
	statpanel8:SetWidth(70)
	statpanel8:SetPoint("TOPRIGHT", Minimap,"BOTTOMRIGHT",2,-5)
	statpanel8:SetScale(1)
	statpanel8:SetBackdrop( {
		bgFile = BLANK_TEXTURE,
		edgeFile = BLANK_TEXTURE,
		tile = false, tileSize = 0, edgeSize = 1,
		insets = { left = -1, right = -1, top = -1, bottom = -1 }
	})
	statpanel8:SetBackdropColor(.1,.1,.1,1)
	statpanel8:SetBackdropBorderColor(unpack(TUKUI_BORDER_COLOR))

	
	local linemiddle7to8 = CreateFrame("Frame", line7to8, Minimap)
	linemiddle7to8:SetFrameLevel(0)
	linemiddle7to8:SetFrameStrata("BACKGROUND")
	linemiddle7to8:SetHeight(2)
	linemiddle7to8:SetWidth(14)
	linemiddle7to8:SetPoint("TOP", Minimap,"BOTTOM",0,-14)
	linemiddle7to8:SetScale(1)
	linemiddle7to8:SetBackdrop( {
		bgFile = BLANK_TEXTURE,
		edgeFile = BLANK_TEXTURE,
		tile = false, tileSize = 0, edgeSize = 1,
		insets = { left = -1, right = -1, top = -1, bottom = -1 }
	})
	linemiddle7to8:SetBackdropColor(.1,.1,.1,1)
	linemiddle7to8:SetBackdropBorderColor(unpack(TUKUI_BORDER_COLOR))

--------------------------------------------------------------------
-- CREDIT: FatalEntity for some part of this code
--------------------------------------------------------------------	
local L = GetLocale()

local function panel_setpoint(p, obj)
	if p == 1 then
		obj:SetPoint("LEFT", ileft, "LEFT", 30, 1)
	elseif p == 2 then
		obj:SetPoint("CENTER", ileft, "CENTER", 0, 1)
	elseif p == 3 then
		obj:SetPoint("RIGHT", ileft, "RIGHT", -30, 1)
	elseif p == 4 then
		obj:SetPoint("LEFT", iright, "LEFT", 30, 1)
	elseif p == 5 then
		obj:SetPoint("CENTER", iright, "CENTER", 0, 1)
	elseif p == 6 then
		obj:SetPoint("RIGHT", iright, "RIGHT", -30, 1)
	elseif p == 7 then
		obj:SetPoint("CENTER", statpanel7, "CENTER", 0, .5)
	elseif p == 8 then
		obj:SetPoint("CENTER", statpanel8, "CENTER", 0, .5)
	end
end
--------------------------------------------------------------------
-- FPS
--------------------------------------------------------------------

if fps_ms > 0 then
	local Stat1 = CreateFrame("Frame")

	local Text  = ileft:CreateFontString(nil, "OVERLAY")
	Text:SetFont(FONT, tfontsize)
	panel_setpoint(fps_ms, Text)
	Text:SetHeight(26)

	local int = 1
	local function Update(self, t)
		int = int - t
		if int < 0 then
			if(L=="ruRU") then
				Text:SetText(floor(GetFramerate()).." |cffffffffк/с || |r"..select(3, GetNetStats()).." |cffffffffмс|r")
			elseif(L=="frFR") then
				Text:SetText(floor(GetFramerate()).." |cffffffffips & |r"..select(3, GetNetStats()).." |cffffffffms|r")
			elseif(L=="deDE") then
				Text:SetText(floor(GetFramerate()).." |cffffffffbps & |r"..select(3, GetNetStats()).." |cffffffffms|r")
			else
				Text:SetText(floor(GetFramerate()).." |cfffffffffps & |r"..select(3, GetNetStats()).." |cffffffffms|r")
			end
			int = 1
		end
		
	end

	Stat1:SetScript("OnUpdate", Update) 
	Update(Stat1, 10)
end


--------------------------------------------------------------------
-- MEM
--------------------------------------------------------------------

if mem > 0 then
	local Stat2 = CreateFrame("Frame")
	Stat2:EnableMouse(true)

	local Text  = ileft:CreateFontString(nil, "OVERLAY")
	Text:SetFont(FONT, tfontsize)
	panel_setpoint(mem, Text)
	Text:SetHeight(26)

	local function formatMem(memory, color)
		if color then
			statColor = { "", "" }
		else
			statColor = { "", "" }
		end

		local mult = 10^1
		if memory > 999 then
			local mem = floor((memory/1024) * mult + 0.5) / mult
			if(L=="ruRU") then
				if mem % 1 == 0 then
					return mem..string.format(".0 %sМб%s", unpack(statColor))
				else
					return mem..string.format(" %sМб%s", unpack(statColor))
				end
			elseif(L=="frFR") then
				if mem % 1 == 0 then
					return mem..string.format(".0 %smo%s", unpack(statColor))
				else
					return mem..string.format(" %smo%s", unpack(statColor))
				end		
			else
				if mem % 1 == 0 then
					return mem..string.format(".0 %smb%s", unpack(statColor))
				else
					return mem..string.format(" %smb%s", unpack(statColor))
				end
			end
		else
			local mem = floor(memory * mult + 0.5) / mult
			if(L=="ruRU") then
				if mem % 1 == 0 then
					return mem..string.format(".0 %sКб%s", unpack(statColor))
				else
					return mem..string.format(" %sКб%s", unpack(statColor))
				end	
			elseif(L=="frFR") then
				if mem % 1 == 0 then
					return mem..string.format(".0 %sko%s", unpack(statColor))
				else
					return mem..string.format(" %sko%s", unpack(statColor))
				end			
			else
				if mem % 1 == 0 then
					return mem..string.format(".0 %skb%s", unpack(statColor))
				else
					return mem..string.format(" %skb%s", unpack(statColor))
				end
			end
		end

	end

	local Total, Mem, MEMORY_TEXT, LATENCY_TEXT, Memory
	local function RefreshMem(self)
		Memory = {}
		UpdateAddOnMemoryUsage()
		Total = 0
		for i = 1, GetNumAddOns() do
			Mem = GetAddOnMemoryUsage(i)
			Memory[i] = { select(2, GetAddOnInfo(i)), Mem, IsAddOnLoaded(i) }
			Total = Total + Mem
		end
		
		MEMORY_TEXT = formatMem(Total, true)
		table.sort(Memory, function(a, b)
			if a and b then
				return a[2] > b[2]
			end
		end)
		
		-- Setup Memory tooltip
		self:SetAllPoints(Text)
		self:SetScript("OnEnter", function()
			if not InCombatLockdown() then
				GameTooltip:SetOwner(this, "ANCHOR_NONE");
				GameTooltip:ClearAllPoints()
				GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, Stats.TTSpacing)
				GameTooltip:ClearLines()
				for i = 1, #Memory do
					if Memory[i][3] then 
						local red = Memory[i][2]/Total*2
						local green = 1 - red
						GameTooltip:AddDoubleLine(Memory[i][1], formatMem(Memory[i][2], false), 1, 1, 1, red, green+1, 0)						
					end
				end
				GameTooltip:Show()
			end
		end)
		self:SetScript("OnLeave", function() GameTooltip:Hide() end)
	end

	local int, int2 = 5, 1
	local function Update(self, t)
		int = int - t
		int2 = int2 - t
		if int < 0 then
			RefreshMem(self)
			int = 5
		end
		if int2 < 0 then
			Text:SetText(MEMORY_TEXT)
			int2 = 1
		end
	end

	Stat2:SetScript("OnMouseDown", function() collectgarbage("collect") Update(Stat2, 10) end)
	Stat2:SetScript("OnUpdate", Update) 
	Update(Stat2, 10)
end

--------------------------------------------------------------------
-- GUILD ROSTER
--------------------------------------------------------------------
	
if guild > 0 then
	local Stat3 = CreateFrame("Frame")
	Stat3:EnableMouse(true)
	
	local tthead = {r=0.4,g=0.78,b=1}
	local ttsubh = {r=0.75,g=0.9,b=1}

	local Text  = ileft:CreateFontString(nil, "OVERLAY")
	Text:SetFont(FONT, tfontsize)
	panel_setpoint(guild, Text)
	Text:SetHeight(26)

	local function Update(self, event, ...)	
		if IsInGuild() then
			GuildRoster()
			local numOnline = (GetNumGuildMembers())			
			self:SetAllPoints(Text)
			Text:SetText(tp_guild .. ": " .. numOnline)
		else
			Text:SetText(tp_noguild)
		end
	end
		
	Stat3:RegisterEvent("GUILD_ROSTER_SHOW")
	Stat3:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat3:RegisterEvent("GUILD_ROSTER_UPDATE")
	Stat3:RegisterEvent("PLAYER_GUILD_UPDATE")
	Stat3:RegisterEvent("FRIENDLIST_UPDATE")
	Stat3:RegisterEvent("CHAT_MSG_SYSTEM")
	Stat3:SetScript("OnEnter", function(self)
		if not InCombatLockdown() then
			if IsInGuild() then
				self.hovered = true
				GuildRoster()
				local name, rank, level, zone, note, officernote, connected, status, class, zone_r, zone_g, zone_b, classc, levelc
				local online, total, gmotd = 0, GetNumGuildMembers(true), GetGuildRosterMOTD()
				for i = 0, total do if select(9, GetGuildRosterInfo(i)) then online = online + 1 end end
				
				GameTooltip:SetOwner(this, "ANCHOR_NONE");
				GameTooltip:ClearAllPoints()
				GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, Stats.TTSpacing)
				GameTooltip:ClearLines()
				GameTooltip:AddDoubleLine(GetGuildInfo'player',format("%s: %d/%d",tp_guild,online,total),tthead.r,tthead.g,tthead.b,tthead.r,tthead.g,tthead.b)
				GameTooltip:AddLine' '
				if gmotd ~= "" then GameTooltip:AddLine(format("  %s |cffaaaaaa- |cffffffff%s",GUILD_MOTD,gmotd),ttsubh.r,ttsubh.g,ttsubh.b,1) end
				if online > 1 then
					GameTooltip:AddLine' '
					for i = 1, total do
						if online <= 1 then
							if online > 1 then GameTooltip:AddLine(format("+ %d More...", online - modules.Guild.maxguild),ttsubh.r,ttsubh.g,ttsubh.b) end
							break
						end
						-- name, rank, rankIndex, level, class, zone, note, officernote, online, status, classFileName
						name, rank, _, level, _, zone, note, officernote, connected, status, class = GetGuildRosterInfo(i)
						if connected and name ~= UnitName'player' then
							if GetRealZoneText() == zone then zone_r, zone_g, zone_b = 0.3, 1.0, 0.3 else zone_r, zone_g, zone_b = 0.65, 0.65, 0.65 end
							classc, levelc = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class], GetQuestDifficultyColor(level)
							if IsShiftKeyDown() then
								GameTooltip:AddDoubleLine(name.." |cff999999- |cffffffff"..rank,zone,classc.r,classc.g,classc.b,zone_r,zone_g,zone_b)
								if note ~= "" then GameTooltip:AddLine('  "'..note..'"',ttsubh.r,ttsubh.g,ttsubh.b,1) end
								if officernote ~= "" then GameTooltip:AddLine("  o: "..officernote,0.3,1,0.3,1) end
							else
								GameTooltip:AddDoubleLine(format("|cff%02x%02x%02x%d|r %s%s",levelc.r*255,levelc.g*255,levelc.b*255,level,name,' '..status),zone,classc.r,classc.g,classc.b,zone_r,zone_g,zone_b)
							end
						end
					end
				end
				GameTooltip:Show()
			end
		end
	end)
	Stat3:SetScript("OnLeave", function() GameTooltip:Hide() end)
	Stat3:SetScript("OnMouseDown", function() ToggleFriendsFrame(3) end)
	Stat3:SetScript("OnEvent", Update)
end


--------------------------------------------------------------------
 -- BAGS
--------------------------------------------------------------------

if bags > 0 then
    local Stat4 = CreateFrame("Frame")
    Stat4:EnableMouse(true)

    local Text  = ileft:CreateFontString(nil, "OVERLAY")
    Text:SetFont(FONT, tfontsize)
    panel_setpoint(bags, Text)
    Text:SetHeight(26)

	local function OnEvent(self, event, ...)
			local free, total,used = 0, 0, 0
			for i = 0, NUM_BAG_SLOTS do
				free, total = free + GetContainerNumFreeSlots(i), total + GetContainerNumSlots(i)
			end
			used = total - free
			Text:SetText(tp_bags..used.."/"..total)
			self:SetAllPoints(Text)
	end
          
    Stat4:RegisterEvent("PLAYER_LOGIN")
    Stat4:RegisterEvent("BAG_UPDATE")
    Stat4:SetScript("OnEvent", OnEvent)
    Stat4:SetScript("OnMouseDown", function() OpenAllBags() end)
end


--------------------------------------------------------------------
-- FRIEND
--------------------------------------------------------------------
	
if friends > 0 then
	local Stat5 = CreateFrame("Frame")
	Stat5:EnableMouse(true)
	
	local tthead = {r=0.4,g=0.78,b=1}
	local ttsubh = {r=0.75,g=0.9,b=1}

	local Text  = ileft:CreateFontString(nil, "OVERLAY")
	Text:SetFont(FONT, tfontsize)
	panel_setpoint(friends, Text)
	Text:SetHeight(26)

	local function Update(self, event)
			local online, total = 0, GetNumFriends()
			for i = 0, total do if select(5, GetFriendInfo(i)) then online = online + 1 end end
			Text:SetText(tp_friends..": "..online)
			self:SetAllPoints(Text)
	end

	Stat5:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat5:RegisterEvent("FRIENDLIST_UPDATE")
	Stat5:RegisterEvent("CHAT_MSG_SYSTEM")
	Stat5:SetScript("OnMouseDown", function() ToggleFriendsFrame(1) end)
	Stat5:SetScript("OnEnter", function(self)
		if not InCombatLockdown() then
			ShowFriends()
			self.hovered = true
			local online, total = 0, GetNumFriends()
			local name, level, class, zone, connected, status, note, classc, levelc, zone_r, zone_g, zone_b, grouped
			for i = 0, total do if select(5, GetFriendInfo(i)) then online = online + 1 end end
			if online > 0 then
				GameTooltip:SetOwner(this, "ANCHOR_NONE");
				GameTooltip:ClearAllPoints()
				GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, Stats.TTSpacing)
				GameTooltip:ClearLines()
				GameTooltip:AddDoubleLine(tp_friendlist, format(tp_online .. "%s/%s",online,total),tthead.r,tthead.g,tthead.b,tthead.r,tthead.g,tthead.b)
				GameTooltip:AddLine' '
				-- name, level, class, area, connected, status, note
				for i = 1, total do
					name, level, class, zone, connected, status, note = GetFriendInfo(i)
					if not connected then break end
					if GetRealZoneText() == zone then zone_r, zone_g, zone_b = 0.3, 1.0, 0.3 else zone_r, zone_g, zone_b = 0.65, 0.65, 0.65 end
					for k,v in pairs(LOCALIZED_CLASS_NAMES_MALE) do if class == v then class = k end end
					if GetLocale() ~= "enUS" then -- feminine class localization (unsure if it's really needed)
						for k,v in pairs(LOCALIZED_CLASS_NAMES_FEMALE) do if class == v then class = k end end
					end
					classc, levelc = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class], GetQuestDifficultyColor(level)
					if UnitInParty(name) or UnitInRaid(name) then grouped = "|cffaaaaaa*|r" else grouped = "" end
					GameTooltip:AddDoubleLine(format("|cff%02x%02x%02x%d|r %s%s%s",levelc.r*255,levelc.g*255,levelc.b*255,level,name,grouped," "..status),zone,classc.r,classc.g,classc.b,zone_r,zone_g,zone_b)
					if self.altdown and note then GameTooltip:AddLine("  "..note,ttsubh.r,ttsubh.g,ttsubh.b,1) end
				end
				GameTooltip:Show()
			else GameTooltip:Hide() end
		end
	end)

	Stat5:SetScript("OnLeave", function() GameTooltip:Hide() end)
	Stat5:SetScript("OnEvent", Update)
end

--------------------------------------------------------------------
-- DURABILITY
--------------------------------------------------------------------
	
if armor > 0 then
	local Stat6 = CreateFrame("Frame")
	Stat6:EnableMouse(true)

	local Text  = iright:CreateFontString(nil, "OVERLAY")
	Text:SetFont(FONT, tfontsize)
	panel_setpoint(armor, Text)
	Text:SetHeight(26)

	local Total = 0
	local current, max

	local function OnEvent(self)
		for i = 1, 11 do
			if GetInventoryItemLink("player", Slots[i][1]) ~= nil then
				current, max = GetInventoryItemDurability(Slots[i][1])
				if current then 
					Slots[i][3] = current/max
					Total = Total + 1
				end
			end
		end
		table.sort(Slots, function(a, b) return a[3] < b[3] end)
		
		if Total > 0 then
			Text:SetText(floor(Slots[1][3]*100).."% |cffffffff"..tp_armor.."|r")
		else
			Text:SetText("100% |cffffffff"..tp_armor.."|r")
		end
		-- Setup Durability Tooltip
		self:SetAllPoints(Text)
		self:SetScript("OnEnter", function()
			if not InCombatLockdown() then
				GameTooltip:SetOwner(this, "ANCHOR_NONE");
				GameTooltip:ClearAllPoints()
				GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, Stats.TTSpacing)
				GameTooltip:ClearLines()
				for i = 1, 11 do
					if Slots[i][3] ~= 1000 then
						green = Slots[i][3]*2
						red = 1 - green
						GameTooltip:AddDoubleLine(Slots[i][2], floor(Slots[i][3]*100).."%",1 ,1 , 1, red + 1, green, 0)
					end
				end
				GameTooltip:Show()
			end
		end)
		self:SetScript("OnLeave", function() GameTooltip:Hide() end)
		Total = 0
	end

	Stat6:RegisterEvent("UPDATE_INVENTORY_DURABILITY")
	Stat6:RegisterEvent("MERCHANT_SHOW")
	Stat6:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat6:SetScript("OnMouseDown", function() ToggleCharacter("PaperDollFrame") end)
	Stat6:SetScript("OnEvent", OnEvent)
end

--------------------------------------------------------------------
-- GOLD
--------------------------------------------------------------------

if gold > 0 then
	local Stat7 = CreateFrame("Frame")
	Stat7:EnableMouse(true)

	local Text  = iright:CreateFontString(nil, "OVERLAY")
	Text:SetFont(FONT, tfontsize)
	panel_setpoint(gold, Text)
	Text:SetHeight(26)

	local Profit	= 0
	local Spent		= 0
	local OldMoney	= 0

	local function formatMoney(money)
		local gold = floor(math.abs(money) / 10000)
		local silver = mod(floor(math.abs(money) / 100), 100)
		local copper = mod(floor(math.abs(money)), 100)
		if(L=="frFR") then
			if gold ~= 0 then
				return format("%s|cffffd700po|r %s|cffc7c7cfpa|r %s|cffeda55fpc|r", gold, silver, copper)
			elseif silver ~= 0 then
				return format("%s|cffc7c7cfpa|r %s|cffeda55fpc|r", silver, copper)
			else
				return format("%s|cffeda55f pc|r", copper)
			end
		 elseif(L=="deDE") then
			if gold ~= 0 then
				return format("%s|cffffd700g|r %s|cffc7c7cfs|r %s|cffeda55fk|r", gold, silver, copper)
			elseif silver ~= 0 then
				return format("%s|cffc7c7cfs|r %s|cffeda55fk|r", silver, copper)
			else
				return format("%s|cffeda55f k|r", copper)
			end			
		 elseif(L=="ruRU") then
			 if gold ~= 0 then
				return format("%s|cffffd700з|r %s|cffc7c7cfс|r %s|cffeda55fм|r", gold, silver, copper)
			 elseif silver ~= 0 then
				return format("%s|cffc7c7cfс|r %s|cffeda55fм|r", silver, copper)
			 else
				return format("%s|cffeda55fм|r", copper)
			 end
		else
			if gold ~= 0 then
				return format("%s|cffffd700g|r %s|cffc7c7cfs|r %s|cffeda55fc|r", gold, silver, copper)
			elseif silver ~= 0 then
				return format("%s|cffc7c7cfs|r %s|cffeda55fc|r", silver, copper)
			else
				return format("%s|cffeda55f c|r", copper)
			end
		end
	end

	local function FormatTooltipMoney(money)
		local gold, silver, copper = abs(money / 10000), abs(mod(money / 100, 100)), abs(mod(money, 100))
		local cash = ""
		
		if(L=="frFR") then
			cash = format("%d|cffffd700po|r %d|cffc7c7cfpa|r %d|cffeda55fpc|r", gold, silver, copper)
		elseif(L=="deDE") then
			cash = format("%d|cffffd700g|r %d|cffc7c7cfs|r %d|cffeda55fk|r", gold, silver, copper)
		elseif(L=="ruRU") then
			cash = format("%d|cffffd700з|r %d|cffc7c7cfс|r %d|cffeda55fм|r", gold, silver, copper)
		else
			cash = format("%d|cffffd700g|r %d|cffc7c7cfs|r %d|cffeda55fc|r", gold, silver, copper)
		end
		
		return cash
	end	

	local function OnEvent(self, event)
		if event == "PLAYER_ENTERING_WORLD" then
			OldMoney = GetMoney()
		end
		
		local NewMoney	= GetMoney()
		local Change = NewMoney-OldMoney -- Positive if we gain money
		
		if OldMoney>NewMoney then		-- Lost Money
			Spent = Spent - Change
		else							-- Gained Moeny
			Profit = Profit + Change
		end
		
		Text:SetText(formatMoney(NewMoney))
		-- Setup Money Tooltip
		self:SetAllPoints(Text)
		self:SetScript("OnEnter", function()
			if not InCombatLockdown() then
				self.hovered = true 
				GameTooltip:SetOwner(this, "ANCHOR_NONE");
				GameTooltip:ClearAllPoints()
				GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, Stats.TTSpacing)
				GameTooltip:ClearLines()
				GameTooltip:AddLine(tp_session)
				GameTooltip:AddDoubleLine(tp_earned, formatMoney(Profit), 1, 1, 1, 1, 1, 1)
				GameTooltip:AddDoubleLine(tp_spent, formatMoney(Spent), 1, 1, 1, 1, 1, 1)
				if Profit < Spent then
					GameTooltip:AddDoubleLine(tp_deficit, formatMoney(Profit-Spent), 1, 0, 0, 1, 1, 1)
				elseif (Profit-Spent)>0 then
					GameTooltip:AddDoubleLine(tp_profit, formatMoney(Profit-Spent), 0, 1, 0, 1, 1, 1)
				end				
				GameTooltip:AddLine' '								
				local myPlayerRealm = GetCVar("realmName");
				local myPlayerName  = UnitName("player");				
				if (tgoldDB == nil) then tgoldDB = {}; end
				if (tgoldDB[myPlayerRealm]==nil) then tgoldDB[myPlayerRealm]={}; end
				tgoldDB[myPlayerRealm][myPlayerName] = GetMoney();				
				local totalGold = 0				
				GameTooltip:AddLine(tp_character)				
				local thisRealmList = tgoldDB[myPlayerRealm];
				for k,v in pairs(thisRealmList) do
					GameTooltip:AddDoubleLine(k, FormatTooltipMoney(v), 1, 1, 1, 1, 1, 1)
					totalGold=totalGold+v;
				end 
				GameTooltip:AddLine' '
				GameTooltip:AddLine(tp_server)
				GameTooltip:AddDoubleLine(tp_totalgold, FormatTooltipMoney(totalGold), 1, 1, 1, 1, 1, 1)
				
				local numWatched = GetNumWatchedTokens()
				if numWatched > 0 then
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine(tp_currency)
					
					for i = 1, numWatched do
						local name, count, extraCurrencyType, icon, itemID = GetBackpackCurrencyInfo(i)
						local r, g, b, hex = GetItemQualityColor(select(3, GetItemInfo(itemID)))

						GameTooltip:AddDoubleLine(name, count, r, g, b, 1, 1, 1)
					end					
				end
				GameTooltip:Show()
			end
		end)
		self:SetScript("OnLeave", function() GameTooltip:Hide() end)
		
		OldMoney = NewMoney
	end

	Stat7:RegisterEvent("PLAYER_MONEY")
	Stat7:RegisterEvent("SEND_MAIL_MONEY_CHANGED")
	Stat7:RegisterEvent("SEND_MAIL_COD_CHANGED")
	Stat7:RegisterEvent("PLAYER_TRADE_MONEY")
	Stat7:RegisterEvent("TRADE_MONEY_CHANGED")
	Stat7:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat7:SetScript("OnMouseDown", function() OpenAllBags() end)
	Stat7:SetScript("OnEvent", OnEvent)
end

--------------------------------------------------------------------
-- TIME
--------------------------------------------------------------------

if wowtime > 0 then
   local Stat8 = CreateFrame("Frame")
   Stat8:EnableMouse(true)

   local Text  = iright:CreateFontString(nil, "OVERLAY")
   Text:SetFont(FONT, tfontsize)
   panel_setpoint(wowtime, Text)
   Text:SetHeight(26)

   local int = 1
   local function Update(self, t)
      local pendingCalendarInvites = CalendarGetNumPendingInvites()
         int = int - t
         if int < 0 then
            if localtime == true then
               Hr24 = tonumber(date("%H"))
               Hr = tonumber(date("%I"))
               Min = date("%M")
               if time24 == true then
                  if pendingCalendarInvites > 0 then
                     Text:SetText("|cffFF0000"..Hr24..":"..Min)
                  else
                     Text:SetText(Hr24..":"..Min)
                  end
               else
               if Hr24>=12 then
                  if pendingCalendarInvites > 0 then
                     Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffffpm|r")
                  else
                     Text:SetText(Hr..":"..Min.." |cffffffffpm|r")
                  end
               else
                  if pendingCalendarInvites > 0 then
                     Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffffam|r")
                  else
                     Text:SetText(Hr..":"..Min.." |cffffffffam|r")
                  end
               end
            end
         else
            local Hr, Min = GetGameTime()
            if Hr == 0 then Hr = 12 end
            if Min<10 then Min = "0"..Min end
            if time24 == true then         
               Text:SetText(Hr..":"..Min.." |cffffffff|r")
            else             
               if Hr>=12 then
                 Hr = Hr-12
                 if pendingCalendarInvites > 0 then
                  Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffffpm|r")
                 else
                  Text:SetText(Hr..":"..Min.." |cffffffffpm|r")
                 end
               else
                 if pendingCalendarInvites > 0 then
                  Text:SetText("|cffFF0000"..Hr..":"..Min.." |cffffffffam|r")
                 else
                  Text:SetText(Hr..":"..Min.." |cffffffffam|r")
                 end
               end
            end
         end
         self:SetAllPoints(Text)
         int = 1
         end
   end

   Stat8:SetScript("OnEnter", function(self)
   OnLoad = function(self) RequestRaidInfo() end,

               GameTooltip:SetOwner(this, "ANCHOR_NONE");
               GameTooltip:ClearAllPoints()
               GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, Stats.TTSpacing)
               GameTooltip:ClearLines()
               local wgtime = GetWintergraspWaitTime() or nil
               inInstance, instanceType = IsInInstance()
               if not ( instanceType == "none" ) then
                  wgtime = tp_unavailable
               elseif wgtime == nil then
                  wgtime = tp_inprogress
               else
                  local hour = tonumber(format("%01.f", floor(wgtime/3600)))
                  local min = format(hour>0 and "%02.f" or "%01.f", floor(wgtime/60 - (hour*60)))
                  local sec = format("%02.f", floor(wgtime - hour*3600 - min *60))            
                  wgtime = (hour>0 and hour..":" or "")..min..":"..sec            
               end
			   
               GameTooltip:AddDoubleLine(tp_wg,wgtime)
               local oneraid
                  for i = 1, GetNumSavedInstances() do
                  local name,_,reset,difficulty,locked,extended,_,isRaid,maxPlayers = GetSavedInstanceInfo(i)
                  if isRaid and (locked or extended) then
                     local tr,tg,tb,diff
                  if not oneraid then
					GameTooltip:AddLine(" ")
					GameTooltip:AddLine(tp_savedraid)
                     oneraid = true
               end

               local function fmttime(sec,table)
                  local table = table or {}
                  local d,h,m,s = ChatFrame_TimeBreakDown(floor(sec))
                  local string = gsub(gsub(format(" %dd %dh %dm "..((d==0 and h==0) and "%ds" or ""),d,h,m,s)," 0[dhms]"," "),"%s+"," ")
                  local string = strtrim(gsub(string, "([dhms])", {d=table.days or "d",h=table.hours or "h",m=table.minutes or "m",s=table.seconds or "s"})," ")
                  return strmatch(string,"^%s*$") and "0"..(table.seconds or L"s") or string
               end
                  if extended then tr,tg,tb = 0.3,1,0.3 else tr,tg,tb = 1,1,1 end
                  if difficulty == 3 or difficulty == 4 then diff = "H" else diff = "N" end
                  GameTooltip:AddDoubleLine(format("%s |cffaaaaaa(%s%s)",name,maxPlayers,diff),fmttime(reset),1,1,1,tr,tg,tb)
               end
            end

               GameTooltip:Show()
            end)
   Stat8:SetScript("OnLeave", function() GameTooltip:Hide() end)
   Stat8:RegisterEvent("CALENDAR_UPDATE_PENDING_INVITES")
   Stat8:RegisterEvent("PLAYER_ENTERING_WORLD")
   Stat8:SetScript("OnUpdate", Update)
   Stat8:RegisterEvent'UPDATE_INSTANCE_INFO'
   Stat8:SetScript("OnMouseDown", function() GameTimeFrame:Click() end)
   Update(Stat8, 10)
end

--------------------------------------------------------------------
-- player sp
--------------------------------------------------------------------

if playersp > 0 then
   local Stat9 = CreateFrame("Frame")

   local Text  = ileft:CreateFontString(nil, "OVERLAY")
   Text:SetFont(FONT, tfontsize)
   panel_setpoint(playersp, Text)
   Text:SetHeight(26)
   
   local int = 1

   local function Update(self, t)
      int = int - t
      if int < 0 then
         Text:SetText(GetSpellBonusDamage(7) .. " " .. tp_playersp)
         int = 1
      end
     
   end

   Stat9:SetScript("OnUpdate", Update)
   Update(Stat9, 10)
end

--------------------------------------------------------------------
-- player ap
--------------------------------------------------------------------

if playerap > 0 then
   local Stat10 = CreateFrame("Frame")

   local Text  = ileft:CreateFontString(nil, "OVERLAY")
   Text:SetFont(FONT, tfontsize)
   panel_setpoint(playerap, Text)
   Text:SetHeight(26)
   
   local int = 1

   local function Update(self, t)
      int = int - t
      if int < 0 then
         local base, posBuff, negBuff = UnitAttackPower("player");
         local effective = base + posBuff + negBuff;
         Text:SetText(effective .. " " .. tp_playerap)
         int = 1
      end
     
   end

   Stat10:SetScript("OnUpdate", Update)
   Update(Stat10, 10)
end

--------------------------------------------------------------------
-- player haste
--------------------------------------------------------------------

if playerhaste > 0 then
   local Stat11 = CreateFrame("Frame")

   local Text  = ileft:CreateFontString(nil, "OVERLAY")
   Text:SetFont(FONT, tfontsize)
   panel_setpoint(playerhaste, Text)
   Text:SetHeight(26)
   
   local int = 1

   local function Update(self, t)
      int = int - t
      if int < 0 then
         Text:SetText(GetCombatRating(20) .. " " .. tp_playerhaste)
         int = 1
      end     
   end

   Stat11:SetScript("OnUpdate", Update)
   Update(Stat11, 10)
end

--------------------------------------------------------------------
-- player arp
--------------------------------------------------------------------

if playerarp > 0 then
   local Stat12 = CreateFrame("Frame")

   local Text  = ileft:CreateFontString(nil, "OVERLAY")
   Text:SetFont(FONT, tfontsize)
   panel_setpoint(playerarp, Text)
   Text:SetHeight(26)
   
   local int = 1

   local function Update(self, t)
      int = int - t
      if int < 0 then
         Text:SetText(GetCombatRating(25) .. " " .. tp_playerarp)
         int = 1
      end     
   end

   Stat12:SetScript("OnUpdate", Update)
   Update(Stat12, 10)
end

--------------------------------------------------------------------
-- SUPPORT FOR DPS Feed... 
--------------------------------------------------------------------

if dps_text > 0 then
    local events = {SWING_DAMAGE = true, RANGE_DAMAGE = true, SPELL_DAMAGE = true, SPELL_PERIODIC_DAMAGE = true, DAMAGE_SHIELD = true, DAMAGE_SPLIT = true, SPELL_EXTRA_ATTACKS = true}
    local DPS_FEED = CreateFrame("Frame")
    local player_id = UnitGUID("player")
    local dmg_total, last_dmg_amount = 0, 0
    local cmbt_time = 0

    local pet_id = UnitGUID("pet")
     
    dText = ileft:CreateFontString(nil, "OVERLAY")
    dText:SetFont(FONT, tfontsize)
    dText:SetText("0.0 dps")
    dText:SetHeight(26)

    panel_setpoint(dps_text, dText)

    DPS_FEED:EnableMouse(true)
    DPS_FEED:SetHeight(20)
    DPS_FEED:SetWidth(100)
    DPS_FEED:SetAllPoints(dText)

     
    DPS_FEED:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
    DPS_FEED:RegisterEvent("PLAYER_LOGIN")

    DPS_FEED:SetScript("OnUpdate", function(self, elap)
        if UnitAffectingCombat("player") then
			cmbt_time = cmbt_time + elap
        end
       
        dText:SetText(getDPS())
    end)
     
    function DPS_FEED:PLAYER_LOGIN()
		DPS_FEED:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		DPS_FEED:RegisterEvent("PLAYER_REGEN_ENABLED")
		DPS_FEED:RegisterEvent("PLAYER_REGEN_DISABLED")
		DPS_FEED:RegisterEvent("UNIT_PET")
    
		player_id = UnitGUID("player")
       
		DPS_FEED:UnregisterEvent("PLAYER_LOGIN")
    end
     
    function DPS_FEED:UNIT_PET(unit)
		if unit == "player" then
			pet_id = UnitGUID("pet")
		end
	end
     
    -- handler for the combat log. used http://www.wowwiki.com/API_COMBAT_LOG_EVENT for api
    function DPS_FEED:COMBAT_LOG_EVENT_UNFILTERED(...)		   
		-- filter for events we only care about. i.e heals
		if not events[select(2, ...)] then return end

		-- only use events from the player
		local id = select(3, ...)
		   
		if id == player_id or id == pet_id then
			if select(2, ...) == "SWING_DAMAGE" then
				last_dmg_amount = select(9, ...)
			else
				last_dmg_amount = select(12, ...)
			end
			 
			dmg_total = dmg_total + last_dmg_amount
		end       
    end
     
    function getDPS()
        if (dmg_total == 0) then
			return ("0.0 " .. tp_dps)
        else
			return string.format("%.1f " .. tp_dps, (dmg_total or 0) / (cmbt_time or 1))
        end
    end

     
    function DPS_FEED:PLAYER_REGEN_ENABLED()
        dText:SetText(getDPS())
    end
	
	function DPS_FEED:PLAYER_REGEN_DISABLED()
        cmbt_time = 0
        dmg_total = 0
        last_dmg_amount = 0
    end
     
    DPS_FEED:SetScript("OnMouseDown", function (self, button, down)
        cmbt_time = 0
        dmg_total = 0
        last_dmg_amount = 0
    end)
end

--------------------------------------------------------------------
-- SUPPORT FOR HPS Feed... 
--------------------------------------------------------------------

if hps_text > 0 then
  local events = {SPELL_HEAL = true, SPELL_PERIODIC_HEAL = true}
  local HPS_FEED = CreateFrame("Frame")
  local player_id = UnitGUID("player")
  local actual_heals_total, cmbt_time = 0
 
  hText = ileft:CreateFontString(nil, "OVERLAY")
  hText:SetFont(FONT,tfontsize)
  hText:SetText("0.0 hps")
  hText:SetHeight(26)
 
  panel_setpoint(hps_text, hText)
 
  HPS_FEED:EnableMouse(true)
  HPS_FEED:SetHeight(20)
  HPS_FEED:SetWidth(100)
  HPS_FEED:SetAllPoints(hText)
 
  HPS_FEED:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
  HPS_FEED:RegisterEvent("PLAYER_LOGIN")
 
  HPS_FEED:SetScript("OnUpdate", function(self, elap)
      if UnitAffectingCombat("player") then
		HPS_FEED:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        cmbt_time = cmbt_time + elap
	  else
		HPS_FEED:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	  end
	  hText:SetText(get_hps())
  end)
 
  function HPS_FEED:PLAYER_LOGIN()
     HPS_FEED:RegisterEvent("PLAYER_REGEN_ENABLED")
     HPS_FEED:RegisterEvent("PLAYER_REGEN_DISABLED")
 
     player_id = UnitGUID("player")
     
     HPS_FEED:UnregisterEvent("PLAYER_LOGIN")
  end
 
  -- handler for the combat log. used http://www.wowwiki.com/API_COMBAT_LOG_EVENT for api
  function HPS_FEED:COMBAT_LOG_EVENT_UNFILTERED(...)         
     -- filter for events we only care about. i.e heals
     if not events[select(2, ...)] then return end
	 if event == "PLAYER_REGEN_DISABLED" then return end

     -- only use events from the player
     local id = select(3, ...)
     if id == player_id then
       amount_healed = select(12, ...)
       amount_over_healed = select(13, ...)
       -- add to the total the healed amount subtracting the overhealed amount
       actual_heals_total = actual_heals_total + math.max(0, amount_healed - amount_over_healed)
    end
  end
 
  function HPS_FEED:PLAYER_REGEN_ENABLED()
    hText:SetText(get_hps)
  end
   
   function HPS_FEED:PLAYER_REGEN_DISABLED()
    cmbt_time = 0
    actual_heals_total = 0
  end
     
  HPS_FEED:SetScript("OnMouseDown", function (self, button, down)
    cmbt_time = 0
    actual_heals_total = 0
  end)
 
  function get_hps()
    if (actual_heals_total == 0) then
		return ("0.0 " .. tp_hps)
    else
		return string.format("%.1f " .. tp_hps, (actual_heals_total or 0) / (cmbt_time or 1))
    end
  end

end