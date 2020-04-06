BearSynergies.Track = {
  Defaults = {
    left = 0,
    top = 0,

    Synergies = {
      [1] = false, -- Shackle
      [2] = false, -- Ignite
      [3] = false, -- Grave Robber
      [4] = false, -- Pure Agony
      [5] = false, -- Hidden Refresh
      [6] = false, -- Soul Leech
      [7] = false, -- Charged Lightning
      [8] = false, -- Conduit
      [9] = false, -- Nova
      [10] = false, -- Purify
      [11] = false, -- Harvest
      [12] = false, -- Icy Escape
      [13] = false, -- Feeding Frenzy
      [14] = false, -- Blood Altar
      [15] = false, -- Spiders
      [16] = false, -- Radiate
      [17] = false, -- Bone Shield
      [18] = false, -- Orb & Shards
    },
  },
}

local BS = BearSynergies
local D = BS.Data
local T = BS.Track

local icons = {
  [1] = {
    ready = "esoui/art/icons/ability_dragonknight_006.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Standard.dds",
  },
  [2] = {
    ready = "esoui/art/icons/ability_dragonknight_010.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Talons.dds",
  },
  [3] = {
    ready = "esoui/art/icons/ability_necromancer_004.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Boneyard.dds",
  },
  [4] = {
    ready = "esoui/art/icons/ability_necromancer_010_b.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Totem.dds",
  },
  [5] = {
    ready = "esoui/art/icons/ability_nightblade_015.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Refresh.dds",
  },
  [6] = {
    ready = "esoui/art/icons/ability_nightblade_018.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Leech.dds",
  },
  [7] = {
    ready = "esoui/art/icons/ability_sorcerer_storm_atronach.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Atronach.dds",
  },
  [8] = {
    ready = "esoui/art/icons/ability_sorcerer_lightning_splash.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Conduit.dds",
  },
  [9] = {
    ready = "esoui/art/icons/ability_templar_nova.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Nova.dds",
  },
  [10] = {
    ready = "esoui/art/icons/ability_templar_cleansing_ritual.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Ritual.dds",
  },
  [11] = {
    ready = "esoui/art/icons/ability_warden_007.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Harvest.dds",
  },
  [12] = {
    ready = "esoui/art/icons/ability_warden_005_b.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Escape.dds",
  },
  [13] = {
    ready = "esoui/art/icons/ability_werewolf_005_b.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Howl.dds",
  },
  [14] = {
    ready = "esoui/art/icons/ability_undaunted_001.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Altar.dds",
  },
  [15] = {
    ready = "esoui/art/icons/ability_undaunted_003.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Spider.dds",
  },
  [16] = {
    ready = "esoui/art/icons/ability_undaunted_002.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Radiate.dds",
  },
  [17] = {
    ready = "esoui/art/icons/ability_undaunted_005.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Shield.dds",
  },
  [18] = {
    ready = "esoui/art/icons/ability_undaunted_004.dds",
    cooldown = "BearSynergies/Modules/Track/Images/Orb.dds",
  },
}

local iconControl = nil
local timerControl = nil
local iconControlCD = nil
local timerControlCD = nil

-- Creates the UI for each synergy
local function CreateControls()
  for i, _ in ipairs(T.SavedVariables.Synergies) do
    WINDOW_MANAGER:CreateControlFromVirtual("$(parent)IconControl", BearSynergiesTrackUI, "BearSynergiesTrackIcon", i)
    BearSynergiesTrackUI:GetNamedChild("IconControl" .. i):SetTexture(icons[i].ready)

    WINDOW_MANAGER:CreateControlFromVirtual("$(parent)TimerControl", BearSynergiesTrackUI, "BearSynergiesTrackTimer", i)
  end
end

-- Hides UI for disabled synergies, unhides UI for enabled synergies and positions them 
function T.SetPosition()
  local counter = 0
  
  for i, v in ipairs(T.SavedVariables.Synergies) do
    if v then
      iconControl = BearSynergiesTrackUI:GetNamedChild("IconControl" .. i)
      iconControl:SetHidden(false)
      iconControl:ClearAnchors()
      iconControl:SetAnchor(TOPLEFT, BearSynergiesTrackUI, TOPLEFT, 5 + counter * 53, 5)

      timerControl = BearSynergiesTrackUI:GetNamedChild("TimerControl" .. i)
      timerControl:SetHidden(false)
      timerControl:ClearAnchors()
      timerControl:SetAnchor(CENTER, iconControl, CENTER)

      counter = counter + 1
    else
      BearSynergiesTrackUI:GetNamedChild("IconControl" .. i):SetHidden(true)
      BearSynergiesTrackUI:GetNamedChild("TimerControl" .. i):SetHidden(true)
    end
  end

  if counter ~= 0 then
    BearSynergiesTrackUI:GetNamedChild("Backdrop"):SetHidden(false)
    BearSynergiesTrackUI:GetNamedChild("Backdrop"):SetDimensions( 5 + counter * 53, 58)
  else
    BearSynergiesTrackUI:GetNamedChild("Backdrop"):SetHidden(true)
  end
end

-- Updates the timer for synergies on cooldown
local function UpdateCooldown(abilityId)
  iconControlCD = BearSynergiesTrackUI:GetNamedChild("IconControl" .. D[abilityId].trackingNumber)
  timerControlCD = BearSynergiesTrackUI:GetNamedChild("TimerControl" .. D[abilityId].trackingNumber)

  if timerControlCD:GetText() ~= "0.0" then
    timerControlCD:SetText(string.format("%.1f", (tonumber(timerControlCD:GetText()) - 0.1)))
  end

  if timerControlCD:GetText() == "0.0" then
    iconControlCD:SetTexture(icons[D[abilityId].trackingNumber].ready)
    timerControlCD:SetColor(0, 255, 0, 1)
    EVENT_MANAGER:UnregisterForUpdate(BS.name .. "UpdateCooldown" .. D[abilityId].trackingNumber)
  end
end

-- Initiates cooldown for synergies
local function StartCooldown(_, _, _, _, _, _, _, sourceType, _, _, _, _, _, _, _, _, abilityId)
  if sourceType == COMBAT_UNIT_TYPE_GROUP or sourceType == COMBAT_UNIT_TYPE_PLAYER then
    if D[abilityId] then
      if D[abilityId].trackingNumber then
        BearSynergiesTrackUI:GetNamedChild("TimerControl" .. D[abilityId].trackingNumber):SetText("20")
        BearSynergiesTrackUI:GetNamedChild("TimerControl" .. D[abilityId].trackingNumber):SetColor(255, 0, 0, 1)
        BearSynergiesTrackUI:GetNamedChild("IconControl" .. D[abilityId].trackingNumber):SetTexture(icons[D[abilityId].trackingNumber].cooldown)
        EVENT_MANAGER:RegisterForUpdate(BS.name .. "UpdateCooldown" .. D[abilityId].trackingNumber, 100, function() UpdateCooldown(abilityId) end)
      end
    end
  end
end

-- Hides/unhides the UI when a menu is opened/closed
local function ToggleUI(oldState, newState)
  if newState == SCENE_SHOWN then
    BearSynergiesTrackUI:SetHidden(false)
  elseif newState == SCENE_HIDDEN then
    BearSynergiesTrackUI:SetHidden(true)
  end
end

local function RestorePosition()
  BearSynergiesTrackUI:ClearAnchors()
  BearSynergiesTrackUI:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, T.SavedVariables.left, T.SavedVariables.top)
end

function T.OnMoveStop()
  T.SavedVariables.left = BearSynergiesTrackUI:GetLeft()
  T.SavedVariables.top = BearSynergiesTrackUI:GetTop()
end

function T.Initialise()
  if BS.SavedVariables.isAccountWide then
    T.SavedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Track", T.Defaults)
  else
    T.SavedVariables = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, "Track", T.Defaults)
  end

  CreateControls()
  RestorePosition()
  T.SetPosition()
  T.BuildMenu()

  SCENE_MANAGER:GetScene("hud"):RegisterCallback("StateChange", ToggleUI)
  SCENE_MANAGER:GetScene("hudui"):RegisterCallback("StateChange", ToggleUI)

  EVENT_MANAGER:RegisterForEvent(BS.name .. "Track", EVENT_COMBAT_EVENT, StartCooldown)
end