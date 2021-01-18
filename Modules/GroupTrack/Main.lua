BearSynergies.GroupTrack = {
    name = 'BearSynergies_GroupTrack',

    Default = {
        [22270] = false,
        [25172] = false,
        [37733] = false,
        [39424] = false,
        [39451] = false,
        [39521] = false,
        [41840] = false,
        [41966] = false,
        [41997] = false,
        [42019] = false,
        [42196] = false,
        [43769] = false,
        [48040] = false,
        [48052] = false,
        [48085] = false,
        [48938] = false,
        [48939] = false,
        [58813] = false,
        [63512] = false,
        [67717] = false,
        [85434] = false,
        [85572] = false,
        [88892] = false,
        [95924] = false,
        [111440] = false,
        [115567] = false,
        [118610] = false,
        [141971] = false,
        [142713] = false,
    },
}

local BS = BearSynergies
local GT = BS.GroupTrack
local EM = GetEventManager()

local playerPool
local groupSizeOnline = 0
local unitsNum = 0

local UnitList = {}
local IdTag = {}

local function AddUnit(_, _, _, _, unitTag, _, _, _, _, _, _, _, _, _, unitId)
    local unit = UnitList[unitTag]

    if unit and not IdTag[unitId] then
        unit.unitId = unitId
        IdTag[unitId] = unitTag
        unitsNum = unitsNum + 1
    end

    if unitsNum >= groupSizeOnline then EM:UnregisterForEvent(GT.name, EVENT_EFFECT_CHANGED) end
end

local function RefreshUnits()
    UnitList = {}

    local tag

    for i = 1, GetGroupSize() do
        tag = GetGroupUnitTagByIndex(i)
        UnitList[tag] = {
            unitId = 0,
            isOnline = IsUnitOnline(tag),
            synergyCooldowns = {},
        }

        if UnitList[tag].isOnline then groupSizeOnline = groupSizeOnline + 1 end
    end

    EM:RegisterForEvent(GT.name, EVENT_EFFECT_CHANGED, AddUnit)
    EM:AddFilterForEvent(GT.name, EVENT_EFFECT_CHANGED, REGISTER_FILTER_UNIT_TAG_PREFIX, 'group')
end

local function UpdateCooldown(unit, abilityId)
    unit.synergyCooldowns[abilityId] = unit.synergyCooldowns[abilityId] - 1

    if unit.synergyCooldowns[abilityId] == 0 then EM:UnregisterForUpdate(BS.name .. 'GroupTrackUpdateCooldown' .. unit.unitId .. abilityId) end
end

local function StartCooldown(eventCode, result, isError, abilityName, abilityGraphic, abilityActionSlotType, sourceName, sourceType, targetName, targetType, hitValue, powerType, damageType, log, sourceUnitId, targetUnitId, abilityId, overflow)
    local tag = IdTag[targetUnitId]
    local unit = UnitList[tag]

    if unit then

    end

    -- unit.synergyCooldowns[abilityId] = 20

    -- EM:RegisterForUpdate(BS.name .. 'GroupTrackUpdateCooldown' .. unit.unitId .. abilityId, 1000, function() UpdateCooldown(unit, abilityId) end)
end

local function CreatePlayer(pool)
    return ZO_ObjectPool_CreateControl('BearSynergies_GroupTrack_User', pool, BearSynergies_GroupTrack_UI)
end

function GT.Initialise()
    if BS.SV.isAccountWide then GT.SV = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, 'GroupTrack', GT.Default)
    else GT.SV = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, 'GroupTrack', GT.Default) end

    playerPool = ZO_ObjectPool:New(CreatePlayer)

    BS.CallbackManager:RegisterCallback(BS_EVENT_GROUP_CHANGED, RefreshUnits)

    for k in pairs(BS.cooldownId) do
        EM:RegisterForEvent(GT.name, EVENT_COMBAT_EVENT, StartCooldown)
        EM:AddFilterForEvent(GT.name, EVENT_COMBAT_EVENT, REGISTER_FILTER_ABILITY_ID, k)
    end
end