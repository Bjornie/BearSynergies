local BS = BearSynergies
local LAM = LibAddonMenu2

function BS.BuildMenu()
    local panelData = {
        type = "panel",
        name = "Bear Synergies",
        displayName = "Bear Synergies",
        author = "|c00BFFFBjörnTheBurr|r",
        version = "0.2",
        registerForRefresh = true,
    }

    local optionsTable = {
        -- General Settings
        {
            type = "header",
            name = "|cFFFACDGeneral|r",
        },
        {
            type = "checkbox",
            name = "Lokke Mode",
            width = "half",
            tooltip = "Enabling this will prevent you from being able to use synergies if less than five pieces of Lokkestiiz is active. If no Lokke pieces equipped this setting will be ignored.",
            getFunc = function() return BS.savedVariables.isLokke end,
            setFunc = function(value) BS.savedVariables.isLokke = value end,
        },
        {
            type = "checkbox",
            name = "Alkosh Mode",
            width = "half",
            tooltip = "Enabling this will prevent you from being able to use synergies if less than five pieces of Alkosh is active. If no Alkosh pieces equipped this setting will be ignored.",
            getFunc = function() return BS.savedVariables.isAlkosh end,
            setFunc = function(value) BS.savedVariables.isAlkosh = value end,
        },
        {
            type = "checkbox",
            name = "Resource Check",
            tooltip = "Enabling this will prevent you from being able to use synergies if your current main resource is higher than the threshold.",
            getFunc = function() return BS.savedVariables.isResource end,
            setFunc = function(value) BS.savedVariables.isResource = value end,
        },
        {
            type = "slider",
            name = "Resource Check Threshold",
            min = 0,
            max = 100,
            step = 1,
            getFunc = function() return BS.savedVariables.resourceThreshold end,
            setFunc = function(value) BS.savedVariables.resourceThreshold = value end,
            disabled = function() return not BS.savedVariables.isResource end,
        },

        -- Class Settings
        {
            type = "submenu",
            name = "|cFFFACDClass Synergies|r",
            controls = {
                -- Dragonknight Settings
                {
                    type = "header",
                    name = "|cFFFACDDragonknight|",
                },
                {
                    type = "checkbox",
                    name = "Shackle",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Shackle synergy, provided by the Dragonknight Standard skill.",
                    getFunc = function() return BS.savedVariables["Shackle"] end,
                    setFunc = function(value) BS.savedVariables["Shackle"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Ignite",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Ignite synergy, provided by the Dark Talons skill.",
                    getFunc = function() return BS.savedVariables["Ignite"] end,
                    setFunc = function(value) BS.savedVariables["Ignite"] = value end,
                },

                -- Necromancer Settings
                {
                    type = "header",
                    name = "|cFFFACDNecromancer|r",
                },
                {
                    type = "checkbox",
                    name = "Grave Robber",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Grave Robber synergy, provided by the Boneyard skill.",
                    getFunc = function() return BS.savedVariables["Grave Robber"] end,
                    setFunc = function(value) BS.savedVariables["Grave Robber"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Pure Agony",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Pure Agony synergy, provided by the Agony Totem skill.",
                    getFunc = function() return BS.savedVariables["Pure Agony"] end,
                    setFunc = function(value) BS.savedVariables["Pure Agony"] = value end,
                },

                -- Nightblade Settings
                {
                    type = "header",
                    name = "|cFFFACDNightblade|r",
                },
                {
                    type = "checkbox",
                    name = "Hidden Refresh",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Hidden Refresh synergy, provided by the Consuming Darkness skill.",
                    getFunc = function() return BS.savedVariables["Hidden Refresh"] end,
                    setFunc = function(value) BS.savedVariables["Hidden Refresh"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Soul Leech",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Soul Leech synergy, provided by the Soul Shred skill.",
                    getFunc = function() return BS.savedVariables["Soul Leech"] end,
                    setFunc = function(value) BS.savedVariables["Soul Leech"] = value end,
                },

                -- Sorcerer Settings
                {
                    type = "header",
                    name = "|cFFFACDSorcerer|r",
                },
                {
                    type = "checkbox",
                    name = "Charged Lightning",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Charged Lightning synergy, provided by the Summon Storm Atronach skill.",
                    getFunc = function() return BS.savedVariables["Charged Lightning"] end,
                    setFunc = function(value) BS.savedVariables["Charged Lightning"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Conduit",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Conduit synergy, provided by the Lightning Splash skill.",
                    getFunc = function() return BS.savedVariables["Conduit"] end,
                    setFunc = function(value) BS.savedVariables["Conduit"] = value end,
                },

                -- Templar Settings
                {
                    type = "header",
                    name = "|cFFFACDTemplar|r",
                },
                {
                    type = "checkbox",
                    name = "Spear Shards",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Blessed Shards synergy, provided by the Spear Shards skill.",
                    getFunc = function() return BS.savedVariables["Blessed Shards"] end,
                    setFunc = function(value) BS.savedVariables["Blessed Shards"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Luminous Shards",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Holy Shards synergy, provided by the Luminous Shards skill.",
                    getFunc = function() return BS.savedVariables["Holy Shards"] end,
                    setFunc = function(value) BS.savedVariables["Holy Shards"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Supernova",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Supernova synergy, provided by the Nova skill.",
                    getFunc = function() return BS.savedVariables["Supernova"] end,
                    setFunc = function(value) BS.savedVariables["Supernova"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Gravity Crush",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Gravity Crush synergy, provided by the Solar Prison skill.",
                    getFunc = function() return BS.savedVariables["Gravity Crush"] end,
                    setFunc = function(value) BS.savedVariables["Gravity Crush"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Purify",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Purify synergy, provided by the Cleansing Ritual skill.",
                    getFunc = function() return BS.savedVariables["Purify"] end,
                    setFunc = function(value) BS.savedVariables["Purify"] = value end,
                },

                -- Warden Settings
                {
                    type = "header",
                    name = "|cFFFACDWarden|r",
                },
                {
                    type = "checkbox",
                    name = "Harvest",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Harvest synergy, provided by the Healing Seed skill.",
                    getFunc = function() return BS.savedVariables["Harvest"] end,
                    setFunc = function(value) BS.savedVariables["Harvest"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Icy Escape",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Icy Escape synergy, provided by the Frozen Retreat skill.",
                    getFunc = function() return BS.savedVariables["Icy Escape"] end,
                    setFunc = function(value) BS.savedVariables["Icy Escape"] = value end,
                },

            },
        },

        -- Undaunted Settings
        {
            type = "submenu",
            name = "|cFFFACDUndaunted Synergies|r",
            controls = {
                {
                    type = "checkbox",
                    name = "Blood Funnel",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Blood Funnel synergy, provided by the Blood Altar skill.",
                    getFunc = function() return BS.savedVariables["Blood Funnel"] end,
                    setFunc = function(value) BS.savedVariables["Blood Funnel"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Blood Feast",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Blood Feast synergy, provided by the Overflowing Altar skill.",
                    getFunc = function() return BS.savedVariables["Blood Feast"] end,
                    setFunc = function(value) BS.savedVariables["Blood Feast"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Spawn Broodlings",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Spawn Broodlings synergy, provided by the Trapping Webs skill.",
                    getFunc = function() return BS.savedVariables["Spawn Broodlings"] end,
                    setFunc = function(value) BS.savedVariables["Spawn Broodlings"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Black Widows",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Black Widows synergy, provided by the Shadow Silk skill.",
                    getFunc = function() return BS.savedVariables["Black Widows"] end,
                    setFunc = function(value) BS.savedVariables["Black Widows"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Arachnophobia",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Arachnophobia synergy, provided by the Tangling Webs skill.",
                    getFunc = function() return BS.savedVariables["Arachnophobia"] end,
                    setFunc = function(value) BS.savedVariables["Arachnophobia"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Radiate",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Radiate synergy, provided by the Inner Fire skill.",
                    getFunc = function() return BS.savedVariables["Radiate"] end,
                    setFunc = function(value) BS.savedVariables["Radiate"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Bone Wall",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Bone Wall synergy, provided by the Bone Sield skill.",
                    getFunc = function() return BS.savedVariables["Bone Wall"] end,
                    setFunc = function(value) BS.savedVariables["Bone Wall"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Spinal Surge",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Spinal Surge synergy, provided by the Bone Surge skill.",
                    getFunc = function() return BS.savedVariables["Spinal Surge"] end,
                    setFunc = function(value) BS.savedVariables["Spinal Surge"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Combustion",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Combustion synergy, provided by the Necrotic Orb skill.",
                    getFunc = function() return BS.savedVariables["Combustion"] end,
                    setFunc = function(value) BS.savedVariables["Combustion"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Healing Combustion",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Healing Combustion synergy, provided by the Energy Orb skill.",
                    getFunc = function() return BS.savedVariables["Healing Combustion"] end,
                    setFunc = function(value) BS.savedVariables["Healing Combustion"] = value end,
                },
            },
        },

        -- Arena Settings
        {
            type = "submenu",
            name = "|cFFFACDArena Synergies|r",
            controls = {
                {
                    type = "checkbox",
                    name = "Sigil of Defense",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Sigil of Defense synergy, provided in Maelstrom Arena and Blackrose Prison.",
                    getFunc = function() return BS.savedVariables["Sigil of Defense"] end,
                    setFunc = function(value) BS.savedVariables["Sigil of Defense"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Sigil of Haste",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Sigil of Haste synergy, provided in Maelstrom Arena.",
                    getFunc = function() return BS.savedVariables["Sigil of Haste"] end,
                    setFunc = function(value) BS.savedVariables["Sigil of Haste"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Sigil of Healing",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Sigil of Healing synergy, provided in Maelstrom Arena and Blackrose Prison.",
                    getFunc = function() return BS.savedVariables["Sigil of Healing"] end,
                    setFunc = function(value) BS.savedVariables["Sigil of Healing"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Sigil of Power",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Sigil of Power synergy, provided in Maelstrom Arena.",
                    getFunc = function() return BS.savedVariables["Sigil of Power"] end,
                    setFunc = function(value) BS.savedVariables["Sigil of Power"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Sigil of Resurrection",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Sigil of Resurrection synergy, provided in Blackrose Prison.",
                    getFunc = function() return BS.savedVariables["Sigil of Resurrection"] end,
                    setFunc = function(value) BS.savedVariables["Sigil of Resurrection"] = value end,
                },
                {
                    type = "checkbox",
                    name = "Sigil of Sustain",
                    width = "half",
                    tooltip = "Disabling this will prevent you from being able to use the Sigil of Sustain synergy, provided in Blackrose Prison.",
                    getFunc = function() return BS.savedVariables["Sigil of Sustain"] end,
                    setFunc = function(value) BS.savedVariables["Sigil of Sustain"] = value end,
                },
            },
        },

        -- Trial Settings
        {
            type = "submenu",
            name = "|cFFFACDTrial Synergies|r",
            controls = {
                -- Craglorn Settings
                {
                    type = "header",
                    name = "|cFFFACDCraglorn Trials|r",
                },
                {
                    type = "checkbox",
                    name = "Destructive Outbreak",
                    tooltip = "Disabling this will prevent you from being able to use the Destructive Outbreak synergy, provided from the fossilize mechanic during the fight with The Warrior in Hel Ra Citadel.",
                    getFunc = function() return BS.savedVariables["Destructive Outbreak"] end,
                    setFunc = function(value) BS.savedVariables["Destructive Outbreak"] = value end,
                },

                -- Cloudrest Settings
                {
                    type = "header",
                    name = "|cFFFACDCloudrest|r",
                },
                {
                    type = "checkbox",
                    name = "Gateway",
                    tooltip = "Disabling this will prevent you from being able to use the portal synergy.",
                    getFunc = function() return BS.savedVariables["Gateway"] end,
                    setFunc = function(value) BS.savedVariables["Gateway"] = value end,
                },

                -- Sunspire Settings
                {
                    type = "header",
                    name = "|cFFFACDSunspire|r",
                },
                {
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