BearSynergies.Track = {
    Default = {
        left = 0,
        top = 0,
        orientation = "Horizontal",
        size = 48,

        Synergies = {
            [1] = false, -- Purify
            [2] = false, -- Conduit
            [3] = false, -- Soul Leech
            [4] = false, -- Orb & Shards
            [5] = false, -- Nova
            [6] = false, -- Shackle
            [7] = false, -- Ignite
            [8] = false, -- Hidden Refresh
            [9] = false, -- Bone Shield
            [10] = false, -- Spiders
            [11] = false, -- Blood Altar
            [12] = false, -- Radiate
            [13] = false, -- Charged Lightning
            [14] = false, -- Feeding Frenzy
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
    [1] = {
        ready = "esoui/art/icons/ability_templar_cleansing_ritual.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Ritual.dds",
    },
    [2] = {
        ready = "esoui/art/icons/ability_sorcerer_lightning_splash.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Conduit.dds",
    },
    [3] = {
        ready = "esoui/art/icons/ability_nightblade_018.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Leech.dds",
    },
    [4] = {
        ready = "esoui/art/icons/ability_undaunted_004.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Orb.dds",
    },
    [5] = {
        ready = "esoui/art/icons/ability_templar_nova.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Nova.dds",
    },
    [6] = {
        ready = "esoui/art/icons/ability_dragonknight_006.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Standard.dds",
    },
    [7] = {
        ready = "esoui/art/icons/ability_dragonknight_010.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Talons.dds",
    },
    [8] = {
        ready = "esoui/art/icons/ability_nightblade_015.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Refresh.dds",
    },
    [9] = {
        ready = "esoui/art/icons/ability_undaunted_005.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Shield.dds",
    },
    [10] = {
        ready = "esoui/art/icons/ability_undaunted_003.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Spider.dds",
    },
    [11] = {
        ready = "esoui/art/icons/ability_undaunted_001.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Altar.dds",
    },
    [12] = {
        ready = "esoui/art/icons/ability_undaunted_002.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Radiate.dds",
    },
    [13] = {
        ready = "esoui/art/icons/ability_sorcerer_storm_atronach.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Atronach.dds",
    },
    [14] = {
        ready = "esoui/art/icons/ability_werewolf_005_b.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Howl.dds",
    },
    [15] = {
        ready = "esoui/art/icons/ability_warden_007.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Harvest.dds",
    },
    [16] = {
        ready = "esoui/art/icons/ability_warden_005_b.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Escape.dds",
    },
    [17] = {
        ready = "",
        cooldown = "",
    },
    [18] = {
        ready = "esoui/art/icons/ability_necromancer_004.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Boneyard.dds",
    },
    [19] = {
        ready = "esoui/art/icons/ability_necromancer_010_b.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Totem.dds",
    },
    [20] = {
        ready = "",
        cooldown = "",
    },
    [21] = {
        ready = "",
        cooldown = "",
    },
}

local BS = BearSynergies
local T = BS.Track
local EM = GetEventManager()
local WM = GetWindowManager()

-- Creates the UI for each synergy
local function CreateControls()
    for i, _ in ipairs(T.SavedVariables.Synergies) do
        WM:CreateControlFromVirtual("$(parent)_Cooldown", BearSynergies_Track_UI, "BearSynergies_Track_Cooldown", i)

        BearSynergies_Track_UI:GetNamedChild("_Cooldown" .. i .. "_Icon"):SetTexture(icons[i].ready)
    end
end

-- Calculates dimensions for background
local function GetBackgroundDimensions(counter)
    local x = counter * (T.SavedVariables.size + math.floor(T.SavedVariables.size / 10)) + math.floor(T.SavedVariables.size / 10)
    local y = T.SavedVariables.size + math.floor(T.SavedVariables.size / 5)

    if T.SavedVariables.orientation == "Horizontal" then return x, y
    else return y, x end
end

-- Resize background
local function UpdateBackground(counter)
    local backgroundControl = BearSynergies_Track_UI:GetNamedChild("_Texture")

    if counter > 0 then
        backgroundControl:SetHidden(false)
        backgroundControl:SetDimensions(GetBackgroundDimensions(counter))
    else backgroundControl:SetHidden(true) end
end

-- Calculates x and y offset for cooldown controls
local function GetControlAnchorOffset(counter)
    local offsetX = math.floor(T.SavedVariables.size / 10) + counter * (T.SavedVariables.size + math.floor(T.SavedVariables.size / 10))
    local offsetY = math.floor(T.SavedVariables.size / 10)

    if T.SavedVariables.orientation == "Horizontal" then return offsetX, offsetY
    else return offsetY, offsetX end
end

-- Hides UI for disabled synergies, unhides UI for enabled synergies and positions them
function T.UpdateUI()
    local counter = 0
    local fontSize = math.floor(T.SavedVariables.size / 1.5)
    local cooldownControl

    for i, v in ipairs(T.SavedVariables.Synergies) do
        cooldownControl = BearSynergies_Track_UI:GetNamedChild("_Cooldown" .. i)

        if v then
            cooldownControl:SetHidden(false)
            cooldownControl:ClearAnchors()
            cooldownControl:SetAnchor(TOPLEFT, BearSynergies_Track_UI, TOPLEFT, GetControlAnchorOffset(counter))
            cooldownControl:GetNamedChild("_Icon"):SetDimensions(T.SavedVariables.size, T.SavedVariables.size)
            cooldownControl:GetNamedChild("_Timer"):SetFont("$(GAMEPAD_MEDIUM_FONT)|" .. fontSize .. "|thick-outline")

            counter = counter + 1
        else cooldownControl:SetHidden(true) end
    end

    UpdateBackground(counter)
end

-- Updates the timer for synergies on cooldown
local function UpdateCooldown(trackingNumber, cooldownTimerControl)
    if cooldownTimerControl:GetText() ~= "0" then cooldownTimerControl:SetText(tonumber(cooldownTimerControl:GetText()) - 1) end

    if cooldownTimerControl:GetText() == "0" then
        BearSynergies_Track_UI:GetNamedChild("_Cooldown" .. trackingNumber .. "_Icon"):SetTexture(icons[trackingNumber].ready)
        cooldownTimerControl:SetHidden(true)
        cooldownTimerControl:SetColor(0, 255, 0)

        EM:UnregisterForUpdate(BS.name .. "UpdateCooldown" .. trackingNumber)
    end
end

-- Initiates cooldown for synergies
local function StartCooldown(eventCode, result, isError, abilityName, abilityGraphic, abilityActionSlotType, sourceName, sourceType, targetName, targetType, hitValue, powerType, damageType, log, sourceUnitId, targetUnitId, abilityId, overflow)
    if BS.CooldownId[abilityId] then
        local trackingNumber = BS.CooldownId[abilityId]
        local cooldownTimerControl = BearSynergies_Track_UI:GetNamedChild("_Cooldown" .. trackingNumber .. "_Timer")

        BearSynergies_Track_UI:GetNamedChild("_Cooldown" .. trackingNumber .. "_Icon"):SetTexture(icons[trackingNumber].cooldown)
        cooldownTimerControl:SetHidden(false)
        cooldownTimerControl:SetText("20")
        cooldownTimerControl:SetColor(255, 0, 0)

        EM:RegisterForUpdate(BS.name .. "UpdateCooldown" .. trackingNumber, 1000, function() UpdateCooldown(trackingNumber, cooldownTimerControl) end)
    end
end

-- Hides/unhides the UI when a menu is opened/closed
local function ToggleUI(oldState, newState)
    if newState == SCENE_SHOWN then BearSynergies_Track_UI:SetHidden(false)
    else BearSynergies_Track_UI:SetHidden(true) end
end

local function RestorePosition()
    BearSynergies_Track_UI:ClearAnchors()
    BearSynergies_Track_UI:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, T.SavedVariables.left, T.SavedVariables.top)
end

function T.OnMoveStop()
    T.SavedVariables.left = BearSynergies_Track_UI:GetLeft()
    T.SavedVariables.top = BearSynergies_Track_UI:GetTop()
end

function T.Initialise()
    if BS.SavedVariables.isAccountWide then T.SavedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Track", T.Default)
    else T.SavedVariables = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, "Track", T.Default) end

    CreateControls()
    RestorePosition()
    T.UpdateUI()
    T.BuildMenu()

    SCENE_MANAGER:GetScene("hud"):RegisterCallback("StateChange", ToggleUI)
    SCENE_MANAGER:GetScene("hudui"):RegisterCallback("StateChange", ToggleUI)

    EM:RegisterForEvent(BS.name .. "Track", EVENT_COMBAT_EVENT, StartCooldown)
    EM:AddFilterForEvent(BS.name .. "Track", EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_EFFECT_GAINED, REGISTER_FILTER_SOURCE_COMBAT_UNIT_TYPE, COMBAT_UNIT_TYPE_PLAYER, REGISTER_FILTER_TARGET_COMBAT_UNIT_TYPE, COMBAT_UNIT_TYPE_PLAYER)
end