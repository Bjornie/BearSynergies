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
            [17] = false, -- Grave Robber
            [18] = false, -- Pure Agony
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
        ready = "esoui/art/icons/ability_necromancer_004.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Boneyard.dds",
    },
    [18] = {
        ready = "esoui/art/icons/ability_necromancer_010_b.dds",
        cooldown = "BearSynergies/Modules/Track/Images/Totem.dds",
    },
}

local BS = BearSynergies
local D = BS.Data
local T = BS.Track

-- Creates the UI for each synergy
local function CreateControls()
    for i, _ in ipairs(T.SavedVariables.Synergies) do
        WINDOW_MANAGER:CreateControlFromVirtual("$(parent)Cooldown", BearSynergiesTrackUI, "BearSynergiesTrackCooldown", i)

        BearSynergiesTrackUI:GetNamedChild("Cooldown" .. i .. "Icon"):SetTexture(icons[i].ready)
        BearSynergiesTrackUI:GetNamedChild("Cooldown" .. i .. "Icon"):SetDimensions(T.SavedVariables.size, T.SavedVariables.size)
        BearSynergiesTrackUI:GetNamedChild("Cooldown" .. i .. "Timer"):SetFont("$(GAMEPAD_MEDIUM_FONT)|" .. math.floor(T.SavedVariables.size / 2) .. "|thick-outline")
    end
end

-- Calculates x and y offset for cooldown controls
local function GetControlAnchorOffset(counter)
    local offsetX = math.floor(T.SavedVariables.size / 10) + counter * (T.SavedVariables.size + math.floor(T.SavedVariables.size / 10))
    local offsetY = math.floor(T.SavedVariables.size / 10)

    if T.SavedVariables.orientation == "Horizontal" then return offsetX, offsetY
    else return offsetY, offsetX end
end

-- Calculates dimensions for background
local function GetBackgroundDimensions(counter)
    local x = counter * (T.SavedVariables.size + math.floor(T.SavedVariables.size / 10)) + math.floor(T.SavedVariables.size / 10)
    local y = T.SavedVariables.size + 2 * math.floor(T.SavedVariables.size / 10)

    if T.SavedVariables.orientation == "Horizontal" then return x, y
    else return y, x end
end

-- Resize background
local function UpdateBackground(counter)
    local backgroundControl = BearSynergiesTrackUI:GetNamedChild("Texture")

    if counter > 0 then
        backgroundControl:SetHidden(false)
        backgroundControl:SetDimensions(GetBackgroundDimensions(counter))
    else backgroundControl:SetHidden(true) end
end

-- Resize icon and timer
local function UpdateIconSize()
    local cooldownControl = nil
    local fontSize = math.floor(T.SavedVariables.size / 2)

    for i, _ in ipairs(T.SavedVariables.Synergies) do
        cooldownControl = BearSynergiesTrackUI:GetNamedChild("Cooldown" .. i)

        cooldownControl:GetNamedChild("Icon"):SetDimensions(T.SavedVariables.size, T.SavedVariables.size)
        cooldownControl:GetNamedChild("Timer"):SetFont("$(GAMEPAD_MEDIUM_FONT)|" .. fontSize .. "|thick-outline")
    end
end

-- Hides UI for disabled synergies, unhides UI for enabled synergies and positions them
function T.UpdateUI()
    local counter = 0
    local cooldownControl = nil

    for i, v in ipairs(T.SavedVariables.Synergies) do
        cooldownControl = BearSynergiesTrackUI:GetNamedChild("Cooldown" .. i)

        if v then
            cooldownControl:SetHidden(false)
            cooldownControl:ClearAnchors()
            cooldownControl:SetAnchor(TOPLEFT, BearSynergiesTrackUI, TOPLEFT, GetControlAnchorOffset(counter))

            counter = counter + 1
        else cooldownControl:SetHidden(true) end
    end

    UpdateBackground(counter)
    UpdateIconSize()
end

-- Updates the timer for synergies on cooldown
local function UpdateCooldown(synergyId)
    local cooldownTimerControl = BearSynergiesTrackUI:GetNamedChild("Cooldown" .. D[synergyId].trackingNumber .. "Timer")

    if cooldownTimerControl:GetText() ~= "0.0" then cooldownTimerControl:SetText(string.format("%.1f", tonumber(cooldownTimerControl:GetText()) - 0.1 )) end

    if cooldownTimerControl:GetText() == "0.0" then
        BearSynergiesTrackUI:GetNamedChild("Cooldown" .. D[synergyId].trackingNumber .. "Icon"):SetTexture(icons[D[synergyId].trackingNumber].ready)
        cooldownTimerControl:SetColor(0, 255, 0)

        EVENT_MANAGER:UnregisterForUpdate(BS.name .. "UpdateCooldown" .. D[synergyId].trackingNumber)
    end
end

-- Initiates cooldown for synergies
local function StartCooldown(_, _, _, abilityName)
    local synergyId = BS.GetSynergyId(abilityName)

    if synergyId then
        BearSynergiesTrackUI:GetNamedChild("Cooldown" .. D[synergyId].trackingNumber .. "Icon"):SetTexture(icons[D[synergyId].trackingNumber].cooldown)
        BearSynergiesTrackUI:GetNamedChild("Cooldown" .. D[synergyId].trackingNumber .. "Timer"):SetText("20")
        BearSynergiesTrackUI:GetNamedChild("Cooldown" .. D[synergyId].trackingNumber .. "Timer"):SetColor(255, 0, 0)

        EVENT_MANAGER:RegisterForUpdate(BS.name .. "UpdateCooldown" .. D[synergyId].trackingNumber, 100, function() UpdateCooldown(synergyId) end)
    end
end

-- Hides/unhides the UI when a menu is opened/closed
local function ToggleUI(_, newState)
    if newState == SCENE_SHOWN then BearSynergiesTrackUI:SetHidden(false)
    else BearSynergiesTrackUI:SetHidden(true) end
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
    if BS.SavedVariables.isAccountWide then T.SavedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Track", T.Default)
    else T.SavedVariables = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, "Track", T.Default) end

    CreateControls()
    RestorePosition()
    T.UpdateUI()
    T.BuildMenu()

    SCENE_MANAGER:GetScene("hud"):RegisterCallback("StateChange", ToggleUI)
    SCENE_MANAGER:GetScene("hudui"):RegisterCallback("StateChange", ToggleUI)

    EVENT_MANAGER:RegisterForEvent(BS.name .. "Track", EVENT_COMBAT_EVENT, StartCooldown)
    EVENT_MANAGER:AddFilterForEvent(BS.name .. "Track", EVENT_COMBAT_EVENT, REGISTER_FILTER_COMBAT_RESULT, ACTION_RESULT_EFFECT_GAINED_DURATION)
    EVENT_MANAGER:AddFilterForEvent(BS.name .. "Track", EVENT_COMBAT_EVENT, REGISTER_FILTER_TARGET_COMBAT_UNIT_TYPE, COMBAT_UNIT_TYPE_PLAYER)
end