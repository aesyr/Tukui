-- some shit plugins i need for rogue




	local createAuraWatch = function(self, unit)
		if unit ~= "player" then return end
		-- We only want to create this for the target
		local auras = CreateFrame("Frame", nil, self)
		auras:SetWidth(24)
		auras.SetHeight(128)
		auras:SetPoint("BOTTOM", self, "TOP")
		
		-- A table of spellIDs to create icons for
		-- To find spellIDs, look up a spell on www.wowhead.com and look at the URL
		-- http://www.wowhead.com/?spell=SPELL_ID
		local spellIDs = {
			47436 -- battle shout
		}
		
		auras.presentAlpha = 1
		auras.expiredAlpha = .7
		--auras.PostCreateIcon = myCustomIconSkinnerFunction
		auras.icons = {}
		for i, sid in pairs(spellIDs) do
			local icon = CreateFrame("Frame", nil, auras)
			icon.spellID = sid
			icon:SetWidth(24)
			icon:SetHeight(24)
			icon:SetPoint("BOTTOM", auras, "BOTTOM", 0, 28 * i)
			auras.icons[sid] = icon
		end
		self.AuraWatch = auras
	end
	createAuraWatch()



 
if select(2, UnitClass("Player")) == 'WARRIOR' then
	if not TukuiUF == true then return end
 
	local FONT = "Fonts\\ARIALN.ttf"
 
	local normTex = [=[Interface\Addons\Tukui\media\normTex]=]
	local glowTex = [=[Interface\Addons\Tukui\media\glowTex]=]
	local buttonTex = [=[Interface\Addons\Tukui\media\buttonTex]=]
	local border = [=[Interface\Addons\Tukui\media\border2]=]
 
	local backdrop = {
		bgFile = BLANK_TEXTURE,
		insets = {top = -1, left = -1, bottom = -1, right = -1},
	}
-------------------------------------------------
-- Code start here
-------------------------------------------------
 
	function BarPanel(height, leftinset, rightinset, y, anchorPoint, anchorPointRel, anchor, level, parent, strata, color_r, color_g, color_b)
		local Panel = CreateFrame("Frame", _, parent)
		Panel:SetFrameLevel(level)
		Panel:SetFrameStrata(strata)
		Panel:SetHeight(height)
		Panel:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", leftinset, y)
		Panel:SetPoint(anchorPoint, anchor, anchorPointRel, rightinset, y)
		Panel:SetBackdrop( {
			bgFile = BLANK_TEXTURE,
			insets = { left = 0, right = 0, top = 0, bottom = 0 }
		})
		Panel:SetBackdropColor(0.1, 0.1, 0.1, 1)
		Panel:Show()
		return Panel
	end
 
-- Function to update each bar
	local function UpdateBar(self)
		local duration = self.Duration
		local icon = self.Icon
		self.Bar.Icon:SetTexture(icon)
		local unitCaster = self.unitCaster
		if not unitCaster == "player" then
			self.Panel:Hide()
		end
		local timeLeft = self.EndTime-GetTime()
		local roundedt = math.floor(timeLeft*10.5)/10
		self.Bar:SetValue(timeLeft/duration)
		if roundedt % 1 == 0 then
			self.Time:SetText(roundedt .. ".0")
		else self.Time:SetText(roundedt) end
 
		if timeLeft < 0 then
			self.Panel:Hide()
			self:SetScript("OnUpdate", nil)
		end
	end
 
-- Configures the Bar
	local function ConfigureBar(f, color_r, color_g, color_b)
		f.Bar = CreateFrame("StatusBar", _, f.Panel)
		f.Bar:SetStatusBarTexture(BLANK_TEXTURE)
		f.Bar:SetPoint("BOTTOMLEFT", 0, 0)
		f.Bar:SetPoint("TOPRIGHT", 0, 0)
		f.Bar:SetMinMaxValues(0, 1)
		f.Bar:SetBackdrop(backdrop)
		f.Bar:SetStatusBarColor(color_r, color_g, color_b, 0.6)
		f.Bar:SetBackdropColor(1,1,1,0.6)
 
		f.Bar.bg = f.Bar:CreateTexture(nil, "BORDER")
		f.Bar.bg:SetPoint("TOPLEFT", f.Bar, "TOPLEFT", -1, 1)
		f.Bar.bg:SetPoint("TOPRIGHT", f.Bar, "TOPRIGHT", 1, 1)
		f.Bar.bg:SetPoint("BOTTOMLEFT", f.Bar, "BOTTOMLEFT", 1, -1)
		f.Bar.bg:SetPoint("BOTTOMRIGHT", f.Bar, "BOTTOMRIGHT", -1, -1)
		f.Bar.bg:SetTexture(normTex)
		f.Bar.bg:SetVertexColor(0.1, 0.1, 0.1)
 
		f.BarBackdrop = CreateFrame("Frame", nil, self)
		f.BarBackdrop:SetPoint("TOPLEFT", f.Bar, "TOPLEFT", -6, 6)
		f.BarBackdrop:SetPoint("BOTTOMRIGHT", f.Bar, "BOTTOMRIGHT", 6, -6)
		f.BarBackdrop:SetParent(f.Bar)
		f.BarBackdrop:SetFrameStrata("BACKGROUND")
		f.BarBackdrop:SetFrameLevel(0)
		f.BarBackdrop:SetBackdrop({
			edgeFile = glowTex, edgeSize = 4,
			insets = {left = 3, right = 3, top = 3, bottom = 3}
		})
		f.BarBackdrop:SetBackdropColor(0, 0, 0, 0)
		f.BarBackdrop:SetBackdropBorderColor(0, 0, 0, 0.7)
 
		f.BarBorder = CreateFrame("Frame", nil, self)
		f.BarBorder:SetPoint("TOPLEFT", f.Bar, "TOPLEFT", -2, 2)
		f.BarBorder:SetPoint("TOPRIGHT", f.Bar, "TOPRIGHT", 2, 2)
		f.BarBorder:SetPoint("BOTTOMLEFT", f.Bar, "BOTTOMLEFT", 2, -2)
		f.BarBorder:SetPoint("BOTTOMRIGHT", f.Bar, "BOTTOMRIGHT", -2, -2)
		f.BarBorder:SetParent(f.Bar)
		f.BarBorder:SetBackdrop({
			edgeFile = BLANK_TEXTURE, edgeSize = 1,
			insets = {left = -1, right = -1, top = -1, bottom = -1}
		})
		f.BarBorder:SetBackdropColor(0.1, 0.1, 0.1, 1)
		f.BarBorder:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
 
		f.Time = f.Bar:CreateFontString(nil, "OVERLAY")
		f.Time:SetPoint("LEFT", 2, 1)
		f.Time:SetShadowOffset(1, -1)
		f.Time:SetShadowColor(0.1, 0.1, 0.1, 1)
		f.Time:SetFont(FONT, 10)
		f.Time:SetJustifyH("LEFT")
		f.Time:Show()
 
		f.Panel:Hide()
 
		f.Bar.Icon = f.Bar:CreateTexture(nil, "HIGH")
		f.Bar.Icon:SetTexture("Interface\\Icons\\Spell_Nature_Cyclone.blp")
		f.Bar.Icon:SetHeight(21.5)
		f.Bar.Icon:SetWidth(21.5)
		f.Bar.Icon:SetTexCoord(0, 1, 0, 1)
		f.Bar.Icon:SetPoint("RIGHT", f.Bar, "LEFT", -1.5, 0.5)
 
		f.Bar.IconBorder = f.Bar:CreateTexture(nil, "OVERLAY")
		f.Bar.IconBorder:SetTexture(border)
		f.Bar.IconBorder:SetPoint("TOPLEFT", f.Bar.Icon, "TOPLEFT", 0, 0)
		f.Bar.IconBorder:SetPoint("TOPRIGHT", f.Bar.Icon, "TOPRIGHT", -0, 0)
		f.Bar.IconBorder:SetPoint("BOTTOMLEFT", f.Bar.Icon, "BOTTOMLEFT", 0, 0)
		f.Bar.IconBorder:SetPoint("BOTTOMRIGHT", f.Bar.Icon, "BOTTOMRIGHT", -0, 0)
	end
 
	local track_buffs = {
		'Sudden Death',
		'Taste for Blood',
	};
	local n = 0;
	for _, s in pairs(track_buffs) do
		local track_frame = CreateFrame('Frame', _, UIParent);
		track_frame.Panel = BarPanel(15, 22, -2, 7+(n*18), "BOTTOMRIGHT", "TOPRIGHT", oUF_Tukz_player, 1, track_frame, "HIGH")
		ConfigureBar(track_frame, 1, 0, 0);
		local function check_buff(self, event, unit, spell)
			if unit == 'player' then
				if UnitBuff('player', s) then
					local name, _, icon, _, _, duration, expirationTime, unitCaster = UnitBuff('player', s)
					if name then
						self.EndTime = expirationTime
						self.Duration = duration
						self.Icon = icon
						self.Panel:Show()
						self:SetScript('OnUpdate', UpdateBar)
					end
				else
					if(self.Panel:IsVisible()) then
						self.Panel:Hide();
						--self:SetScript('OnUpdate', UpdateBar);
					end
				end
			end
		end
		track_frame:SetScript('OnEvent', check_buff);
		track_frame:RegisterEvent('UNIT_AURA');

		n = n+1;
	end
	
	
	print('WARRIOR MOD LOADED');
end