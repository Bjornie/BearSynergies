synergy = synergy or {}
local syn = synergy

local LAM = LibAddonMenu2

function syn.buildMenu()
	local panelData = {
		type = "panel",
		name = syn.name,
		displayName = "|cd7f442S|rynergy",
		author = "Wheel5, modified by BjörnTheBurr",
		version = ""..syn.version,
		registerForRefresh = true,
	}
	
	local options = {
		-- General Settings
		{
			type = "header",
			name = "|cFFFACDGeneral|r",
		},
		{
			type = "checkbox",
			name = "Trials Only",
			tooltip = "When enabled, extreme synergy blocking will only take effect in a trial zone (RECOMMENDED)",
			default = true,
			width = "half",
			getFunc = function() return syn.savedVariables.trialsOnly end,
			setFunc = function(value) syn.savedVariables.trialsOnly = value end,
		},
		{
			type = "description",
			text = "Extreme syngery blocking will disable the use of ALL SYNERGIES for dps when there is no Alkosh applied to the boss. If you are in a raid setting where alkosh is not likely to be consistent, it is not recommended to enable this setting.\n\nAdditionally, there are a number of bosses where this setting will be ignored and it will be treated as if it were off, namely in fights were there are long periods of time where you cannot attack the boss, meaning  you will still be able to take orbs and such even if the boss does not have Alkosh applied.",
		},
		{
			type = "checkbox",
			name = "Extreme Synergy Blocking",
			tooltip = "Disables the use of ALL SYNERGIES for dps players when alkosh is down on a boss",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.ExtremeBlocking end,
			setFunc = function(value) syn.savedVariables.ExtremeBlocking = value end,
		},
		{
			type = "checkbox",
			name = "Only Synergize With Alkosh or Lokkestiiz Bonus",
			tooltip = "When enabled, this setting will disable synergies when you don't have either the Lokkestiiz or Alkosh 5-piece bonus while having one of the sets equipped. This will work on either bar, and if it is active on both bars (body pieces or otherwise) you'll be able to take synergies on both bars.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.frontBarOnly end,
			setFunc = function(value) syn.savedVariables.frontBarOnly = value end,
		},
		{
			type = "checkbox",
			name = "Show Synergy Available Alert",
			tooltip = "When enabled, if a synergy is blocked due to the above setting (not having the 5-piece bonus of Alkosh or Lokkestiiz while wearing one of the sets) an alert will instead be displayed, telling you that a synergy can be taken if you were to swap and activate the 5-piece bonus.",
			default = true,
			width = "half",
			getFunc = function() return syn.savedVariables.showSynergyAlert end,
			setFunc = function(value) syn.savedVariables.showSynergyAlert = value end,
		},
		{
			type = "checkbox",
			name = "Advanced Lokkestiiz Mode",
			tooltip = "When enabled, if you have the Lokkestiiz set equipped and you have more than 5 seconds remaining on Major Slayer from any source, and you are above 50% stamina, you will not be able to take synergies (other than Charged Lightning). With less than 5 seconds remaining, or no Major Slayer at all, you will be able to take synergies again.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.advancedLokkeMode end,
			setFunc = function(value) syn.savedVariables.advancedLokkeMode = value end,
		},

		-- Dragonknight Settings
		{
			type = "header",
			name = "|cFFFACDDragonknight|r",
		},
		{
			type = "checkbox",
			name = "Disable Shackle",
			tooltip = "Enabling this will prevent you from being able to take the Shackle synergy from the Dragonknight Standard skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableShackle end,
			setFunc = function(value) syn.savedVariables.disableShackle = value end,
		},
		{
			type = "checkbox",
			name = "Disable Ignite",
			tooltip = "Enabling this will prevent you from being able to take the Ignite synergy from the Dark Talons skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableIgnite end,
			setFunc = function(value) syn.savedVariables.disableIgnite = value end,
		},

		-- Necromancer Settings
		{
			type = "header",
			name = "|cFFFACDNecromancer|r",
		},
		{
			type = "checkbox",
			name = "Grave Robber",
			tooltip = "Enabling this will prevent you from being able to take the Grave Robber synergy from the Boneyard skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableGraveRobber end,
			setFunc = function(value) syn.savedVariables.disableGraveRobber = value end,
		},

		-- Nightblade Settings
		{
			type = "header",
			name = "|cFFFACDNightblade|r",
		},
		{
			type = "checkbox",
			name = "Hidden Refresh",
			tooltip = "Enabling this will prevent you from being able to take the Hidden Refresh synergy from the Consuming Darkness skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableHiddenRefresh end,
			setFunc = function(value) syn.savedVariables.disableHiddenRefresh = value end,
		},
		{
			type = "checkbox",
			name = "Soul Leech",
			tooltip = "Enabling this will prevent you from being able to take the Soul Leech synergy from the Soul Shred skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableSoulLeech end,
			setFunc = function(value) syn.savedVariables.disableSoulLeech = value end,
		},

		-- Sorcerer Settings
		{
			type = "header",
			name = "|cFFFACDSorcerer|r",
		},
		{
			type = "checkbox",
			name = "Charged Lightning",
			tooltip = "Enabling this will prevent you from being able to take the Charged Lightning synergy from the Summon Storm Atronach skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableChargedLightning end,
			setFunc = function(value) syn.savedVariables.disableChargedLightning = value end,
		},
		{
			type = "checkbox",
			name = "Conduit",
			tooltip = "Enabling this will prevent you from being able to take the Conduit synergy from the Lightning Splash skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableConduit end,
			setFunc = function(value) syn.savedVariables.disableConduit = value end,
		},

		-- Templar
		{
			type = "header",
			name = "|cFFFACDTemplar|r"
		},
		{
			type = "checkbox",
			name = "Disable Blessed Shards",
			tooltip = "Enabling this will prevent you from being able to take the Blessed Shards and Holy Shards synergies from the Spear Shards and morphs skills.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableShards end,
			setFunc = function(value) syn.savedVariables.disableShards = value end,
		},
		{
			type = "checkbox",
			name = "Disable Supernova",
			tooltip = "Enabling this will prevent you from being able to take the Supernova and Gravity Crush synergies from the Nova and morphs skills.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableNova end,
			setFunc = function(value) syn.savedVariables.disableNova = value end,
		},
		{
			type = "checkbox",
			name = "Purify",
			tooltip = "Enabling this will prevent you from being able to take the Purify synergy from the Cleansing Ritual skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disablePurify end,
			setFunc = function(value) syn.savedVariables.disablePurify = value end,
		},

		-- Warden Settings
		{
			type = "header",
			name = "|cFFFACDWarden|r",
		},
		{
			type = "checkbox",
			name = "Harvest",
			tooltip = "Enabling this will prevent you from being able to take the Harvest synergy from the Healing Seed skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableHarvest end,
			setFunc = function(value) syn.savedVariables.disableHarvest = value end,
		},
		{
			type = "checkbox",
			name = "Icy Escape",
			tooltip = "Enabling this will prevent you from being able to take the Icy Escape synergy from the Frozen Retreat skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableIcyEscape end,
			setFunc = function(value) syn.savedVariables.disableIcyEscape = value end,
		},

		-- Werewolf Settings
		{
			type = "header",
			name = "|cFFFACDWerewolf|r",
		},
		{
			type "checkbox",
			name = "Disable Feeding Frenzy",
			tooltip = "Enabling this will prevent you from being able to take the Feeding Frenzy synergy from the Howl of Despair skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableFeedingFrenzy end,
			setFunc = function(value) syn.savedVariables.disableFeedingFrenzy = value end,
		},

		-- Undaunted Settings
		{
			type = "header",
			name = "|cFFFACDUndaunted|r",
		},
		{
			type = "checkbox",
			name = "Disable Blood Funnel",
			tooltip = "Enabling this will prevent you from being able to take the Blood Funnel and Blood Feast synergies from the Blood Altar and morphs skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableBloodFunnel end,
			setFunc = function(value) syn.savedVariables.disableBloodFunnel = value end,
		},
		{
			type = "checkbox",
			name = "Disable Spawn Broodlings",
			tooltip = "Enabling this will prevent you from being able to take the Spawn Broodlings, Black Widows and Arachnophobia synergies from the Trapping Webs and morphs skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableSpawnBroodlings end,
			setFunc = function(value) syn.savedVariables.disableSpawnBroodlings = value end,
		},
		{
			type = "checkbox",
			name = "Disable Radiate",
			tooltip = "Enabling this will prevent you from being able to take the Radiate synergy from the Inner Fire skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableRadiate end,
			setFunc = function(value) syn.savedVariables.disableRadiate = value end,
		},
		{
			type = "checkbox",
			name = "Disable Bone Wall",
			tooltip = "Enabling this will prevent you from being able to take the Bone Wall and Spinal Surge synergies from the Bone Shield and morphs skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableBoneWall end,
			setFunc = function(value) syn.savedVariables.disableBoneWall = value end,
		},
		{
			type = "checkbox",
			name = "Disable Combustion",
			tooltip = "Enabling this will prevent you from being able to take the Combustion and Healing Combustion synergies from the Necrotic Orb and morphs skill.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableCombustion end,
			setFunc = function(value) syn.savedVariables.disableCombustion = value end,
		},

		-- Raid Settings
		{
			type = "header",
			name = "|cFFFACDRaid|r",
		},
		{
			type = "checkbox",
			name = "Disable Destructive Outbreak",
			tooltip = "|cFF0000WARNING!|r Enabling this will prevent you from being able to use the Destructive Outbreak synergy from the fossilize mechanic during the fight with The Warrior in Hel Ra Citadel.",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableDestructiveOutbreak end,
			setFunc = function(value) syn.savedVariables.disableDestructiveOutbreak = value end,
		},
		{
			type = "checkbox",
			name = "Disable Cloudrest Portal",
			tooltip = "Disables the use of the portal synergy in Cloudrest when enabled",
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.portalDisable end,
			setFunc = function(value) syn.savedVariables.portalDisable = value end,
		},
		{
			type = "checkbox",
			name = "Disable Sunspire Portal",
			tooltip = "Disables the use of the portal synergy during the fight with Nahviintaas in Sunspire."
			default = false,
			width = "half",
			getFunc = function() return syn.savedVariables.disableTimeBreach end,
			setFunc = function(value) syn.savedVariables.disableTimeBreach = value end,
		}

		-- Arena Settings
		{
			type = "header",
			name = "|cFFFACDArena|r",
		},
		{
			type = "description",
			text = "Maelstrom Arena and Blackrose Prison share the same Defense and Healing sigil name, so if you have one of the following settings enabled the sigil will be disabled in BOTH arenas.",
		},
		{
			type = "checkbox",
			name = "Disable Blackrose Prison Sigils",
			tooltip = "When enabled, the sigils in Blackrose Prison can not be used",
			default = false,
			getFunc = function() return syn.savedVariables.brpSynDisable end,
			setFunc = function(value) syn.savedVariables.brpSynDisable = value end,
		},
		{
			type = "checkbox",
			name = "Disable Maelstrom Arena Sigils",
			tooltip = "When enabled, the sigils in Maelstrom Arena can not be used",
			default = false,
			getFunc = function() return syn.savedVariables.maSynDisable end,
			setFunc = function(value) syn.savedVariables.maSynDisable = value end,
		},
	}
	
	LAM:RegisterAddonPanel(syn.name.."Options", panelData)
	LAM:RegisterOptionControls(syn.name.."Options", options)
end
