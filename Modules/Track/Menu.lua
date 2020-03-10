local BS = BearSynergies
local T = BS.Track

function T.BuildMenu()
  local panelData = BS.GetModulePanelData("Track")

  local optionsTable = {
    {
      type = "submenu",
      name = "|cFFFACDSynergies|r",
      controls = {
        {
          type = "checkbox",
          name = "Shackle",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[1] end,
          setFunc = function(value)
                      T.savedVariables.synergies[1] = value
                      T.CreateControls()
                    end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_dragonknight_006.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Ignite",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[2] end,
          setFunc = function(value) 
                      T.savedVariables.synergies[2] = value
                      T.CreateControls()
                    end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_dragonknight_010.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Grave Robber",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[3] end,
          setFunc = function(value) 
                      T.savedVariables.synergies[3] = value
                      T.CreateControls()
                    end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_necromancer_004.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Pure Agony",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[4] end,
          setFunc = function(value) T.savedVariables.synergies[4] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_necromancer_010_b.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Hidden Refresh",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[5] end,
          setFunc = function(value) T.savedVariables.synergies[5] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_nightblade_015.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Soul Leech",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[6] end,
          setFunc = function(value) T.savedVariables.synergies[6] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_nightblade_018.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Charged Lightning",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[7] end,
          setFunc = function(value) T.savedVariables.synergies[7] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_sorcerer_storm_atronach.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Conduit",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[8] end,
          setFunc = function(value) T.savedVariables.synergies[8] = value end,
        },
        {
          type = "texture",
          width = "half",
         image = "esoui/art/icons/ability_sorcerer_lightning_splash.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Nova",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[9] end,
          setFunc = function(value) T.savedVariables.synergies[9] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_templar_nova.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Purify",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[10] end,
          setFunc = function(value) T.savedVariables.synergies[10] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_templar_cleansing_ritual.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Harvest",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[11] end,
          setFunc = function(value) T.savedVariables.synergies[11] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_warden_007.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Icy Escape",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[12] end,
          setFunc = function(value) T.savedVariables.synergies[12] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_warden_005_b.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Feeding Frenzy",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[13] end,
          setFunc = function(value) T.savedVariables.synergies[13] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_werewolf_005_b.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Blood Altar",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[14] end,
          setFunc = function(value) T.savedVariables.synergies[14] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_undaunted_001.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Spiders",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[15] end,
          setFunc = function(value) T.savedVariables.synergies[15] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_undaunted_003.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Radiate",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[16] end,
          setFunc = function(value) T.savedVariables.synergies[16] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_undaunted_002.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Bone Shield",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[17] end,
          setFunc = function(value) T.savedVariables.synergies[17] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_undaunted_005.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
        {
          type = "checkbox",
          name = "Spear Shards/Combustion",
          width = "half",
          getFunc = function() return T.savedVariables.synergies[18] end,
          setFunc = function(value) T.savedVariables.synergies[18] = value end,
        },
        {
          type = "texture",
          width = "half",
          image = "esoui/art/icons/ability_undaunted_004.dds",
          imageWidth = 50,
          imageHeight = 50,
        },
      },
    },
  }

  LibAddonMenu2:RegisterAddonPanel(BS.name .. "Track", panelData)
  LibAddonMenu2:RegisterOptionControls(BS.name .. "Track", optionsTable)
end