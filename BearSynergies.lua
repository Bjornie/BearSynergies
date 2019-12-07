BearSynergies = {
    name = "BearSynergies",

    svVersion = 2,

    default = {
        isLokke = false,
        isAlkosh = false,

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

local IL = "|H1:item:149795:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"
local PL = "|H1:item:150996:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"
local Alkosh = "|H1:item:73058:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"

-- This function runs before synergy prompt on screen and determines whether the prompt appears or not
function BS.PreHook()
    ZO_PreHook(SYNERGY, "OnSynergyAbilityChanged", function()
        local synergyName, iconFilename = GetSynergyInfo()
        
        if synergyName and iconFilename then
            -- Check if synergy is disabled
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

            -- Block if Lokke mode is activated
            if BS.GetLokke() then
                SYNERGY:SetHidden(true)
                return true -- Do not run original code
            end

            -- Block if Alkosh mode is activated
            if BS.GetAlkosh() then
                SYNERGY:SetHidden(true)
                return true -- Do not run original code
            end
        else
            SYNERGY:SetHidden(true)
        end
    end)
end

-- Checks whether or not Tooth of Lokkestiiz is equipped.
function BS.GetLokke()
    if BS.savedVariables.isLokke == false then return false end
    
    local imperfEquipped, perfEquipped = 0
    local _, _, _, imperfEquipped = GetItemLinkSetInfo(IL, true)
    local _, _, _, perfEquipped = GetItemLinkSetInfo(PL, true)
    
    -- If lokke mode is enabled but no lokke pieces equipped don't block synergies
    if (imperfEquipped == 0) and (perfEquipped == 0) then return false end

    if ((imperfEquipped <= 4) and (imperfEquipped >= 1)) then return true end
    if ((perfEquipped <= 4) and (perfEquipped >= 1)) then return true end
    if ((imperfEquipped == 5) or (perfEquipped == 5)) then return false end
end

-- Checks whether or not Roar of Alkosh is equipped.
function BS.GetAlkosh()
    if BS.savedVariables.isAlkosh == false then return false end

    local alkoshEquipped = 0
    local _, _, _, alkoshEquipped = GetItemLinkSetInfo(Alkosh, true)

    -- If alkosh mode is enabled but no alkosh pieces equipped don't block synergies
    if alkoshEquipped == 0 then return false end
    
    if alkoshEquipped <= 4 then return true end
    if alkoshEquipped == 5 then return false end
end

-- Unhide synergy prompt and run PreHook again
function BS.BarswapRefresh(_, didBarswap)
    if didBarswap then
        SYNERGY:SetHidden(false)
        SYNERGY:OnSynergyAbilityChanged()
    end
end

function BS.Initialize(_, addonName)
    if addonName ~= BS.name then return end
    EM:UnregisterForEvent(BS.name, EVENT_ADD_ON_LOADED)

    BS.savedVariables = ZO_SavedVars:NewAccountWide("BearSynergiesSV", BS.svVersion, nil, BS.default)

    BS.BuildMenu()
    BS.PreHook()

    EM:RegisterForEvent(BS.name, EVENT_ACTION_SLOTS_ACTIVE_HOTBAR_UPDATED, BS.BarswapRefresh)
end

EM:RegisterForEvent(BS.name, EVENT_ADD_ON_LOADED, BS.Initialize)