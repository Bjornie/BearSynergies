BearSynergies.Block = {
    Default = {
        isLokke = false,
        isAlkosh = false,
        isResource = false,
        resourceThreshold = 50,
        blockDO = true,

        -- See BearSynergiesData.lua for names
        [22269] = true,
        [23196] = true,
        [25170] = true,
        [26832] = true,
        [31538] = true,
        [31603] = true,
        [32910] = true,
        [32974] = true,
        [37729] = true,
        [39301] = true,
        [39377] = true,
        [39429] = true,
        [39500] = true,
        [41838] = true,
        [41963] = true,
        [41994] = true,
        [42016] = true,
        [42194] = true,
        [48076] = true,
        [56667] = true,
        [58775] = true,
        [63507] = true,
        [71902] = true,
        [71949] = true,
        [71951] = true,
        [71953] = true,
        [85572] = true,
        [88884] = true,
        [95922] = true,
        [103489] = true,
        [111437] = true,
        [112890] = true,
        [112901] = true,
        [112909] = true,
        [112872] = true,
        [115548] = true,
        [118604] = true,
        [129936] = true,
        [134005] = true,
        [141920] = true,
    },
}

local BS = BearSynergies
local B = BS.Block
local EM = GetEventManager()

local imperfLokke = "|H1:item:149795:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"
local perfLokke = "|H1:item:150996:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"
local alkosh = "|H1:item:73058:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"

-- Checks whether or not Tooth of Lokkestiiz is equipped.
local function GetLokke()
    local _, _, _, imperfEquipped = GetItemLinkSetInfo(imperfLokke, true)
    local _, _, _, perfEquipped = GetItemLinkSetInfo(perfLokke, true)

    -- If Lokke Mode is enabled but no Lokke pieces are equipped don't block synergies
    if imperfEquipped == 0 and perfEquipped == 0 then return true end
    if imperfEquipped >= 5 or perfEquipped >= 5 then return true
    else return false end
end

-- Checks whether or not Roar of Alkosh is equipped.
local function GetAlkosh()
    local _, _, _, alkoshEquipped = GetItemLinkSetInfo(alkosh, true)

    -- If Alkosh Mode is enabled but no Alkosh pieces are equipped don't block synergies
    if alkoshEquipped == 0 then return true end
    if alkoshEquipped >= 5 then return true
    else return false end
end

-- Checks resource percentage and compares with defined options value
local function IsResourceLow()
    local stamCurrent, stamMax = GetUnitPower("player", POWERTYPE_STAMINA)
    local magCurrent, magMax = GetUnitPower("player", POWERTYPE_MAGICKA)
    local percentage = 100

    if stamMax > magMax then percentage = stamCurrent / stamMax * 100
    else percentage = magCurrent / magMax * 100 end

    if percentage <= B.SavedVariables.resourceThreshold then return true
    else return false end
end

-- This function runs before synergy prompt on-screen and determines whether or not the prompt appears
-- If the intercept function returns true the target function won't run
local function Intercept()
    local synergyName = GetSynergyInfo()

    if not synergyName then return end

    local synergyId = BS.GetSynergyId(synergyName)

    if B.SavedVariables[synergyId] ~= nil then
        if B.SavedVariables[synergyId] == false then return true end
    else return false end -- Always allow unknown synergy

    if B.SavedVariables.blockDO and synergyId == 56667 then
        LibDialog:ShowDialog(BS.name .. "DODialog", "DOConfirmation")
        return false
    end

    if B.SavedVariables.isLokke and not GetLokke() then SHARED_INFORMATION_AREA:SetHidden(SYNERGY, true) return true end
    if B.SavedVariables.isAlkosh and not GetAlkosh() then SHARED_INFORMATION_AREA:SetHidden(SYNERGY, true) return true end
    if B.SavedVariables.isResource and not IsResourceLow() then SHARED_INFORMATION_AREA:SetHidden(SYNERGY, true) return true end
end

local function BarswapRefresh(_, didBarswap)
    if didBarswap then SYNERGY:OnSynergyAbilityChanged() end
end

function B.Initialise()
    if BS.SavedVariables.isAccountWide then B.SavedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Block", B.Default)
    else B.SavedVariables = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, "Block", B.Default) end

    -- Confirmation dialog for Destructive Outbreak
    LibDialog:RegisterDialog(BS.name .. "DODialog", "DOConfirmation", "|cFF0000Warning!|r", "Destructive Outbreak can kill the group! Press Confirm to continue.")

    ZO_PreHook(SYNERGY, "OnSynergyAbilityChanged", Intercept)
    B.BuildMenu()

    EM:RegisterForEvent(BS.name .. "Block", EVENT_ACTION_SLOTS_ACTIVE_HOTBAR_UPDATED, BarswapRefresh)
end