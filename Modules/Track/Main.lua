BearSynergies.Track = {
    name = 'BearSynergies_Track',
    isUILocked = true,

    defaults = {
        left = 0,
        top = 0,
        size = 48,
        orientation = 'Horizontal',
        showOnlyInCombat = false,

        synergies = {
            [1] = false, -- Purify
            [2] = false, -- Soul Leech
            [3] = false, -- Hidden Refresh
            [4] = false, -- Bone Shield
            [5] = false, -- Spiders
            [6] = false, -- Blood Altar
            [7] = false, -- Radiate
            [8] = false, -- Conduit
            [9] = false, -- Ignite
            [10] = false, -- Orbs & Shards
            [11] = false, -- Charged Lightning
            [12] = false, -- Nova
            [13] = false, -- Feeding Frenzy
            [14] = false, -- Shackle
            [15] = false, -- Harvest
            [16] = false, -- Icy Escape
            [17] = false, -- Shield of Ursus
            [18] = false, -- Grave Robber
            [19] = false, -- Pure Agony
            [20] = false, -- Sanguine Burst
            [21] = false, -- Heed the Call
        },
    },
}

local icons = {
    [1] = 'esoui/art/icons/ability_templar_cleansing_ritual.dds',
    [2] = 'esoui/art/icons/ability_nightblade_018.dds',
    [3] = 'esoui/art/icons/ability_nightblade_015.dds',
    [4] = 'esoui/art/icons/ability_undaunted_005.dds',
    [5] = 'esoui/art/icons/ability_undaunted_003.dds',
    [6] = 'esoui/art/icons/ability_undaunted_001.dds',
    [7] = 'esoui/art/icons/ability_undaunted_002.dds',
    [8] = 'esoui/art/icons/ability_sorcerer_lightning_splash.dds',
    [9] = 'esoui/art/icons/ability_dragonknight_010.dds',
    [10] = 'esoui/art/icons/ability_undaunted_004.dds',
    [11] = 'esoui/art/icons/ability_sorcerer_storm_atronach.dds',
    [12] = 'esoui/art/icons/ability_templar_nova.dds',
    [13] = 'esoui/art/icons/ability_werewolf_005_b.dds',
    [14] = 'esoui/art/icons/ability_dragonknight_006.dds',
    [15] = 'esoui/art/icons/ability_warden_007.dds',
    [16] = 'esoui/art/icons/ability_warden_005_b.dds',
    [17] = 'esoui/art/icons/ability_warden_018_c.dds',
    [18] = 'esoui/art/icons/ability_necromancer_004.dds',
    [19] = 'esoui/art/icons/ability_necromancer_010_b.dds',
    [20] = 'esoui/art/icons/ability_u23_bloodball_chokeonit.dds',
    [21] = 'esoui/art/icons/achievement_u26_skyrim_werewolfdevour100.dds',
}

local BS = BearSynergies
local T = BS.Track
local EM = GetEventManager()
local WM = GetWindowManager()

local cooldownFragment

local function CreateSceneFragment()
    local function CooldownFragmentCondition()
        if T.SV.showOnlyInCombat and T.isUILocked then return IsUnitInCombat('player')
        else return true end
    end

    cooldownFragment = ZO_SimpleSceneFragment:New(BearSynergies_Track_UI)
    cooldownFragment:SetConditional(CooldownFragmentCondition)
    HUD_SCENE:AddFragment(cooldownFragment)
    HUD_UI_SCENE:AddFragment(cooldownFragment)
end

local function CreateControls()
    for i in ipairs(T.SV.synergies) do
        WM:CreateControlFromVirtual('$(parent)_Cooldown', BearSynergies_Track_UI, 'BearSynergies_Track_Cooldown', i)
        BearSynergies_Track_UI:GetNamedChild('_Cooldown' .. i .. '_Icon'):SetTexture(icons[i])
    end
end

local function RestorePosition()
    BearSynergies_Track_UI:ClearAnchors()
    BearSynergies_Track_UI:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, T.SV.left, T.SV.top)
end

local function UpdateCooldown(trackingNumber, cooldownTimerControl)
    cooldownTimerControl:SetText(tonumber(cooldownTimerControl:GetText()) - 1)

    if cooldownTimerControl:GetText() == '0' then
        BearSynergies_Track_UI:GetNamedChild('_Cooldown' .. trackingNumber .. '_Icon'):SetDesaturation(0)
        cooldownTimerControl:SetHidden(true)

        EM:UnregisterForUpdate(T.name .. 'UpdateCooldown' .. trackingNumber)
    end
end

local function StartCooldown(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, abilityId)
    local trackingNumber = BS.cooldownId[abilityId]
    local cooldownTimerControl = BearSynergies_Track_UI:GetNamedChild('_Cooldown' .. trackingNumber .. '_Timer')

    BearSynergies_Track_UI:GetNamedChild('_Cooldown' .. trackingNumber .. '_Icon'):SetDesaturation(1)
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

    for i, v in ipairs(T.SV.synergies) do
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

function T.ToggleUI()
    T.isUILocked = not T.isUILocked

    if not T.isUILocked then
        BearSynergies_Track_UI:SetMouseEnabled(true)
        BearSynergies_Track_UI:SetMovable(true)
    else
        BearSynergies_Track_UI:SetMouseEnabled(false)
        BearSynergies_Track_UI:SetMovable(false)
    end
end

function T.PlayerCombatState()
    cooldownFragment:Refresh()
end

function T.OnMoveStop()
    T.SV.left = BearSynergies_Track_UI:GetLeft()
    T.SV.top = BearSynergies_Track_UI:GetTop()
end

function T.Initialise()
    if BS.sv.isAccountWide then T.SV = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, 'Track', T.defaults)
    else T.SV = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, 'Track', T.defaults) end

    CreateSceneFragment()
    CreateControls()
    RestorePosition()
    T.UpdateUI()
    T.BuildMenu()

    local eventName
    for k in pairs(BS.cooldownId) do
        eventName = string.format('%s%d', T.name, k)
        EM:RegisterForEvent(eventName, EVENT_COMBAT_EVENT, StartCooldown)
        EM:AddFilterForEvent(eventName, EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_EFFECT_GAINED, REGISTER_FILTER_ABILITY_ID, k)
    end

    EM:RegisterForEvent(T.name, EVENT_PLAYER_COMBAT_STATE, T.PlayerCombatState)
end