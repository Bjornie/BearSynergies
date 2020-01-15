BearSynergies.Block = {
    default = {
        isLokke = false,
        isAlkosh = false,
        isResource = false,
        resourceThreshold = 50,

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
local B = BS.Block
local EM = EVENT_MANAGER

-- Item ID's
local IL = "|H1:item:149795:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"
local PL = "|H1:item:150996:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"
local Alkosh = "|H1:item:73058:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"

function B.Initialize()
    B.savedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Block", B.default)
    
    B.BuildMenu()
    B.PreHook()

    EM:RegisterForEvent(BS.name, EVENT_ACTION_SLOTS_ACTIVE_HOTBAR_UPDATED, B.BarswapRefresh)
end

-- This function runs before synergy prompt on screen and determines whether the prompt appears or not
function B.PreHook()
    ZO_PreHook(SYNERGY, "OnSynergyAbilityChanged", function()
        local synergyName, iconFilename = GetSynergyInfo()

        if synergyName and iconFilename then
            -- Check if synergy is disabled
            if B.savedVariables[synergyName] ~= nil then
                if B.savedVariables[synergyName] == false then
                    SYNERGY:SetHidden(true)
                    return true -- Do not run original code
                end
            else
                -- Always allow unknown synergy
                SYNERGY:SetHidden(false)
                return false -- Run original code
            end

            -- Check lokke pieces active if lokke mode enabled
            if not B.GetLokke() then
                SYNERGY:SetHidden(true)
                return true -- Do not run original code
            end

            -- Check alkosh pieces active if alkosh mode enabled
            if not B.GetAlkosh() then
                SYNERGY:SetHidden(true)
                return true -- Do not run original code
            end

            -- Check current resource if resource check enabled
            if not B.IsResourceLow() then
                SYNERGY:SetHidden(true)
                return true -- Do not run original code
            end
        else
            SYNERGY:SetHidden(true)
        end
    end)
end

-- Checks whether or not Tooth of Lokkestiiz is equipped.
function B.GetLokke()
    -- If disabled always return true
    if B.savedVariables.isLokke == false then return true end
    
    local imperfEquipped, perfEquipped = 0
    local _, _, _, imperfEquipped = GetItemLinkSetInfo(IL, true)
    local _, _, _, perfEquipped = GetItemLinkSetInfo(PL, true)

    -- If lokke mode is enabled but no lokke pieces equipped don't block synergies
    if (imperfEquipped == 0) and (perfEquipped == 0) then return true end

    if (imperfEquipped == 5) or (perfEquipped == 5) then return true
    else return false end
end

-- Checks whether or not Roar of Alkosh is equipped.
function B.GetAlkosh()
    -- If disabled always return true
    if B.savedVariables.isAlkosh == false then return true end

    local alkoshEquipped = 0
    local _, _, _, alkoshEquipped = GetItemLinkSetInfo(Alkosh, true)

    -- If alkosh mode is enabled but no alkosh pieces equipped don't block synergies
    if alkoshEquipped == 0 then return true end
    
    if alkoshEquipped == 5 then return true
    else return false end
end

-- Checks resource percentage and compares with defined options value
function B.IsResourceLow()
    -- If disabled always return false
    if B.savedVariables.isResource == false then return true end

    local stamCurrent, stamMax = GetUnitPower("player", POWERTYPE_STAMINA)
    local magCurrent, magMax = GetUnitPower("player", POWERTYPE_MAGICKA)
    local percentage = 100

    if stamMax > magMax then
        percentage = stamCurrent / stamMax * 100
    else
        percentage = magCurrent / magMax * 100
    end

    if percentage <= B.savedVariables.resourceThreshold then return true
    else return false end
end

-- Unhide synergy prompt and run PreHook again
function B.BarswapRefresh(_, didBarswap)
    if didBarswap then
        SYNERGY:SetHidden(false)
        SYNERGY:OnSynergyAbilityChanged()
    end
end