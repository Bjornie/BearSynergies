BearSynergies = {
    name = "BearSynergies",
    version = "1.2.0",
    svName = "BearSynergiesSV",
    svVersion = 5,

    Default = {
        isAccountWide = true,
        isBlock = true,
        isGroupTrack = true,
        isTrack = true,
    },
}

local BS = BearSynergies
local EM = GetEventManager()

-- Easy creation of PanelData for each module
function BS.GetModulePanelData(name)
    return {
        type = "panel",
        name = name and string.format("Bear Synergies - %s", name) or "Bear Synergies",
        displayname = name and string.format("Bear Synergies - %s", name) or "Bear Synergies",
        author = "|c00BFFFBjørn|r",
        version = BS.version,
        registerForRefresh = true,
    }
end

local function Initialise()
    BS.SavedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, nil, BS.Default)

    if not BS.SavedVariables.isAccountWide then
        BS.SavedVariables = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, nil, BS.Default)
        BS.SavedVariables.isAccountWide = false
    end

    if BS.SavedVariables.isBlock then BS.Block.Initialise() end
    if BS.SavedVariables.isGroupTrack then BS.GroupTrack.Initialise() end
    if BS.SavedVariables.isTrack then BS.Track.Initialise() end

    BS.BuildMenu()
end

EM:RegisterForEvent(BS.name, EVENT_ADD_ON_LOADED, function(_, addonName)
    if addonName == BS.name then
        EM:UnregisterForEvent(BS.name, EVENT_ADD_ON_LOADED)
        Initialise()
    end
end)