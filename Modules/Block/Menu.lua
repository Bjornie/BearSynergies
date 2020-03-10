local BS = BearSynergies
local B = BS.Block

function B.BuildMenu()
  local panelData = BS.GetModulePanelData("Block")

  local optionsTable = {
    -- General Settings
    {
      type = "header",
      name = "|cFFFACDGeneral|r",
    },
    {
      type = "checkbox",
      name = "Lokke Mode",
      width = "half",
      tooltip = "Toggling this on will prevent you from being able to use synergies if less than five pieces of Lokkestiiz is active. If no Lokke pieces equipped this setting will be ignored.",
      getFunc = function() return B.savedVariables.isLokke end,
      setFunc = function(value) B.savedVariables.isLokke = value end,
    },
    {
      type = "checkbox",
      name = "Alkosh Mode",
      width = "half",
      tooltip = "Toggling this on will prevent you from being able to use synergies if less than five pieces of Alkosh is active. If no Alkosh pieces equipped this setting will be ignored.",
      getFunc = function() return B.savedVariables.isAlkosh end,
      setFunc = function(value) B.savedVariables.isAlkosh = value end,
    },
    {
      type = "checkbox",
      name = "Resource Check",
      tooltip = "Toggling this on will prevent you from being able to use synergies if your current main resource is higher than the threshold.",
      getFunc = function() return B.savedVariables.isResource end,
      setFunc = function(value) B.savedVariables.isResource = value end,
    },
    {
      type = "slider",
      name = "Resource Check Threshold",
      min = 0,
      max = 100,
      step = 1,
      getFunc = function() return B.savedVariables.resourceThreshold end,
      setFunc = function(value) B.savedVariables.resourceThreshold = value end,
      disabled = function() return not B.savedVariables.isResource end,
    },

    -- Class Settings
    {
      type = "submenu",
      name = "|cFFFACDClass Synergies|r",
      controls = {
        -- Dragonknight Settings
        {
          type = "header",
          name = "|cFFFACDDragonknight|",
        },
        {
          type = "checkbox",
          name = "Shackle",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Shackle synergy, provided by the Dragonknight Standard skill.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_dragonknight_006.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_dragonknight_006.dds"] = value end,
        },
        {
          type = "checkbox",
          name = "Ignite",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Ignite synergy, provided by the Dark Talons skill.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_dragonknight_010.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_dragonknight_010.dds"] = value end,
        },

        -- Necromancer Settings
        {
          type = "header",
          name = "|cFFFACDNecromancer|r",
        },
        {
          type = "checkbox",
          name = "Grave Robber",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Grave Robber synergy, provided by the Boneyard skill.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_necromancer_004.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_necromancer_004.dds"] = value end,
        },
        {
          type = "checkbox",
          name = "Pure Agony",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Pure Agony synergy, provided by the Agony Totem skill.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_necromancer_010_b.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_necromancer_010_b.dds"] = value end,
        },

        -- Nightblade Settings
        {
          type = "header",
          name = "|cFFFACDNightblade|r",
        },
        {
          type = "checkbox",
          name = "Hidden Refresh",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Hidden Refresh synergy, provided by the Consuming Darkness skill.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_nightblade_015.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_nightblade_015.dds"] = value end,
        },
        {
          type = "checkbox",
          name = "Soul Leech",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Soul Leech synergy, provided by the Soul Shred skill.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_nightblade_018.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_nightblade_018.dds"] = value end,
        },

        -- Sorcerer Settings
        {
          type = "header",
          name = "|cFFFACDSorcerer|r",
        },
        {
          type = "checkbox",
          name = "Charged Lightning",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Charged Lightning synergy, provided by the Summon Storm Atronach skill.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_sorcerer_storm_atronach.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_sorcerer_storm_atronach.dds"] = value end,
        },
        {
          type = "checkbox",
          name = "Conduit",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Conduit synergy, provided by the Lightning Splash skill.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_sorcerer_lightning_splash.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_sorcerer_lightning_splash.dds"] = value end,
        },

        -- Templar Settings
        {
          type = "header",
          name = "|cFFFACDTemplar|r",
        },
        {
          type = "checkbox",
          name = "Spear Shards",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Blessed Shards and Holy Shards synergies, provided by the Spear Shards and morphs skills.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_templar_sun_strike.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_templar_sun_strike.dds"] = value end,
        },
        {
          type = "checkbox",
          name = "Nova",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Supernova and Gravity Crush synergies, provided by the Nova and morphs skills.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_templar_nova.dds"], B.savedVariables["/esoui/art/icons/ability_templar_solar_prison.dds"] end,
          setFunc = function(value)
            B.savedVariables["/esoui/art/icons/ability_templar_nova.dds"] = value
            B.savedVariables["/esoui/art/icons/ability_templar_solar_prison.dds"] = value
          end,
        },
        {
          type = "checkbox",
          name = "Purify",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Purify synergy, provided by the Cleansing Ritual skill.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_templar_cleansing_ritual.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_templar_cleansing_ritual.dds"] = value end,
        },

        -- Warden Settings
        {
          type = "header",
          name = "|cFFFACDWarden|r",
        },
        {
          type = "checkbox",
          name = "Harvest",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Harvest synergy, provided by the Healing Seed skill.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_warden_007.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_warden_007.dds"] = value end,
        },
        {
          type = "checkbox",
          name = "Icy Escape",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Icy Escape synergy, provided by the Frozen Retreat skill.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_warden_005_b.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_warden_005_b.dds"] = value end,
        },
      },
    },

    -- Undaunted Settings
    {
      type = "submenu",
      name = "|cFFFACDUndaunted Synergies|r",
      controls = {
        {
          type = "checkbox",
          name = "Blood Altar",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Blood Funnel and Blood Feast synergies, provided by the Blood Altar and morphs skills.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_undaunted_001.dds"], B.savedVariables["/esoui/art/icons/ability_undaunted_001_a.dds"] end,
          setFunc = function(value)
            B.savedVariables["/esoui/art/icons/ability_undaunted_001.dds"] = value
            B.savedVariables["/esoui/art/icons/ability_undaunted_001_a.dds"] = value
          end,
        },
        {
          type = "checkbox",
          name = "Spiders",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Spawn Broodlings, Black Widows and Arachnophobia synergies, provided by the Trapping Webs and morphs skills.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_undaunted_003.dds"], B.savedVariables["/esoui/art/icons/crafting_light_armor_standard_f_005.dds"] end,
          setFunc = function(value)
            B.savedVariables["/esoui/art/icons/ability_undaunted_003.dds"] = value
            B.savedVariables["/esoui/art/icons/crafting_light_armor_standard_f_005.dds"] = value
          end,
        },
        {
          type = "checkbox",
          name = "Radiate",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Radiate synergy, provided by the Inner Fire skill.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_undaunted_002.dds"] end,
          setFunc = function(value) B.savedVariables["/esoui/art/icons/ability_undaunted_002.dds"] = value end,
        },
        {
          type = "checkbox",
          name = "Bone Shield",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Bone Wall and Spinal Surge synergies, provided by the Bone Shield and morphs skills.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_undaunted_005.dds"], B.savedVariables["/esoui/art/icons/ability_undaunted_005a.dds"] end,
          setFunc = function(value)
            B.savedVariables["/esoui/art/icons/ability_undaunted_005.dds"] = value
            B.savedVariables["/esoui/art/icons/ability_undaunted_005a.dds"] = value
          end,
        },
        {
          type = "checkbox",
          name = "Combustion",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Combustion and Healing Combustion synergies, provided by the Necrotic Orb and morphs skills.",
          getFunc = function() return B.savedVariables["/esoui/art/icons/ability_undaunted_004.dds"], B.savedVariables["/esoui/art/icons/ability_undaunted_004b.dds"] end,
          setFunc = function(value)
            B.savedVariables["/esoui/art/icons/ability_undaunted_004.dds"] = value
            B.savedVariables["/esoui/art/icons/ability_undaunted_004b.dds"] = value
          end,
        },
      },
    },

    -- Arena Settings
    {
      type = "submenu",
      name = "|cFFFACDArena Synergies|r",
      controls = {
        {
          type = "checkbox",
          name = "Sigil of Defense",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Sigil of Defense synergy, provided in Maelstrom Arena and Blackrose Prison.",
          getFunc = function() return B.savedVariables["Sigil of Defense"] end,
          setFunc = function(value) B.savedVariables["Sigil of Defense"] = value end,
        },
        {
          type = "checkbox",
          name = "Sigil of Haste",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Sigil of Haste synergy, provided in Maelstrom Arena.",
          getFunc = function() return B.savedVariables["Sigil of Haste"] end,
          setFunc = function(value) B.savedVariables["Sigil of Haste"] = value end,
        },
        {
          type = "checkbox",
          name = "Sigil of Healing",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Sigil of Healing synergy, provided in Maelstrom Arena and Blackrose Prison.",
          getFunc = function() return B.savedVariables["Sigil of Healing"] end,
          setFunc = function(value) B.savedVariables["Sigil of Healing"] = value end,
        },
        {
          type = "checkbox",
          name = "Sigil of Power",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Sigil of Power synergy, provided in Maelstrom Arena.",
          getFunc = function() return B.savedVariables["Sigil of Power"] end,
          setFunc = function(value) B.savedVariables["Sigil of Power"] = value end,
        },
        {
          type = "checkbox",
          name = "Sigil of Resurrection",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Sigil of Resurrection synergy, provided in Blackrose Prison.",
          getFunc = function() return B.savedVariables["Sigil of Resurrection"] end,
          setFunc = function(value) B.savedVariables["Sigil of Resurrection"] = value end,
        },
        {
          type = "checkbox",
          name = "Sigil of Sustain",
          width = "half",
          tooltip = "Toggling this off will prevent you from being able to use the Sigil of Sustain synergy, provided in Blackrose Prison.",
          getFunc = function() return B.savedVariables["Sigil of Sustain"] end,
          setFunc = function(value) B.savedVariables["Sigil of Sustain"] = value end,
        },
      },
    },

    -- Trial Settings
    {
      type = "submenu",
      name = "|cFFFACDTrial Synergies|r",
      controls = {
        -- Craglorn Settings
        {
          type = "header",
          name = "|cFFFACDCraglorn Trials|r",
        },
        {
          type = "checkbox",
          name = "Destructive Outbreak Dialog",
          tooltip = "Toggling this on will prompt a message on-screen whenever you get the fossilize mechanic, warning you of the danger it poses.",
          getFunc = function() return B.savedVariables.blockDO end,
          setFunc = function(value) B.savedVariables.blockDO = value end,
        },

        -- Cloudrest Settings
        {
          type = "header",
          name = "|cFFFACDCloudrest|r",
        },
        {
          type = "checkbox",
          name = "Gateway",
          tooltip = "Toggling this off will prevent you from being able to use the portal synergy.",
          getFunc = function() return B.savedVariables["Gateway"] end,
          setFunc = function(value) B.savedVariables["Gateway"] = value end,
        },

        -- Sunspire Settings
        {
          type = "header",
          name = "|cFFFACDSunspire|r",
        },
        {
          type = "checkbox",
          name = "Time Breach",
          tooltip = "Toggling this off will prevent you from being able to use the portal synergy.",
          getFunc = function() return B.savedVariables["Time Breach"] end,
          setFunc = function(value) B.savedVariables["Time Breach"] = value end,
        },
      },
    },
  }

  LibAddonMenu2:RegisterAddonPanel(BS.name .. "Block", panelData)
  LibAddonMenu2:RegisterOptionControls(BS.name .. "Block", optionsTable)
end