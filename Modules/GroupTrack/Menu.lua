local BS = BearSynergies
local GT = BS.GroupTrack

function GT.BuildMenu()
  local PanelData = BS.GetModulePanelData("Group Track")

  local OptionsTable = {
    {
      type = "header",
      name = "|cFFFACDGeneral|r",
    },
    {
      type = "slider",
      name = "Transparency",
      min = 0,
      max = 100,
      step = 10,
      getFunc = function() return GT.SavedVariables.transparency end,
      setFunc = function(value)
                  GT.SavedVariables.transparency = value
                  GT.SetPosition()
                end,
    },
    {
      type = "submenu",
      name = "|cFFFACDSynergies|r",
      controls = {
        {
          type = "checkbox",
          name = "Shackle",
          width = "half",
          getFunc = function() return GT.SavedVariables.Synergies[1] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[1] = value
                      GT.SetPosition()
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
          getFunc = function() return GT.SavedVariables.Synergies[2] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[2] = value
                      GT.SetPosition()
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
          getFunc = function() return GT.SavedVariables.Synergies[3] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[3] = value
                      GT.SetPosition()
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
          getFunc = function() return GT.SavedVariables.Synergies[4] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[4] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[5] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[5] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[6] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[6] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[7] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[7] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[8] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[8] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[9] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[9] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[10] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[10] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[11] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[11] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[12] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[12] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[13] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[13] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[14] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[14] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[15] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[15] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[16] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[16] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[17] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[17] = value
                      GT.SetPosition()
                    end,
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
          getFunc = function() return GT.SavedVariables.Synergies[18] end,
          setFunc = function(value)
                      GT.SavedVariables.Synergies[18] = value
                      GT.SetPosition()
                    end,
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

  LibAddonMenu2:RegisterAddonPanel(BS.name .. "Group Track", PanelData)
  LibAddonMenu2:RegisterOptionControls(BS.name .. "Group Track", OptionsTable)
end