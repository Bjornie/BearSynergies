BearSynergies.Track = {
  default = {
    left = 0,
    top = 0,

    synergies = {
      shackle = false,
      ignite = false,
      graveRobber = false,
      pureAgony = false,
      hiddenRefresh = false,
      soulLeech = false,
      chargedLightning = false,
      conduit = false,
      nova = false,
      purify = false,
      harvest = false,
      icyEscape = false,
      feedingFrenzy = false,
      bloodAltar = false,
      spiders = false,
      radiate = false,
      boneShield = false,
      orb = false,
    },
  },

  icons = {
    shackle = "esoui/art/icons/ability_dragonknight_006.dds",
    ignite = "esoui/art/icons/ability_dragonknight_010.dds",
    graveRobber = "esoui/art/icons/ability_necromancer_004.dds",
    pureAgony = "esoui/art/icons/ability_necromancer_010_b.dds",
    hiddenRefresh = "esoui/art/icons/ability_nightblade_015.dds",
    soulLeech = "esoui/art/icons/ability_nightblade_018.dds",
    chargedLightning = "esoui/art/icons/ability_sorcerer_storm_atronach.dds",
    conduit = "esoui/art/icons/ability_sorcerer_lightning_splash.dds",
    nova = "esoui/art/icons/ability_templar_nova.dds",
    purify = "esoui/art/icons/ability_templar_cleansing_ritual.dds",
    harvest = "esoui/art/icons/ability_warden_007.dds",
    icyEscape = "esoui/art/icons/ability_warden_005_b.dds",
    feedingFrenzy = "esoui/art/icons/ability_werewolf_005_b.dds",
    bloodAltar = "esoui/art/icons/ability_undaunted_001.dds",
    spiders = "esoui/art/icons/ability_undaunted_003.dds",
    radiate = "esoui/art/icons/ability_undaunted_002.dds",
    boneShield = "esoui/art/icons/ability_undaunted_005.dds",
    orb = "esoui/art/icons/ability_undaunted_004.dds",
  },
}

local BS = BearSynergies
local T = BS.Track

function T.Initialise()
  T.savedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Track", T.default)

  T.CreateControls()
  T.RestorePosition()
  T.BuildMenu()
end

function T.CreateControls()
  for k, v in pairs(T.savedVariables.synergies) do
    if v == true then
      local SynergyIcon = WINDOW_MANAGER:CreateControlFromVirtual("$(parent)" .. k, BearSynergiesTrackUI, "SynergyIcon")
      SynergyIcon:SetTexture(T.icons[k])
      SynergyIcon:SetAnchor(TOPLEFT, BearSynergiesTrackUI, TOPLEFT, 0, 0)

      local SynergyTimer = WINDOW_MANAGER:CreateControlFromVirtual("$(parent)" .. k, SynergyIcon, "SynergyTimer")
    end
  end
end

function T.RestorePosition()
  BearSynergiesTrackUI:ClearAnchors()
  BearSynergiesTrackUI:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, T.savedVariables.left, T.savedVariables.top)
end

function T.OnUIMoveStop()
  T.savedVariables.left = BearSynergiesTrackUI:GetLeft()
  T.savedVariables.top = BearSynergiesTrackUI:GetTop()
end