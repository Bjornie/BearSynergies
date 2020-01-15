BearSynergies = {
    name = "BearSynergies",
    version = "1.1.0",
    svName = "BearSynergiesSV",
    svVersion = 4,

    default = {
        ["Blocker"] = true,
    },
}

local BS = BearSynergies
local EM = EVENT_MANAGER

function BS.OnAddonLoaded(_, addonName)
    if addonName == BS.name then
        EM:UnregisterForEvent(BS.name, EVENT_ADD_ON_LOADED)
        BS.Initialize()
    end
end

function BS.Initialize()
    BS.savedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, nil, BS.default)

    if BS.savedVariables["Blocker"] then BS.Block.Initialize() end

    BS.BuildMenu()
end


function BS.GetModulePanelData(name)
    return {
        type = "panel",
        name = name and string.format("Bear Synergies - %s", name) or "Bear Synergies",
        displayname = name and string.format("Bear Synergies - %s", name) or "Bear Synergies",
        author = "|c00BFFFBjørnTheBurr|r",
        version = BS.version,
        registerForRefresh = true,
    }
end

EM:RegisterForEvent(BS.name, EVENT_ADD_ON_LOADED, BS.OnAddonLoaded)