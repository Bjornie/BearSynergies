BearSynergies = {
    name = "BearSynergies",

    svVersion = 1,

    default = {
        -- Dragonknight
        ["Shackle"] = true,
        ["Ignite"] = true,

        -- Necromancer
        ["Grave Robber"] = true,
        ["Pure Agony"] = true,

        -- Nightblade
        ["Hidden Refresh"] = true,
        ["Soul Leech"] = true,

        -- Sorcerer
        ["Charged Lightning"] = true,
        ["Conduit"] = true,

        -- Templar
        ["Blessed Shards"] = true,
        ["Holy Shards"] = true,
        ["Supernova"] = true,
        ["Gravity Crush"] = true,
        ["Purify"] = true,

        -- Warden
        ["Harvest"] = true,
        ["Icy Escape"] = true,

        -- Werewolf
        ["Feeding Frenzy"] = true,

        -- Undaunted
        ["Blood Funnel"] = true,
        ["Blood Feast"] = true,
        ["Spawn Broodlings"] = true,
        ["Black Widows"] = true,
        ["Arachnophobia"] = true,
        ["Radiate"] = true,
        ["Bone Wall"] = true,
        ["Spinal Surge"] = true,
        ["Combustion"] = true,
        ["Healing Combustion"] = true,

        -- Arena
        ["Sigil of Defense"] = true,
        ["Sigil of Haste"] = true,
        ["Sigil of Healing"] = true,
        ["Sigil of Power"] = true,
        ["Sigil of Resurrection"] = true,
        ["Sigil of Sustain"] = true,

        -- Trial
        ["Destructive Outbreak"] = true, -- HRC fossilize break
        ["Remove Bolt"] = true, -- SO and SS remove pin
        ["Celestial Purge"] = true, -- MoL lunar phase
        ["Levitate"] = true, -- HoF 2. boss upstairs
        ["Power Switch"] = true, --HoF 2. boss upstairs button
        ["Gateway"] = true, -- CR portal
        ["Malevolent Core"] = true, -- CR downstairs orbs
        ["Shed Hoarfrost"] = true, -- CR drop hoarfrost
        ["Welkynar's Light"] = true, -- CR spears
        ["Wind of the Welkynar"] = true, -- CR downstairs jump pad
        ["Time Breach"] = true, -- SS portal
    },
}

local BS = BearSynergies
local EM = EVENT_MANAGER

-- This function runs before synergy prompt on screen and determines whether the prompt appears or not
function BS.PreHook()
    ZO_PreHook(SYNERGY, "OnSynergyAbilityChanged", function()
        local synergyName, iconFilename = GetSynergyInfo()
        
        if synergyName and iconFilename then
            if BS.savedVariables[synergyName] ~= nil then
                if BS.savedVariables[synergyName] == false then
                    SYNERGY:SetHidden(true)
                    return true -- Do not run original code
                end
            else
                -- Always allow unknown synergy
                SYNERGY:SetHidden(false)
                return false --Run original code
            end
        end
    end)
end

-- GetItemLinkSetInfo(string itemLink, boolean equipped)

function BS.Initialize(event, addonName)
    BS.savedVariables = ZO_SavedVars:NewAccountWide("BearSynergiesSV", BS.svVersion, nil, BS.default)

    BS.BuildMenu()
    BS.PreHook()
end

EM:RegisterForEvent(BS.name, EVENT_ADD_ON_LOADED, function(_, name)
    if name == BS.name then
        BS.Initialize()
        EM:UnregisterForEvent(BS.name, EVENT_ADD_ON_LOADED)
    end
end)