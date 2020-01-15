BearSynergies.Track = {
    default = {}
}

local BS = BearSynergies
local T = BS.Track
local EM = EVENT_MANAGER

function T.Initialize()
    T.savedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Track", T.default)

    T.BuildMenu()
end