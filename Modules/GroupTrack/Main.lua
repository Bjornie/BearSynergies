BearSynergies.GroupTrack = {
  Default = {
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

local SynergyIcons = {
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

local LFGIcons = {
  [1] = "esoui/art/lfg/lfg_icon_dps.dds",
  [2] = "esoui/art/lfg/lfg_icon_tank.dds",
  [4] = "esoui/art/lfg/lfg_icon_healer.dds",
}

local groupInfo = {}

local BS = BearSynergies
local GT = BS.GroupTrack

local pool

-- Store group members data
local function CreatePool(pool)
  return ZO_ObjectPool_CreateControl("BearSynergiesGroupTrackPlayer", pool, BearSynergiesGroupTrackUI)
end

function GT.Initialise()
  if BS.SavedVariables.isAccountWide then
    GT.SavedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Group Track", GT.Default)
  else
    GT.SavedVariables = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, "Group Track", GT.Default)
  end

  pool = ZO_ObjectPool:New(CreatePool)

  --EVENT_MANAGER:RegisterForEvent(BS.name .. "GroupTrack", EVENT_GROUP_MEMBER_JOINED, )
  --EVENT_MANAGER:RegisterForEvent(BS.name .. "GroupTrack", EVENT_GROUP_MEMBER_LEFT, )
end