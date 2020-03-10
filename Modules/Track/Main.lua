BearSynergies.Track = {
  default = {
    left = 0,
    top = 0,

    synergies = {
      1 = false, -- Shackle
      2 = false, -- Ignite
      3 = false, -- Grave Robber
      4 = false, -- Pure Agony
      5 = false, -- Hidden Refresh
      6 = false, -- Soul Leech
      7 = false, -- Charged Lightning
      8 = false, -- Conduit
      9 = false, -- Nova
      10 = false, -- Purify
      11 = false, -- Harvest
      12 = false, -- Icy Escape
      13 = false, -- Feeding Frenzy
      14 = false, -- Blood Altar
      15 = false, -- Spiders
      16 = false, -- Radiate
      17 = false, -- Bone Shield
      18 = false, -- Orb
    },
  },

  icons = {
    1 = "esoui/art/icons/ability_dragonknight_006.dds",
    2 = "esoui/art/icons/ability_dragonknight_010.dds",
    3 = "esoui/art/icons/ability_necromancer_004.dds",
    4 = "esoui/art/icons/ability_necromancer_010_b.dds",
    5 = "esoui/art/icons/ability_nightblade_015.dds",
    6 = "esoui/art/icons/ability_nightblade_018.dds",
    7 = "esoui/art/icons/ability_sorcerer_storm_atronach.dds",
    8 = "esoui/art/icons/ability_sorcerer_lightning_splash.dds",
    9 = "esoui/art/icons/ability_templar_nova.dds",
    10 = "esoui/art/icons/ability_templar_cleansing_ritual.dds",
    11 = "esoui/art/icons/ability_warden_007.dds",
    12 = "esoui/art/icons/ability_warden_005_b.dds",
    13 = "esoui/art/icons/ability_werewolf_005_b.dds",
    14 = "esoui/art/icons/ability_undaunted_001.dds",
    15 = "esoui/art/icons/ability_undaunted_003.dds",
    16 = "esoui/art/icons/ability_undaunted_002.dds",
    17 = "esoui/art/icons/ability_undaunted_005.dds",
    18 = "esoui/art/icons/ability_undaunted_004.dds",
  },
}

local BS = BearSynergies
local T = BS.Track
local offsetX = 48
local offsetY = 48

function T.Initialise()
  T.savedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Track", T.default)

  T.CreateControls()
  T.SetPositions()
  T.RestorePosition()
  T.BuildMenu()

  --EVENT_ABILITY_COOLDOWN_UPDATED (number eventCode, number abilityId)
end

function T.CreateControls()
  local counter = 1

  for i, v in ipairs(T.savedVariables.synergies) do
    if v == true then
      local IconControl = WINDOW_MANAGER:CreateControlFromVirtual("IconControl", BearSynergiesTrackUI, "SynergyIcon", i)
      IconControl:SetTexture(T.icons[i])

      local TimerControl = WINDOW_MANAGER:CreateControlFromVirtual("TimerControl", SynergyIcon, "SynergyTimer", i)

      T.SetPositions(IconControl, TimerControl, counter)
      counter + 1
    end
  end
end

function T.SetPositions(IconControl, TimerControl, counter)
  IconControl:SetAnchor(TOPLEFT, BearSynergiesTrackUI, TOPLEFT, counter * offsetX, counter * offsetY)
  TimerControl:SetAnchor(CENTER, IconControl, CENTER)
end

function T.RestorePosition()
  BearSynergiesTrackUI:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, T.savedVariables.left, T.savedVariables.top)
end

function T.OnUIMoveStop()
  T.savedVariables.left = BearSynergiesTrackUI:GetLeft()
  T.savedVariables.top = BearSynergiesTrackUI:GetTop()
end