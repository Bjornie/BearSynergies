BearSynergies.Track = {
  default = {
    TrackLeft = nil,
    TrackTop = nil,
  }
}

local BS = BearSynergies
local T = BS.Track
local EM = EVENT_MANAGER

function T.Initialize()
  T.savedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Track", T.default)

  T.BuildMenu()
end

function T.RestorePosition()
  local TrackLeft = T.savedVariables.testLeft
  local TrackTop = T.savedVariables.testTop

  BearSynergies_Track_Cooldown:ClearAnchors()
  BearSynergies_Track_Cooldown:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, TrackLeft, TrackTop)
end

function T.TrackOnMoveStop()
  T.savedVariables.TrackLeft = BearSynergies_Track_Cooldown:GetLeft()
  T.savedVariables.TrackTop = BearSynergies_Track_Cooldown:GetTop()
end