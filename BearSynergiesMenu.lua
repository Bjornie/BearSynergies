local BS = BearSynergies
local LAM = LibAddonMenu2

function BS.BuildMenu()
    local panelData = {
        type = "panel",
        name = "Bear Synergies",
        displayName = "Bear Synergies",
        author = "|c00BFFFBjörnTheBurr|r",
        version = "0.1",
        registerForRefresh = true,
    }

    local optionsTable = {
        -- Class Settings
        [1] = {
            type = "submenu",
            name = "|cFFFACDClass Synergies|r",
            controls = {
                -- Dragonknight Settings
                [1] = {
                    type = "header",
                    name = "|cFFFACDDragonknight|",
                },
                [2] = {
                    type = "checkbox",
                    name = "Shackle",
                    tooltip = "Disabling this will prevent you from being able to use the Shackle synergy, provided by the Dragonknight Standard skill.",
                    getFunc = function() return BS.savedVariables["Shackle"] end,
                    setFunc = function(value) BS.savedVariables["Shackle"] = value end,
                },
                [3] = {
                    type = "checkbox",
                    name = "Ignite",
                    tooltip = "Disabling this will prevent you from being able to use the Ignite synergy, provided by the Dark Talons skill.",
                    getFunc = function() return BS.savedVariables["Ignite"] end,
                    setFunc = function(value) BS.savedVariables["Ignite"] = value end,
                },

                -- Necromancer Settings
                [4] = {
                    type = "header",
                    name = "|cFFFACDNecromancer|r",
                },
                [5] = {
                    type = "checkbox",
                    name = "Grave Robber",
                    tooltip = "Disabling this will prevent you from being able to use the Grave Robber synergy, provided by the Boneyard skill.",
                    getFunc = function() return BS.savedVariables["Grave Robber"] end,
                    setFunc = function(value) BS.savedVariables["Grave Robber"] = value end,
                },
                [6] = {
                    type = "checkbox",
                    name = "Pure Agony",
                    tooltip = "Disabling this will prevent you from being able to use the Pure Agony synergy, provided by the Agony Totem skill.",
                    getFunc = function() return BS.savedVariables["Pure Agony"] end,
                    setFunc = function(value) BS.savedVariables["Pure Agony"] = value end,
                },

                -- Nightblade Settings
                [7] = {
                    type = "header",
                    name = "|cFFFACDNightblade|r",
                },
                [8] = {
                    type = "checkbox",
                    name = "Hidden Refresh",
                    tooltip = "Disabling this will prevent you from being able to use the Hidden Refresh synergy, provided by the Consuming Darkness skill.",
                    getFunc = function() return BS.savedVariables["Hidden Refresh"] end,
                    setFunc = function(value) BS.savedVariables["Hidden Refresh"] = value end,
                },
                [9] = {
                    type = "checkbox",
                    name = "Soul Leech",
                    tooltip = "Disabling this will prevent you from being able to use the Soul Leech synergy, provided by the Soul Shred skill.",
                    getFunc = function() return BS.savedVariables["Soul Leech"] end,
                    setFunc = function(value) BS.savedVariables["Soul Leech"] = value end,
                },

                -- Sorcerer Settings
                [10] = {
                    type = "header",
                    name = "|cFFFACDSorcerer|r",
                },
                [11] = {
                    type = "checkbox",
                    name = "Charged Lightning",
                    tooltip = "Disabling this will prevent you from being able to use the Charged Lightning synergy, provided by the Summon Storm Atronach skill.",
                    getFunc = function() return BS.savedVariables["Charged Lightning"] end,
                    setFunc = function(value) BS.savedVariables["Charged Lightning"] = value end,
                },
                [12] = {
                    type = "checkbox",
                    name = "Conduit",
                    tooltip = "Disabling this will prevent you from being able to use the Conduit synergy, provided by the Lightning Splash skill.",
                    getFunc = function() return BS.savedVariables["Conduit"] end,
                    setFunc = function(value) BS.savedVariables["Conduit"] = value end,
                },

                -- Templar Settings
                [13] = {
                    type = "header",
                    name = "|cFFFACDTemplar|r",
                },
                [14] = {
                    type = "checkbox",
                    name = "Shards",
                    tooltip = "Disabling this will prevent you from being able to use the Blessed Shards and Holy Shards synergies, provided by the Spear Shards and morphs skills.",
                    getFunc = function() return BS.savedVariables["Blessed Shards"] end,
                    setFunc = function(value) BS.savedVariables["Blessed Shards"] = value end,
                    getFunc = function() return BS.savedVariables["Holy Shards"] end,
                    setFunc = function(value) BS.savedVariables["Holy Shards"] = value end,
                },
                [15] = {
                    type = "checkbox",
                    name = "Nova",
                    tooltip = "Disabling this will prevent you from being able to use the Supernova and Gravity Crush synergies, provided by the Nova and morphs skills.",
                    getFunc = function() return BS.savedVariables["Supernova"] end,
                    setFunc = function(value) BS.savedVariables["Supernova"] = value end,
                    getFunc = function() return BS.savedVariables["Gravity Crush"] end,
                    setFunc = function(value) BS.savedVariables["Gravity Crush"] = value end,
                },
                [16] = {
                    type = "checkbox",
                    name = "Purify",
                    tooltip = "Disabling this will prevent you from being able to use the Purify synergy, provided by the Cleansing Ritual skill.",
                    getFunc = function() return BS.savedVariables["Purify"] end,
                    setFunc = function(value) BS.savedVariables["Purify"] = value end,
                },

                -- Warden Settings
                [17] = {
                    type = "header",
                    name = "|cFFFACDWarden|r",
                },
                [18] = {
                    type = "checkbox",
                    name = "Harvest",
                    tooltip = "Disabling this will prevent you from being able to use the Harvest synergy, provided by the Healing Seed skill.",
                    getFunc = function() return BS.savedVariables["Harvest"] end,
                    setFunc = function(value) BS.savedVariables["Harvest"] = value end,
                },
                [19] = {
                    type = "checkbox",
                    name = "Icy Escape",
                    tooltip = "Disabling this will prevent you from being able to use the Icy Escape synergy, provided by the Frozen Retreat skill.",
                    getFunc = function() return BS.savedVariables["Icy Escape"] end,
                    setFunc = function(value) BS.savedVariables["Icy Escape"] = value end,
                },

            },
        },
        -- Undaunted Settings
        [2] = {
            type = "submenu",
            name = "|cFFFACDUndaunted Synergies|r",
            controls = {
                [1] = {
                    type = "checkbox",
                    name = "Altar",
                    tooltip = "Disabling this will prevent you from being able to use the Blood FUnnel and Blood Feast synergies, provided by the Blood Altar and morphs skills.",
                    getFunc = function() return BS.savedVariables["Blood Funnel"] end,
                    setFunc = function(value) BS.savedVariables["Blood Funnel"] = value end,
                    getFunc = function() return BS.savedVariables["Blood Feast"] end,
                    setFunc = function(value) BS.savedVariables["Blood Feast"] = value end,
                },
                [2] = {
                    type = "checkbox",
                    name = "Spiders",
                    tooltip = "Disabling this will prevent you from being able to use the Spawn Broodlings, Black Widows and Arachnophobia synergies, provided by the Trapping Webs and morphs skills.",
                    getFunc = function() return BS.savedVariables["Spawn Broodlings"] end,
                    setFunc = function(value) BS.savedVariables["Spawn Broodlings"] = value end,
                    getFunc = function() return BS.savedVariables["Black Widows"] end,
                    setFunc = function(value) BS.savedVariables["Black Widows"] = value end,
                    getFunc = function() return BS.savedVariables["Arachnophobia"] end,
                    setFunc = function(value) BS.savedVariables["Arachnophobia"] = value end,
                },
                [3] = {
                    type = "checkbox",
                    name = "Radiate",
                    tooltip = "Disabling this will prevent you from being able to use the Radiate synergy, provided by the Inner Fire skill.",
                    getFunc = function() return BS.savedVariables["Radiate"] end,
                    setFunc = function(value) BS.savedVariables["Radiate"] = value end,
                },
                [4] = {
                    type = "checkbox",
                    name = "Bone Shield",
                    tooltip = "Disabling this will prevent you from being able to use the Bone Wall and Spinal Surge synergies, provided by the Bone Sield and morphs skills.",
                    getFunc = function() return BS.savedVariables["Bone Wall"] end,
                    setFunc = function(value) BS.savedVariables["Bone Wall"] = value end,
                    getFunc = function() return BS.savedVariables["Spinal Surge"] end,
                    setFunc = function(value) BS.savedVariables["Spinal Surge"] = value end,
                },
                [5] = {
                    type = "checkbox",
                    name = "Combustion",
                    tooltip = "Disabling this will prevent you from being able to use the Combustion and Healing Combustion synergies, provided by the Necrotic Orb and morphs skills.",
                    getFunc = function() return BS.savedVariables["Combustion"] end,
                    setFunc = function(value) BS.savedVariables["Combustion"] = value end,
                    getFunc = function() return BS.savedVariables["Healing Combustion"] end,
                    setFunc = function(value) BS.savedVariables["Healing Combustion"] = value end,
                },
            },
        },

        -- Arena Settings
        [3] = {
            type = "submenu",
            name = "|cFFFACDArena Synergies|r",
            controls = {
                [1] = {
                    type = "checkbox",
                    name = "Sigil of Defense",
                    tooltip = "Disabling this will prevent you from being able to use the Sigil of Defense synergy, provided in Maelstrom Arena and Blackrose Prison.",
                    getFunc = function() return BS.savedVariables["Sigil of Defense"] end,
                    setFunc = function(value) BS.savedVariables["Sigil of Defense"] = value end,
                },
                [2] = {
                    type = "checkbox",
                    name = "Sigil of Haste",
                    tooltip = "Disabling this will prevent you from being able to use the Sigil of Haste synergy, provided in Maelstrom Arena.",
                    getFunc = function() return BS.savedVariables["Sigil of Haste"] end,
                    setFunc = function(value) BS.savedVariables["Sigil of Haste"] = value end,
                },
                [3] = {
                    type = "checkbox",
                    name = "Sigil of Healing",
                    tooltip = "Disabling this will prevent you from being able to use the Sigil of Healing synergy, provided in Maelstrom Arena and Blackrose Prison.",
                    getFunc = function() return BS.savedVariables["Sigil of Healing"] end,
                    setFunc = function(value) BS.savedVariables["Sigil of Healing"] = value end,
                },
                [4] = {
                    type = "checkbox",
                    name = "Sigil of Power",
                    tooltip = "Disabling this will prevent you from being able to use the Sigil of Power synergy, provided in Maelstrom Arena.",
                    getFunc = function() return BS.savedVariables["Sigil of Power"] end,
                    setFunc = function(value) BS.savedVariables["Sigil of Power"] = value end,
                },
                [5] = {
                    type = "checkbox",
                    name = "Sigil of Resurrection",
                    tooltip = "Disabling this will prevent you from being able to use the Sigil of Resurrection synergy, provided in Blackrose Prison.",
                    getFunc = function() return BS.savedVariables["Sigil of Resurrection"] end,
                    setFunc = function(value) BS.savedVariables["Sigil of Resurrection"] = value end,
                },
                [6] = {
                    type = "checkbox",
                    name = "Sigil of Sustain",
                    tooltip = "Disabling this will prevent you from being able to use the Sigil of Sustain synergy, provided in Blackrose Prison.",
                    getFunc = function() return BS.savedVariables["Sigil of Sustain"] end,
                    setFunc = function(value) BS.savedVariables["Sigil of Sustain"] = value end,
                },
            },
        },

        -- Trial Settings
        [4] = {
            type = "submenu",
            name = "|cFFFACDTrial Synergies|r",
            controls = {
                -- Craglorn Settings
                [1] = {
                    type = "header",
                    name = "|cFFFACDCraglorn Trials|r",
                },
                [2] = {
                    type = "checkbox",
                    name = "Destructive Outbreak",
                    tooltip = "Disabling this will prevent you from being able to use the Destructive Outbreak synergy, provided from the fossilize mechanic during the fight with The Warrior in Hel Ra Citadel.",
                    getFunc = function() return BS.savedVariables["Destructive Outbreak"] end,
                    setFunc = function(value) BS.savedVariables["Destructive Outbreak"] = value end,
                },

                -- Cloudrest Settings
                [3] = {
                    type = "header",
                    name = "|cFFFACDCloudrest|r",
                },
                [4] = {
                    type = "checkbox",
                    name = "Gateway",
                    tooltip = "Disabling this will prevent you from being able to use the portal synergy.",
                    getFunc = function() return BS.savedVariables["Gateway"] end,
                    setFunc = function(value) BS.savedVariables["Gateway"] = value end,
                },

                -- Sunspire Settings
                [5] = {
                    type = "header",
                    name = "|cFFFACDSunspire|r",
                },
                [6] = {
                    type = "checkbox",
                    name = "Time Breach",
                    tooltip = "Disabling this will prevent you from being able to use the portal synergy.",
                    getFunc = function() return BS.savedVariables["Time Breach"] end,
                    setFunc = function(value) BS.savedVariables["Time Breach"] = value end,
                },
            },
        },
    }

    LAM:RegisterAddonPanel(BS.name .. "Options", panelData)
    LAM:RegisterOptionControls(BS.name .. "Options", optionsTable)
end