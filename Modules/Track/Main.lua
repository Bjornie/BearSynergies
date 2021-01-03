BearSynergies.Track = {
    name = 'BearSynergies_Track',

    Default = {
        left = 0,
        top = 0,
        size = 48,
        orientation = 'Horizontal',
        showOnlyInCombat = false,

        Synergies = {
            [1] = false, -- Shackle
            [2] = false, -- Ignite
            [3] = false, -- Charged Lightning
            [4] = false, -- Conduit
            [5] = false, -- Hidden Refresh
            [6] = false, -- Soul Leech
            [7] = false, -- Orb & Shards
            [8] = false, -- Nova
            [9] = false, -- Purify
            [10] = false, -- Harvest
            [11] = false, -- Icy Escape
            [12] = false, -- Grave Robber
            [13] = false, -- Pure Agony
            [14] = false, -- Blood Altar
            [15] = false, -- Spiders
            [16] = false, -- Radiate
            [17] = false, -- Bone Shield
            [18] = false, -- Feeding Frenzy
            [19] = false, -- Shield of Ursus
            [20] = false, -- Sanguine Burst
            [21] = false, -- Heed the Call
        },
    },
}

local Icons = {
    {
        ready = 'esoui/art/icons/ability_dragonknight_006.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Standard.dds',
    },
    {
        ready = 'esoui/art/icons/ability_dragonknight_010.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Talons.dds',
    },
    {
        ready = 'esoui/art/icons/ability_sorcerer_storm_atronach.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Atronach.dds',
    },
    {
        ready = 'esoui/art/icons/ability_sorcerer_lightning_splash.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Conduit.dds',
    },
    {
        ready = 'esoui/art/icons/ability_nightblade_015.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Refresh.dds',
    },
    {
        ready = 'esoui/art/icons/ability_nightblade_018.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Leech.dds',
    },
    {
        ready = 'esoui/art/icons/ability_undaunted_004.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Orb.dds',
    },
    {
        ready = 'esoui/art/icons/ability_templar_nova.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Nova.dds',
    },
    {
        ready = 'esoui/art/icons/ability_templar_cleansing_ritual.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Ritual.dds',
    },
    {
        ready = 'esoui/art/icons/ability_warden_007.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Harvest.dds',
    },
    {
        ready = 'esoui/art/icons/ability_warden_005_b.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Escape.dds',
    },
    {
        ready = 'esoui/art/icons/ability_necromancer_004.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Boneyard.dds',
    },
    {
        ready = 'esoui/art/icons/ability_necromancer_010_b.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Totem.dds',
    },
    {
        ready = 'esoui/art/icons/ability_undaunted_001.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Altar.dds',
    },
    {
        ready = 'esoui/art/icons/ability_undaunted_003.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Spider.dds',
    },
    {
        ready = 'esoui/art/icons/ability_undaunted_002.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Radiate.dds',
    },
    {
        ready = 'esoui/art/icons/ability_undaunted_005.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Shield.dds',
    },
    {
        ready = 'esoui/art/icons/ability_werewolf_005_b.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Howl.dds',
    },
    {
        ready = 'esoui/art/icons/ability_warden_018_c.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Ursus.dds',
    },
    {
        ready = 'esoui/art/icons/ability_u23_bloodball_chokeonit.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Thorn.dds',
    },
    {
        ready = 'esoui/art/icons/achievement_u26_skyrim_werewolfdevour100.dds',
        cooldown = 'BearSynergies/Modules/Track/Images/Kraglen.dds',
    },
}

local BS = BearSynergies
local T = BS.Track
local EM = GetEventManager()
local WM = GetWindowManager()

local COOLDOWN_FRAGMENT

local function CreateSceneFragment()
    local function CooldownFragmentCondition()
        if T.SV.showOnlyInCombat then return IsUnitInCombat('player')
        else return true end
    end

    COOLDOWN_FRAGMENT = ZO_SimpleSceneFragment:New(BearSynergies_Track_UI)
    COOLDOWN_FRAGMENT:SetConditional(CooldownFragmentCondition)

    HUD_SCENE:AddFragment(COOLDOWN_FRAGMENT)
    HUD_UI_SCENE:AddFragment(COOLDOWN_FRAGMENT)
end

local function CreateControls()
    for i in ipairs(T.SV.Synergies) do
        WM:CreateControlFromVirtual('$(parent)_Cooldown', BearSynergies_Track_UI, 'BearSynergies_Track_Cooldown', i)
        BearSynergies_Track_UI:GetNamedChild('_Cooldown' .. i .. '_Icon'):SetTexture(Icons[i].ready)
    end
end

local function RestorePosition()
    BearSynergies_Track_UI:ClearAnchors()
    BearSynergies_Track_UI:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, T.SV.left, T.SV.top)
end

local function UpdateCooldown(trackingNumber, cooldownTimerControl)
    cooldownTimerControl:SetText(tonumber(cooldownTimerControl:GetText()) - 1)

    if cooldownTimerControl:GetText() == '0' then
        BearSynergies_Track_UI:GetNamedChild('_Cooldown' .. trackingNumber .. '_Icon'):SetTexture(Icons[trackingNumber].ready)
        cooldownTimerControl:SetHidden(true)

        EM:UnregisterForUpdate(T.name .. 'UpdateCooldown' .. trackingNumber)
    end
end

local function StartCooldown(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, abilityId)
    local trackingNumber = BS.CooldownId[abilityId]
    local cooldownTimerControl = BearSynergies_Track_UI:GetNamedChild('_Cooldown' .. trackingNumber .. '_Timer')

    BearSynergies_Track_UI:GetNamedChild('_Cooldown' .. trackingNumber .. '_Icon'):SetTexture(Icons[trackingNumber].cooldown)
    cooldownTimerControl:SetHidden(false)
    cooldownTimerControl:SetText('20')

    EM:RegisterForUpdate(T.name .. 'UpdateCooldown' .. trackingNumber, 1000, function() UpdateCooldown(trackingNumber, cooldownTimerControl) end)
end

local function GetBackgroundDimensions(counter)
    local x = T.SV.size / 10 + counter * (T.SV.size + T.SV.size / 10)
    local y = T.SV.size / 5 + T.SV.size

    if T.SV.orientation == 'Horizontal' then return x, y
    else return y, x end
end

local function UpdateBackground(counter)
    local backgroundControl = BearSynergies_Track_UI:GetNamedChild('_Background')

    if counter > 0 then
        backgroundControl:SetHidden(false)
        backgroundControl:SetDimensions(GetBackgroundDimensions(counter))
    else backgroundControl:SetHidden(true) end
end

local function GetControlAnchorOffset(counter)
    local offsetX = T.SV.size / 10 + counter * (T.SV.size + T.SV.size / 10)
    local offsetY = T.SV.size / 10

    if T.SV.orientation == 'Horizontal' then return offsetX, offsetY
    else return offsetY, offsetX end
end

function T.UpdateUI()
    local counter = 0
    local fontSize = T.SV.size / 1.5
    local cooldownControl

    for i, v in ipairs(T.SV.Synergies) do
        cooldownControl = BearSynergies_Track_UI:GetNamedChild('_Cooldown' .. i)

        if v then
            cooldownControl:SetHidden(false)
            cooldownControl:SetAnchor(TOPLEFT, BearSynergies_Track_UI, TOPLEFT, GetControlAnchorOffset(counter))
            cooldownControl:GetNamedChild('_Icon'):SetDimensions(T.SV.size, T.SV.size)
            cooldownControl:GetNamedChild('_Timer'):SetFont('$(GAMEPAD_MEDIUM_FONT)|' .. fontSize .. '|thick-outline')

            counter = counter + 1
        else cooldownControl:SetHidden(true) end
    end

    UpdateBackground(counter)
end

function T.PlayerCombatState()
    COOLDOWN_FRAGMENT:Refresh()
end

function T.OnMoveStop()
    T.SV.left = BearSynergies_Track_UI:GetLeft()
    T.SV.top = BearSynergies_Track_UI:GetTop()
end

function T.Initialise()
    if BS.SV.isAccountWide then T.SV = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, 'Track', T.Default)
    else T.SV = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, 'Track', T.Default) end

    CreateSceneFragment()
    CreateControls()
    RestorePosition()
    T.UpdateUI()
    T.BuildMenu()

    local eventName
    for k in pairs(BS.CooldownId) do
        eventName = string.format('%s%d', T.name, k)
        EM:RegisterForEvent(eventName, EVENT_COMBAT_EVENT, StartCooldown)
        EM:AddFilterForEvent(eventName, EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_EFFECT_GAINED, REGISTER_FILTER_ABILITY_ID, k)
    end

    EM:RegisterForEvent(T.name, EVENT_PLAYER_COMBAT_STATE, T.PlayerCombatState)
end