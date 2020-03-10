local BS = BearSynergies

function BS.BuildMenu()
  local panelData = BS.GetModulePanelData()

  local optionsTable = {
    {
      type = "header",
      name = "|cFFFACDModule Settings|r",
    },
    {
      type = "checkbox",
      name = "Synergy Block",
      width = "half",
      getFunc = function() return BS.savedVariables.isBlock end,
      setFunc = function(value) BS.savedVariables.isBlock = value end,
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
      getFunc = function() return BS.savedVariables.isTrack end,
      setFunc = function(value) BS.savedVariables.isTrack = value end,
      requiresReload = true,
    },
    {
      type = "description",
      width = "half",
      text = "", -- TODO
    }
  }

  LibAddonMenu2:RegisterAddonPanel(BS.name .. "Main", panelData)
  LibAddonMenu2:RegisterOptionControls(BS.name .. "Main", optionsTable)
end