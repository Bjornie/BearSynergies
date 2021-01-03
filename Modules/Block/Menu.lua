local BS = BearSynergies
local B = BS.Block
local LAM = LibAddonMenu2

function B.BuildMenu()
    local PanelData = BS.GetModulePanelData('Block')

    local OptionsTable = {
        {
            type = 'header',
            name = '|cFFFACDGeneral|r',
        },
        {
            type = 'checkbox',
            name = 'Lokke Mode',
            getFunc = function() return B.SV.isLokke end,
            setFunc = function(value) B.SV.isLokke = value end,
            tooltip = 'Toggling this on will prevent you from being able to use synergies if less than five pieces of Lokkestiiz is active. If no Lokke pieces equipped this setting will be ignored.',
            width = 'half',
            default = B.Default.isLokke,
        },
        {
            type = 'checkbox',
            name = 'Alkosh Mode',
            getFunc = function() return B.SV.isAlkosh end,
            setFunc = function(value) B.SV.isAlkosh = value end,
            tooltip = 'Toggling this on will prevent you from being able to use synergies if less than five pieces of Alkosh is active. If no Alkosh pieces equipped this setting will be ignored.',
            width = 'half',
            default = B.Default.isAlkosh,
        },
        {
            type = 'checkbox',
            name = 'Resource Check',
            getFunc = function() return B.SV.isResource end,
            setFunc = function(value) B.SV.isResource = value end,
            tooltip = 'Toggling this on will prevent you from being able to use synergies if your current main resource is higher than the threshold.',
            default = B.Default.isResource,
        },
        {
            type = 'slider',
            name = 'Resource Check Threshold',
            getFunc = function() return B.SV.resourceThreshold end,
            setFunc = function(value) B.SV.resourceThreshold = value end,
            min = 0,
            max = 100,
            autoSelect = true,
            disabled = function() return not B.SV.isResource end,
            default = B.Default.resourceThreshold,
        },
        {
            type = 'submenu',
            name = '|cFFFACDClass Synergies|r',
            controls = {
                {
                    type = 'header',
                    name = '|cFFFACDDragonknight|',
                },
                {
                    type = 'checkbox',
                    name = 'Shackle',
                    getFunc = function() return B.SV[32910] end,
                    setFunc = function(value) B.SV[32910] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Shackle synergy, provided by the Dragonknight Standard skill.',
                    width = 'half',
                    default = B.Default[32910],
                },
                {
                    type = 'checkbox',
                    name = 'Ignite',
                    getFunc = function() return B.SV[32974] end,
                    setFunc = function(value) B.SV[32974] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Ignite synergy, provided by the Dark Talons skill.',
                    width = 'half',
                    default = B.Default[32974],
                },
                {
                    type = 'header',
                    name = '|cFFFACDSorcerer|r',
                },
                {
                    type = 'checkbox',
                    name = 'Charged Lightning',
                    getFunc = function() return B.SV[48076] end,
                    setFunc = function(value) B.SV[48076] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Charged Lightning synergy, provided by the Summon Storm Atronach skill.',
                    width = 'half',
                    default = B.Default[48076],
                },
                {
                    type = 'checkbox',
                    name = 'Conduit',
                    getFunc = function() return B.SV[23196] end,
                    setFunc = function(value) B.SV[23196] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Conduit synergy, provided by the Lightning Splash skill.',
                    width = 'half',
                    default = B.Default[23196],
                },
                {
                    type = 'header',
                    name = '|cFFFACDNightblade|r',
                },
                {
                    type = 'checkbox',
                    name = 'Hidden Refresh',
                    getFunc = function() return B.SV[37729] end,
                    setFunc = function(value) B.SV[37729] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Hidden Refresh synergy, provided by the Consuming Darkness skill.',
                    width = 'half',
                    default = B.Default[37729],
                },
                {
                    type = 'checkbox',
                    name = 'Soul Leech',
                    getFunc = function() return B.SV[25170] end,
                    setFunc = function(value) B.SV[25170] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Soul Leech synergy, provided by the Soul Shred skill.',
                    width = 'half',
                    default = B.Default[25170],
                },
                {
                    type = 'header',
                    name = '|cFFFACDTemplar|r',
                },
                {
                    type = 'checkbox',
                    name = 'Spear Shards',
                    getFunc = function() return B.SV[26832], B.SV[95922] end,
                    setFunc = function(value)
                        B.SV[26832] = value
                        B.SV[95922] = value
                    end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Blessed Shards and Holy Shards synergies, provided by the Spear Shards and morphs skills.',
                    width = 'half',
                    default = B.Default[26832],
                },
                {
                    type = 'checkbox',
                    name = 'Nova',
                    getFunc = function() return B.SV[31538], B.SV[31603] end,
                    setFunc = function(value)
                        B.SV[31538] = value
                        B.SV[31603] = value
                    end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Supernova and Gravity Crush synergies, provided by the Nova and morphs skills.',
                    width = 'half',
                    default = B.Default[31538],
                },
                {
                    type = 'checkbox',
                    name = 'Purify',
                    getFunc = function() return B.SV[22269] end,
                    setFunc = function(value) B.SV[22269] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Purify synergy, provided by the Cleansing Ritual skill.',
                    width = 'half',
                    default = B.Default[22269],
                },
                {
                    type = 'header',
                    name = '|cFFFACDWarden|r',
                },
                {
                    type = 'checkbox',
                    name = 'Harvest',
                    getFunc = function() return B.SV[85572] end,
                    setFunc = function(value) B.SV[85572] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Harvest synergy, provided by the Healing Seed skill.',
                    width = 'half',
                    default = B.Default[85572],
                },
                {
                    type = 'checkbox',
                    name = 'Icy Escape',
                    getFunc = function() return B.SV[88884] end,
                    setFunc = function(value) B.SV[88884] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Icy Escape synergy, provided by the Frozen Retreat skill.',
                    width = 'half',
                    default = B.Default[88884],
                },
                {
                    type = 'header',
                    name = '|cFFFACDNecromancer|r',
                },
                {
                    type = 'checkbox',
                    name = 'Grave Robber',
                    getFunc = function() return B.SV[115548] end,
                    setFunc = function(value) B.SV[115548] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Grave Robber synergy, provided by the Boneyard skill.',
                    width = 'half',
                    default = B.Default[115548],
                },
                {
                    type = 'checkbox',
                    name = 'Pure Agony',
                    getFunc = function() return B.SV[118604] end,
                    setFunc = function(value) B.SV[118604] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Pure Agony synergy, provided by the Agony Totem skill.',
                    width = 'half',
                    default = B.Default[118604],
                },
            },
        },
        {
            type = 'submenu',
            name = '|cFFFACDUndaunted Synergies|r',
            controls = {
                {
                    type = 'checkbox',
                    name = 'Blood Altar',
                    getFunc = function() return B.SV[39500], B.SV[41963] end,
                    setFunc = function(value)
                        B.SV[39500] = value
                        B.SV[41963] = value
                    end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Blood Funnel and Blood Feast synergies, provided by the Blood Altar and morphs skills.',
                    width = 'half',
                    default = B.Default[39500],
                },
                {
                    type = 'checkbox',
                    name = 'Spiders',
                    getFunc = function() return B.SV[39429], B.SV[41994], B.SV[42016] end,
                    setFunc = function(value)
                        B.SV[39429] = value
                        B.SV[41994] = value
                        B.SV[42016] = value
                    end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Spawn Broodling, Black Widow and Arachnophobia synergies, provided by the Trapping Webs and morphs skills.',
                    width = 'half',
                    default = B.Default[39429],
                },
                {
                    type = 'checkbox',
                    name = 'Radiate',
                    getFunc = function() return B.SV[41838] end,
                    setFunc = function(value) B.SV[41838] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Radiate synergy, provided by the Inner Fire skill.',
                    width = 'half',
                    default = B.Default[41838],
                },
                {
                    type = 'checkbox',
                    name = 'Bone Shield',
                    getFunc = function() return B.SV[39377], B.SV[42194] end,
                    setFunc = function(value)
                        B.SV[39377] = value
                        B.SV[42194] = value
                    end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Bone Wall and Spinal Surge synergies, provided by the Bone Shield and morphs skills.',
                    width = 'half',
                    default = B.Default[39377],
                },
                {
                    type = 'checkbox',
                    name = 'Combustion',
                    getFunc = function() return B.SV[39301], B.SV[63507] end,
                    setFunc = function(value)
                        B.SV[39301] = value
                        B.SV[63507] = value
                    end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Combustion and Healing Combustion synergies, provided by the Necrotic Orb and morphs skills.',
                    width = 'half',
                    default = B.Default[39301],
                },
            },
        },
        {
            type = 'submenu',
            name = '|cFFFACDArena Synergies|r',
            controls = {
                {
                    type = 'header',
                    name = '|cFFFACDMaelstrom Arena|r',
                },
                {
                    type = 'checkbox',
                    name = 'Sigil of Power',
                    getFunc = function() return B.SV[71902] end,
                    setFunc = function(value) B.SV[71902] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Sigil of Power Synergy, provided in Maelstrom Arena.',
                    width = 'half',
                    default = B.Default[71902],
                },
                {
                    type = 'checkbox',
                    name = 'Sigil of Healing',
                    getFunc = function() return B.SV[71949] end,
                    setFunc = function(value) B.SV[71949] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Sigil of Healing Synergy, provided in Maelstrom Arena.',
                    width = 'half',
                    default = B.Default[71949],
                },
                {
                    type = 'checkbox',
                    name = 'Sigil of Defense',
                    getFunc = function() return B.SV[71951] end,
                    setFunc = function(value) B.SV[71951] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Sigil of Defense Synergy, provided in Maelstrom Arena.',
                    width = 'half',
                    default = B.Default[71951],
                },
                {
                    type = 'checkbox',
                    name = 'Sigil of Haste',
                    getFunc = function() return B.SV[71953] end,
                    setFunc = function(value) B.SV[71953] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Sigil of Haste Synergy, provided in Maelstrom Arena.',
                    width = 'half',
                    default = B.Default[71953],
                },
                {
                    type = 'header',
                    name = '|cFFFACDBlackrose Prison|r',
                },
                {
                    type = 'checkbox',
                    name = 'Sigil of Sustain',
                    getFunc = function() return B.SV[112872] end,
                    setFunc = function(value) B.SV[112872] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Sigil of Sustain Synergy, provided in Blackrose Prison.',
                    width = 'half',
                    default = B.Default[112872]
                },
                {
                    type = 'checkbox',
                    name = 'Sigil of Defense',
                    getFunc = function() return B.SV[112890] end,
                    setFunc = function(value) B.SV[112890] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Sigil of Defense Synergy, provided in Blackrose Prison.',
                    width = 'half',
                    default = B.Default[112890],
                },
                {
                    type = 'checkbox',
                    name = 'Sigil of Healing',
                    getFunc = function() return B.SV[112901] end,
                    setFunc = function(value) B.SV[112901] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Sigil of Healing Synergy, provided in Blackrose Prison.',
                    width = 'half',
                    default = B.Default[112901],
                },
                {
                    type = 'checkbox',
                    name = 'Sigil of Resurrection',
                    getFunc = function() return B.SV[112909] end,
                    setFunc = function(value) B.SV[112909] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Sigil of Resurrection Synergy, provided in Blackrose Prison.',
                    width = 'half',
                    default = B.Default[112909],
                },
            },
        },
        {
            type = 'submenu',
            name = '|cFFFACDTrial Synergies|r',
            controls = {
                {
                    type = 'checkbox',
                    name = 'Destructive Outbreak Dialog',
                    getFunc = function() return B.SV.blockDO end,
                    setFunc = function(value) B.SV.blockDO = value end,
                    tooltip = 'Toggling this on will prompt a message on-screen whenever you get the fossilize mechanic on the last boss in Hel Ra Citadel, warning you of the danger it poses.',
                    width = 'half',
                    default = B.Default.blockDO,
                },
                {
                    type = 'checkbox',
                    name = 'Gateway',
                    getFunc = function() return B.SV[103489] end,
                    setFunc = function(value) B.SV[103489] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the portal synergy in Cloudrest.',
                    width = 'half',
                    default = B.Default[103489],
                },
                {
                    type = 'checkbox',
                    name = 'Conjurer\'s Portal',
                    getFunc = function() return B.SV[134005] end,
                    setFunc = function(value) B.SV[134005] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the portal synergy on the 2nd boss.',
                    width = 'half',
                    default = B.Default[134005],
                },
                {
                    type = 'checkbox',
                    name = 'Execration',
                    getFunc = function() return B.SV[129936] end,
                    setFunc = function(value) B.SV[129936] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the synergy on the last boss.',
                    width = 'half',
                    default = B.Default[129936],
                },
            },
        },
        {
            type = 'submenu',
            name = '|cFFFACDMiscellaneous|r',
            controls = {
                {
                    type = 'checkbox',
                    name = 'Feeding Frenzy',
                    getFunc = function() return B.SV[58775] end,
                    setFunc = function(value) B.SV[58775] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Feeding Frenzy synergy, provided by the Howl of Despair skill.',
                    width = 'half',
                    default = B.Default[58775],
                },
                {
                    type = 'checkbox',
                    name = 'Shield of Ursus',
                    getFunc = function() return B.SV[111437] end,
                    setFunc = function(value) B.SV[111437] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Shield of Ursus synergy, provided by the Haven of Ursus set.',
                    width = 'half',
                    default = B.Default[111437],
                },
                {
                    type = 'checkbox',
                    name = 'Sanguine Burst',
                    getFunc = function() return B.SV[141920] end,
                    setFunc = function(value) B.SV[141920] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Sanguine Burst synergy, provided by the Lady Thorn monster set.',
                    width = 'half',
                    default = B.Default[141920],
                },
                {
                    type = 'checkbox',
                    name = 'Heed the Call',
                    getFunc = function() return B.SV[142775] end,
                    setFunc = function(value) B.SV[142775] = value end,
                    tooltip = 'Toggling this off will prevent you from being able to use the Heed the Call synergy, provided by the Kraglen\'s Howl set.',
                    width = 'half',
                    default = B.Default[142775],
                },
            },
        },
    }

    LAM:RegisterAddonPanel(B.name, PanelData)
    LAM:RegisterOptionControls(B.name, OptionsTable)
end