BearSynergies.Block = {
  Defaults = {
    isLokke = false,
    isAlkosh = false,
    isResource = false,
    resourceThreshold = 50,
    blockDO = true,

    [1] = true, -- Shackle
    [32974] = true, -- Ignite
    [115567] = true, -- Grave Robber
    [118614] = true, -- Pure Agony
    [1] = true, -- Hidden Refresh
    [1] = true, -- Soul Leech
    [1] = true, -- Charged Lightning
    [1] = true, -- Conduit
    [26832] = true, -- Blessed Shards
    [1] = true, -- Holy Shards
    [1] = true, -- Supernova
    [1] = true, -- Gravity Crush
    [1] = true, -- Purify
    [1] = true, -- Harvest
    [1] = true, -- Icy Escape
    [1] = true, -- Feeding Frenzy
    [1] = true, -- Blood Funnel
    [1] = true, -- Blood Feast
    [1] = true, -- Spawn Broodling
    [1] = true, -- Black Widow
    [1] = true, -- Arachnophobia
    [1] = true, -- Radiate
    [1] = true, -- Bone Wall
    [1] = true, -- Spinal Surge
    [1] = true, -- Combustion
    [1] = true, -- Healing Combustion
    [1] = true, -- Sigil of Defense
    [1] = true, -- Sigil of Haste
    [1] = true, -- Sigil of Healing
    [1] = true, -- Sigil of Power
    [1] = true, -- Sigil of Resurrection
    [1] = true, -- Sigil of Sustain
    [1] = true, -- Destructive Outbreak
    [1] = true, -- Remove Bolt
    [1] = true, -- Celestial Purge
    [1] = true, -- Levitate
    [1] = true, -- Power Switch
    [1] = true, -- Gateway
    [1] = true, -- Malevolent Core
    [1] = true, -- Shed Hoarfrost
    [104036] = true, -- Welkynar's Light
    [104111] = true, -- Wind of the Welkynar
    [1] = true, -- Time Breach
  },
}

local BS = BearSynergies
local B = BS.Block

local imperfLokke = "|H1:item:149795:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"
local perfLokke = "|H1:item:150996:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"
local alkosh = "|H1:item:73058:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"

-- Checks whether or not Tooth of Lokkestiiz is equipped.
local function GetLokke()
  if B.SavedVariables.isLokke == false then return true end
  
  local imperfEquipped, perfEquipped = 0
  local _, _, _, imperfEquipped = GetItemLinkSetInfo(imperfLokke, true)
  local _, _, _, perfEquipped = GetItemLinkSetInfo(perfLokke, true)

  -- If Lokke Mode is enabled but no Lokke pieces are equipped don't block synergies
  if (imperfEquipped == 0) and (perfEquipped == 0) then return true end
  if (imperfEquipped == 5) or (perfEquipped == 5) then return true
  else return false end
end

-- Checks whether or not Roar of Alkosh is equipped.
local function GetAlkosh()
  if B.SavedVariables.isAlkosh == false then return true end
  
  local alkoshEquipped = 0
  local _, _, _, alkoshEquipped = GetItemLinkSetInfo(alkosh, true)
  
  -- If Alkosh Mode is enabled but no Alkosh pieces are equipped don't block synergies
  if alkoshEquipped == 0 then return true end
  if alkoshEquipped == 5 then return true 
  else return false end
end

-- Checks resource percentage and compares with defined options value
local function IsResourceLow()
  if B.SavedVariables.isResource == false then return true end
  
  local stamCurrent, stamMax = GetUnitPower("player", POWERTYPE_STAMINA)
  local magCurrent, magMax = GetUnitPower("player", POWERTYPE_MAGICKA)
  local percentage = 100
  
  if stamMax > magMax then
    percentage = stamCurrent / stamMax * 100
  else
    percentage = magCurrent / magMax * 100
  end
  
  if percentage <= B.SavedVariables.resourceThreshold then return true
  else return false end
end

-- This function runs before synergy prompt on-screen and determines whether or not the prompt appears
-- If the intercept function returns true the target function won't run
local function Intercept()
  local synergyName, iconFilename = GetSynergyInfo()
  local synergyId = BS.GetSynergyId(synergyName)

  if synergyName and iconFilename then
    if B.SavedVariables[synergyId] ~= nil then
      if B.SavedVariables[synergyId] == false then return true end
    else return false end -- Always allow unknown synergy

    if synergyName == "Destructive Outbreak" and B.SavedVariables.blockDO then
      LibDialog:ShowDialog(BS.name .. "DODialog", "DOConfirmation")
      return false
    end

    if not GetLokke() then SHARED_INFORMATION_AREA:SetHidden(SYNERGY, true) return true end
    if not GetAlkosh() then SHARED_INFORMATION_AREA:SetHidden(SYNERGY, true) return true end
    if not IsResourceLow() then SHARED_INFORMATION_AREA:SetHidden(SYNERGY, true) return true end
  end
end

local function BarswapRefresh(_, didBarswap)
  if didBarswap then SYNERGY:OnSynergyAbilityChanged() end
end

function B.Initialise()
  if BS.isAccountWide then
    B.SavedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Block", B.Defaults)
  else
    B.SavedVariables = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, "Block", B.Defaults)
  end

  -- Confirmation dialog for Destructive Outbreak
  LibDialog:RegisterDialog(BS.name .. "DODialog", "DOConfirmation", "|cFF0000Warning!|r", "Destructive Outbreak can kill the group! Press Confirm to continue.")
  
  ZO_PreHook(SYNERGY, "OnSynergyAbilityChanged", Intercept)
  B.BuildMenu()

  EVENT_MANAGER:RegisterForEvent(BS.name .. "Block", EVENT_ACTION_SLOTS_ACTIVE_HOTBAR_UPDATED, BarswapRefresh)
end