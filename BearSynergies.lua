BearSynergies = {
    name = 'BearSynergies',
    version = '1.2.0',
    svName = 'BearSynergiesSV',
    svVersion = 5,

    defaults = {
        isAccountWide = true,
        isBlock = true,
        isGroupTrack = true,
        isTrack = true,
    },
}

local BS = BearSynergies
local EM = GetEventManager()

local function GroupChanged()
    EM:UnregisterForUpdate(BS.name ..'OnGroupChangeDelayed')
    BS.callbackManager:FireCallbacks('GroupChanged')
end

local function RegisterEvents()
    local function OnGroupChangeDelayed()
        EM:UnregisterForUpdate(BS.name .. 'OnGroupChangeDelayed')
        EM:RegisterForUpdate(BS.name .. 'OnGroupChangeDelayed', 1000, GroupChanged)
    end
    EM:RegisterForEvent(BS.name, EVENT_GROUP_MEMBER_JOINED, OnGroupChangeDelayed)
    EM:RegisterForEvent(BS.name, EVENT_GROUP_MEMBER_LEFT, OnGroupChangeDelayed)
    EM:RegisterForEvent(BS.name, EVENT_GROUP_UPDATE, OnGroupChangeDelayed)
end

-- Easy creation of PanelData for each module (stolen from Hodor Reflexes by andy.s)
function BS:GetModulePanelData(name)
    return {
        type = 'panel',
        name = name and string.format('Bear Synergies - %s', name) or 'Bear Synergies',
        displayname = name and string.format('Bear Synergies - %s', name) or 'Bear Synergies',
        author = '|c00BFFFBjørn|r',
        version = BS.version,
        registerForRefresh = true,
        registerForDefaults = true,
    }
end

local function OnAddonLoaded(eventCode, addonName)
    if addonName == BS.name then
        EM:UnregisterForEvent(BS.name, 65536)

        BS.sv = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, nil, BS.defaults)
        if not BS.sv.isAccountWide then BS.sv = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, nil, BS.defaults) end

        BS.callbackManager = ZO_CallbackObject:New()

        if BS.sv.isBlock then BS:InitialiseBlock() end
        if BS.sv.isGroupTrack then BS.GroupTrack.Initialise() end
        if BS.sv.isTrack then BS.Track.Initialise() end

        RegisterEvents()
        BS.BuildMenu()
    end
end

EM:RegisterForEvent(BS.name, 65536, OnAddonLoaded)