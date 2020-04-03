local BS = BearSynergies

function BS.BuildMenu()
  local PanelData = BS.GetModulePanelData()

  local OptionsTable = {
    {
      type = "header",
      name = "|cFFFACDModule Settings|r",
    },
    {
      type = "checkbox",
      name = "Synergy Block",
      width = "half",
      getFunc = function() return BS.SavedVariables.isBlock end,
      setFunc = function(value) BS.SavedVariables.isBlock = value end,
      requiresReload = true,
    },
    {
      type = "description",
      width = "half",
      text = "This setting enables the possibility of blocking specific synergies or all synergies in defined scenarios.",
    },
    {
      type = "checkbox",
      name = "Synergy Tracker",
      width = "half",
      getFunc = function() return BS.SavedVariables.isTrack end,
      setFunc = function(value) BS.SavedVariables.isTrack = value end,
      requiresReload = true,
    },
    {
      type = "description",
      width = "half",
      text = "", -- TODO
    }
  }

  LibAddonMenu2:RegisterAddonPanel(BS.name .. "Main", PanelData)
  LibAddonMenu2:RegisterOptionControls(BS.name .. "Main", OptionsTable)
end