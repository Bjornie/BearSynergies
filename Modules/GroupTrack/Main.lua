BearSynergies.GroupTrack = {}

local BS = BearSynergies
local GT = BS.GroupTrack
local EM = GetEventManager()

local playerPool

local function CreatePlayer(pool)
    return ZO_ObjectPool_CreateControl("Template", pool, ParentFrame)
end

function GT.Initialise()
    playerPool = ZO_ObjectPool:New(CreatePlayer)

    EM:RegisterForEvent()
end