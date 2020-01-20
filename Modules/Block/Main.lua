BearSynergies.Block = {
  default = {
    isLokke = false,
    isAlkosh = false,
    isResource = false,
    resourceThreshold = 50,
    blockDO = true,

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
local LD = LibDialog

local allowDO = false
-- Item IDs for Lokke and Alkosh
local imperfLokke = "|H1:item:149795:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"
local perfLokke = "|H1:item:150996:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"
local alkosh = "|H1:item:73058:370:50:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"

function B.Initialize()
  B.savedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Block", B.default)

  -- Build confirmation dialog for Destructive Outbreak
  LD:RegisterDialog(BS.name .. "DODialog", "DOConfirmation", "|cFF0000Warning!|r",
                    "Destructive Outbreak can kill the group! Press Confirm to continue.", callbackYes)
  
  B.SynergyBlock()
  B.BuildMenu()

  EM:RegisterForEvent(BS.name, EVENT_ACTION_SLOTS_ACTIVE_HOTBAR_UPDATED, B.BarswapRefresh)
end

-- This function determines whether the synergy prompt on-screen appears or not
function B.SynergyBlock()
  local onSynAbChng = SYNERGY.OnSynergyAbilityChanged

  function SYNERGY:OnSynergyAbilityChanged()
    local synergyName, iconFilename = GetSynergyInfo()

    if synergyName and iconFilename then
      -- Check if synergy is disabled
      if B.savedVariables[synergyName] ~= nil then
        if B.savedVariables[synergyName] == false then return false end
      else return true end -- Always allow unknown synergy

      if synergyName == "Destructive Outbreak" and B.savedVariables.blockDO and not allowDO then
        B.DODialog()
      else allowDO = false end
      
      -- Check Lokke pieces active
      if not B.GetLokke() then SHARED_INFORMATION_AREA:SetHidden(self, true) return false end
      -- Check Alkosh pieces active
      if not B.GetAlkosh() then SHARED_INFORMATION_AREA:SetHidden(self, true) return false end
      -- Check current resource
      if not B.IsResourceLow() then SHARED_INFORMATION_AREA:SetHidden(self, true) return false end
    end

    onSynAbChng(self) -- No idea why this is needed but it is
  end
end

function B.DODialog()
  LD:ShowDialog(BS.name .. "DODialog", "DOConfirmation")
end

function callbackYes()
  allowDO = true
end

-- Checks whether or not Tooth of Lokkestiiz is equipped.
function B.GetLokke()
  -- If disabled return true
  if B.savedVariables.isLokke == false then return true end
  
  local imperfEquipped, perfEquipped = 0
  local _, _, _, imperfEquipped = GetItemLinkSetInfo(imperfLokke, true)
  local _, _, _, perfEquipped = GetItemLinkSetInfo(perfLokke, true)

  -- If Lokke Mode is enabled but no Lokke pieces are equipped don't block synergies
  if (imperfEquipped == 0) and (perfEquipped == 0) then return true end
  if (imperfEquipped == 5) or (perfEquipped == 5) then return true
  else return false end
end

-- Checks whether or not Roar of Alkosh is equipped.
function B.GetAlkosh()
  -- If disabled return true
  if B.savedVariables.isAlkosh == false then return true end
  
  local alkoshEquipped = 0
  local _, _, _, alkoshEquipped = GetItemLinkSetInfo(alkosh, true)
  
  -- If Alkosh Mode is enabled but no Alkosh pieces are equipped don't block synergies
  if alkoshEquipped == 0 then return true end
  if alkoshEquipped == 5 then return true 
  else return false end
end

-- Checks resource percentage and compares with defined options value
function B.IsResourceLow()
  -- If disabled return false
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

function B.BarswapRefresh(_, didBarswap)
  if didBarswap then SYNERGY:OnSynergyAbilityChanged() end
end