local BS = BearSynergies
local LAM = LibAddonMenu2

function BS.BuildMenu()
  local panelData = BS.GetModulePanelData()

  local optionsTable = {
    {
      type = "header",
      name = "|cFFFACDModule Settings|r"
    },
    {
      type = "checkbox",
      name = "Synergy Block",
      getFunc = function() return BS.savedVariables.isBlock end,
      setFunc = function(value) BS.savedVariables.isBlock = value end,
      requiresReload = true
    },
    {
      type = "description",
      text = "" -- TODO
    },
    {
      type = "checkbox",
      name = "Synergy Tracker",
      getFunc = function() return BS.savedVariables.isTrack end,
      setFunc = function(value) BS.savedVariables.isTrack = value end,
      requiresReload = true
    },
    {
      type = "description",
      text = "" -- TODO
    }
  }

  LAM:RegisterAddonPanel(BS.name .. "Main", panelData)
  LAM:RegisterOptionControls(BS.name .. "Main", optionsTable)
end