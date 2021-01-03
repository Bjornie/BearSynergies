BearSynergies = {
    name = 'BearSynergies',
    version = '1.2.0',
    svName = 'BearSynergiesSV',
    svVersion = 5,

    Default = {
        isAccountWide = true,
        isBlock = true,
        isGroupTrack = true,
        isTrack = true,
    },
}

BS_EVENT_GROUP_CHANGED = 'GroupChanged'

local BS = BearSynergies
local EM = GetEventManager()

local function GroupChanged()
    EM:UnregisterForUpdate(BS.name ..'OnGroupChangeDelayed')
    BS.CallbackManager:FireCallbacks(BS_EVENT_GROUP_CHANGED)
end

local function PlayerActivated()
    -- Prevent group events spam by calling GroupChanged 1s later (stolen from Hodor Reflexes by andy.s)
    local function OnGroupChangeDelayed()
        EM:UnregisterForUpdate(BS.name .. 'OnGroupChangeDelayed')
        EM:RegisterForUpdate(BS.name .. 'OnGroupChangeDelayed', 1000, GroupChanged)
    end

    EM:RegisterForEvent(BS.name, EVENT_GROUP_MEMBER_JOINED, OnGroupChangeDelayed)
    EM:RegisterForEvent(BS.name, EVENT_GROUP_MEMBER_LEFT, OnGroupChangeDelayed)
    EM:RegisterForEvent(BS.name, EVENT_GROUP_UPDATE, OnGroupChangeDelayed)
end

-- Easy creation of PanelData for each module (stolen from Hodor Reflexes by andy.s)
function BS.GetModulePanelData(name)
    return {
        type = 'panel',
        name = name and string.format('Bear Synergies - %s', name) or 'Bear Synergies',
        displayname = name and string.format('Bear Synergies - %s', name) or 'Bear Synergies',
        author = '|c00BFFFBjørn|r',
        version = BS.version,
        registerForRefresh = true,
    }
end

local function Initialise()
    BS.SV = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, nil, BS.Default)
    if not BS.SV.isAccountWide then BS.SV = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, nil, BS.Default) end

    BS.CallbackManager = ZO_CallbackObject:New()

    if BS.SV.isBlock then BS.Block.Initialise() end
    if BS.SV.isGroupTrack then BS.GroupTrack.Initialise() end
    if BS.SV.isTrack then BS.Track.Initialise() end

    BS.BuildMenu()

    EM:RegisterForEvent(BS.name, EVENT_PLAYER_ACTIVATED, PlayerActivated)
end

EM:RegisterForEvent(BS.name, EVENT_ADD_ON_LOADED, function(_, addonName)
    if addonName == BS.name then
        EM:UnregisterForEvent(BS.name, EVENT_ADD_ON_LOADED)
        Initialise()
    end
end)