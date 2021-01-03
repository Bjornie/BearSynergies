local BS = BearSynergies
local T = BS.Track
local LAM = LibAddonMenu2

function T.BuildMenu()
    local PanelData = BS.GetModulePanelData('Track')

    local OptionsTable = {
        {
            type = 'header',
            name = '|cFFFACDGeneral|r',
        },
        {
            type = 'dropdown',
            name = 'Orientation',
            choices = {'Horizontal', 'Vertical'},
            getFunc = function() return T.SV.Orientation end,
            setFunc = function(var)
                T.SV.Orientation = var
                T.UpdateUI()
            end,
            default = T.Default.orientation,
        },
        {
            type = 'slider',
            name = 'Size',
            getFunc = function() return T.SV.size end,
            setFunc = function(value)
                T.SV.size = value
                T.UpdateUI()
            end,
            min = 0,
            max = 100,
            default = T.Default.size,
        },
        {
            type = 'checkbox',
            name = 'Show Only During Combat',
            getFunc = function() return T.SV.showOnlyInCombat end,
            setFunc = function(value)
                T.SV.showOnlyInCombat = value
                T.PlayerCombatState()
            end,
            default = T.Default.showOnlyInCombat,
        },
        {
            type = 'submenu',
            name = '|cFFFACDClass Synergies|r',
            controls = {
                {
                    type = 'header',
                    name = '|cFFFACDDragonknight|r',
                },
                {
                    type = 'checkbox',
                    name = 'Shackle',
                    getFunc = function() return T.SV.Synergies[14] end,
                    setFunc = function(value)
                        T.SV.Synergies[14] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Dragonknight Standard skill.',
                    width = 'half',
                    default = T.Default.Synergies[14],
                },
                {
                    type = 'checkbox',
                    name = 'Ignite',
                    getFunc = function() return T.SV.Synergies[9] end,
                    setFunc = function(value)
                        T.SV.Synergies[9] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Dark Talons skill.',
                    width = 'half',
                    default = T.Default.Synergies[9],
                },
                {
                    type = 'header',
                    name = '|cFFFACDSorcerer|r',
                },
                {
                    type = 'checkbox',
                    name = 'Charged Lightning',
                    getFunc = function() return T.SV.Synergies[11] end,
                    setFunc = function(value)
                        T.SV.Synergies[11] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Summon Storm Atronach skill.',
                    width = 'half',
                    default = T.Default.Synergies[11],
                },
                {
                    type = 'checkbox',
                    name = 'Conduit',
                    getFunc = function() return T.SV.Synergies[8] end,
                    setFunc = function(value)
                        T.SV.Synergies[8] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Lightning Splash skill.',
                    width = 'half',
                    default = T.Default.Synergies[8],
                },
                {
                    type = 'header',
                    name = '|cFFFACDNightblade|r',
                },
                {
                    type = 'checkbox',
                    name = 'Hidden Refresh',
                    getFunc = function() return T.SV.Synergies[3] end,
                    setFunc = function(value)
                        T.SV.Synergies[3] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Consuming Darkness skill.',
                    width = 'half',
                    default = T.Default.Synergies[3],
                },
                {
                    type = 'checkbox',
                    name = 'Soul Leech',
                    getFunc = function() return T.SV.Synergies[2] end,
                    setFunc = function(value)
                        T.SV.Synergies[2] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Soul Shred skill.',
                    width = 'half',
                    default = T.Default.Synergies[2],
                },
                {
                    type = 'header',
                    name = '|cFFFACDTemplar|r',
                },
                {
                    type = 'checkbox',
                    name = 'Orbs & Shards',
                    getFunc = function() return T.SV.Synergies[10] end,
                    setFunc = function(value)
                        T.SV.Synergies[10] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Spear Shards and morphs skills and the Necrotic Orb and morphs skills.',
                    width = 'half',
                    default = T.Default.Synergies[10],
                },
                {
                    type = 'checkbox',
                    name = 'Nova',
                    getFunc = function() return T.SV.Synergies[12] end,
                    setFunc = function(value)
                        T.SV.Synergies[12] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Nova and morphs skills.',
                    width = 'half',
                    default = T.Default.Synergies[12],
                },
                {
                    type = 'checkbox',
                    name = 'Purify',
                    getFunc = function() return T.SV.Synergies[1] end,
                    setFunc = function(value)
                        T.SV.Synergies[1] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Cleansing Ritual skill.',
                    width = 'half',
                    default = T.Default.Synergies[1],
                },
                {
                    type = 'header',
                    name = '|cFFFACDWarden|r',
                },
                {
                    type = 'checkbox',
                    name = 'Harvest',
                    getFunc = function() return T.SV.Synergies[15] end,
                    setFunc = function(value)
                        T.SV.Synergies[15] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Healing Seed skill.',
                    width = 'half',
                    default = T.Default.Synergies[15],
                },
                {
                    type = 'checkbox',
                    name = 'Icy Escape',
                    getFunc = function() return T.SV.Synergies[16] end,
                    setFunc = function(value)
                        T.SV.Synergies[16] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Frozen Retreat skill.',
                    width = 'half',
                    default = T.Default.Synergies[16],
                },
                {
                    type = 'header',
                    name = '|cFFFACDNecromancer|r',
                },
                {
                    type = 'checkbox',
                    name = 'Grave Robber',
                    getFunc = function() return T.SV.Synergies[18] end,
                    setFunc = function(value)
                        T.SV.Synergies[18] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Boneyard skill.',
                    width = 'half',
                    default = T.Default.Synergies[18],
                },
                {
                    type = 'checkbox',
                    name = 'Pure Agony',
                    getFunc = function() return T.SV.Synergies[19] end,
                    setFunc = function(value)
                        T.SV.Synergies[19] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Agony Totem skill.',
                    width = 'half',
                    default = T.Default.Synergies[19],
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
                    getFunc = function() return T.SV.Synergies[6] end,
                    setFunc = function(value)
                        T.SV.Synergies[6] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Blood Altar and morphs skills.',
                    width = 'half',
                    default = T.Default.Synergies[6],
                },
                {
                    type = 'checkbox',
                    name = 'Spiders',
                    getFunc = function() return T.SV.Synergies[5] end,
                    setFunc = function(value)
                        T.SV.Synergies[5] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Trapping Webs and morphs skills.',
                    width = 'half',
                    default = T.Default.Synergies[5],
                },
                {
                    type = 'checkbox',
                    name = 'Radiate',
                    getFunc = function() return T.SV.Synergies[7] end,
                    setFunc = function(value)
                        T.SV.Synergies[7] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Inner Fire skill.',
                    width = 'half',
                    default = T.Default.Synergies[7],
                },
                {
                    type = 'checkbox',
                    name = 'Bone Shield',
                    getFunc = function() return T.SV.Synergies[4] end,
                    setFunc = function(value)
                        T.SV.Synergies[4] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Bone Shield and morphs skills.',
                    width = 'half',
                    default = T.Default.Synergies[4],
                },
                {
                    type = 'checkbox',
                    name = 'Orbs & Shards',
                    getFunc = function() return T.SV.Synergies[10] end,
                    setFunc = function(value)
                        T.SV.Synergies[10] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Spear Shards and morphs skills and the Necrotic Orb and morphs skills.',
                    width = 'half',
                    default = T.Default.Synergies[10],
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
                    getFunc = function() return T.SV.Synergies[13] end,
                    setFunc = function(value)
                        T.SV.Synergies[13] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Howl of Despair skill.',
                    width = 'half',
                    default = T.Default.Synergies[13],
                },
                {
                    type = 'checkbox',
                    name = 'Shield of Ursus',
                    getFunc = function() return T.SV.Synergies[17] end,
                    setFunc = function(value)
                        T.SV.Synergies[17] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Haven of Ursus set.',
                    width = 'half',
                    default = T.Default.Synergies[17],
                },
                {
                    type = 'checkbox',
                    name = 'Sanguine Burst',
                    getFunc = function() return T.SV.Synergies[20] end,
                    setFunc = function(value)
                        T.SV.Synergies[20] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Lady Thorn monster set.',
                    width = 'half',
                    default = T.Default.Synergies[20],
                },
                {
                    type = 'checkbox',
                    name = 'Heed the Call',
                    getFunc = function() return T.SV.Synergies[21] end,
                    setFunc = function(value)
                        T.SV.Synergies[21] = value
                        T.UpdateUI()
                    end,
                    tooltip = 'Provided by the Kraglen\'s Howl set.',
                    width = 'half',
                    default = T.Default.Synergies[21],
                },
            },
        },
    }

    LAM:RegisterAddonPanel(T.name, PanelData)
    LAM:RegisterOptionControls(T.name, OptionsTable)
end