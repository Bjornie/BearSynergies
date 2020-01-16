local BS = BearSynergies
local T = BS.Track
local LAM = LibAddonMenu2

function T.BuildMenu()
  local panelData = BS.GetModulePanelData("Track")

  local optionsTable = {}

  LAM:RegisterAddonPanel(BS.name .. "Track", panelData)
  LAM:RegisterOptionControls(BS.name .. "Track", optionsTable)
end