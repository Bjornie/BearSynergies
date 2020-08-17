BearSynergies.GroupTrack = {
    name = "BearSynergiesGroupTrack",

    Default = {
        left = 0,
        top = 0,
    },
}

local BS = BearSynergies
local GT = BS.GroupTrack

local groupPool
local Group = {}

local function CreateGroupRow(pool)
    return ZO_ObjectPool_CreateControl("BearSynergiesGroupTrackRow", pool, BearSynergiesGroupTrackUI)
end

local function UpdateGroup()
    for i = 1, GetGroupSize() do
        if GetGroupMemberAssignedRole("group" .. i) == LFG_ROLE_TANK then
            Group[i] = {}
            Group[i].name = GetUnitDisplayName("group" .. i)
            Group[i].role = GetGroupMemberAssignedRole("group" .. i)
        end
    end
end

function GT.OnMoveStop()
    GT.SavedVariables.left = BearSynergiesTrackUI:GetLeft()
    GT.SavedVariables.top = BearSynergiesTrackUI:GetTop()
end

function GT.Initialise()
    if BS.SavedVariables.isAccountWide then
        GT.SavedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, "Group Track", GT.Default)
    else
        GT.SavedVariables = ZO_SavedVars:NewCharacterIdSettings(BS.svName, BS.svVersion, "Group Track", GT.Default)
    end

    groupPool = ZO_ObjectPool:New(CreateGroupRow)

    EVENT_MANAGER:RegisterForEvent(GT.name, EVENT_GROUP_MEMBER_JOINED, UpdateGroup)
    EVENT_MANAGER:RegisterForEvent(GT.name, EVENT_GROUP_MEMBER_LEFT, UpdateGroup)
    EVENT_MANAGER:RegisterForEvent(GT.name, EVENT_GROUP_MEMBER_ROLE_CHANGED, UpdateGroup)
end