BearSynergies = {
    Name = "BearSynergies",
    Version = "0.1",
    Author = "BjörnTheBurr",

    defaultSettings = {
        -- Dragonknight
        DK_SHACKLE = true,
        DK_IGNITE = true,

        -- Necromancer
        NM_GRAVE_ROBBER = true,

        -- Nightblade
        NB_HIDDEN_REFRESH = true,
        NB_SOUL_LEECH = true,

        -- Sorcerer
        SORC_CHARGED_LIGHTNING = true,
        SORC_CONDUIT = true,
    },
}

local BS = BearSynergies
local EM = EVENT_MANAGER

function BearSynergies.init()
    if addon ~= BS.Name then return end
end

EM:RegisterForEvent(BearSynergies.Name, EVENT_ADD_ON_LOADED, BearSynergies.init)