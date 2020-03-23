BearSynergies.Track = {
  default = {
    left = 0,
    top = 0,
    offsetX = 48,
    offsetY = 48,

    synergies = {
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
      [18] = false, -- Orb
    },
  },
}

local BS = BearSynergies
local T = BS.Track

local icons = {
  [1] = "esoui/art/icons/ability_dragonknight_006.dds",
  [2] = "esoui/art/icons/ability_dragonknight_010.dds",
  [3] = "esoui/art/icons/ability_necromancer_004.dds",
  [4] = "esoui/art/icons/ability_necromancer_010_b.dds",
  [5] = "esoui/art/icons/ability_nightblade_015.dds",
  [6] = "esoui/art/icons/ability_nightblade_018.dds",
  [7] = "esoui/art/icons/ability_sorcerer_storm_atronach.dds",
  [8] = "esoui/art/icons/ability_sorcerer_lightning_splash.dds",
  [9] = "esoui/art/icons/ability_templar_nova.dds",
  [10] = "esoui/art/icons/ability_templar_cleansing_ritual.dds",
  [11] = "esoui/art/icons/ability_warden_007.dds",
  [12] = "esoui/art/icons/ability_warden_005_b.dds",
  [13] = "esoui/art/icons/ability_werewolf_005_b.dds",
  [14] = "esoui/art/icons/ability_undaunted_001.dds",
  [15] = "esoui/art/icons/ability_undaunted_003.dds",
  [16] = "esoui/art/icons/ability_undaunted_002.dds",
  [17] = "esoui/art/icons/ability_undaunted_005.dds",
  [18] = "esoui/art/icons/ability_undaunted_004.dds",
}

local iconControl = nil
local timerControl = nil

function T.Initialise()
  T.savedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Track", T.default)

  T.CreateControls()
  T.SetPosition()
  T.RestorePosition()
  T.BuildMenu()

  EVENT_MANAGER:RegisterForEvent(BS.name, EVENT_ACTION_LAYER_POPPED, T.Hide)
  EVENT_MANAGER:RegisterForEvent(BS.name, EVENT_ACTION_LAYER_PUSHED, T.Unhide)

  --EVENT_ABILITY_COOLDOWN_UPDATED (number eventCode, number abilityId)
end

function T.CreateControls()
  for i, v in ipairs(T.savedVariables.synergies) do
    iconControl = WINDOW_MANAGER:CreateControlFromVirtual("$(parent)IconControl", BearSynergiesTrackUI, "BearSynergiesTrackIcon", i)
    iconControl:SetTexture(icons[i])

    timerControl = WINDOW_MANAGER:CreateControlFromVirtual("$(parent)TimerControl", BearSynergiesTrackUI, "BearSynergiesTrackTimer", i)
  end
end

function T.SetPosition()
  local counter = 0
  for i, v in ipairs(T.savedVariables.synergies) do
    if v then
      iconControl = BearSynergiesTrackUI:GetNamedChild("IconControl" .. i)
      iconControl:SetHidden(false)
      iconControl:ClearAnchors()
      iconControl:SetAnchor(TOPLEFT, BearSynergiesTrackUI, TOPLEFT, 5 + counter * 53, 5)

      timerControl = BearSynergiesTrackUI:GetNamedChild("TimerControl" .. i)
      timerControl:SetHidden(false)
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

function T.RestorePosition()
  BearSynergiesTrackUI:ClearAnchors()
  BearSynergiesTrackUI:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, T.savedVariables.left, T.savedVariables.top)
end

function T.OnMoveStop()
  T.savedVariables.left = BearSynergiesTrackUI:GetLeft()
  T.savedVariables.top = BearSynergiesTrackUI:GetTop()
end

function T.Hide()
  BearSynergiesTrackUI:SetHidden(false)
end

function T.Unhide()
  BearSynergiesTrackUI:SetHidden(true)
end