local BS = BearSynergies
local GT = BS.GroupTrack

function GT.BuildMenu()
    local PanelData = BS.GetModulePanelData('GroupTrack')

    local OptionsTable = {
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
                    width = 'half',
                    getFunc = function() return GT.SV[67717] end,
                    setFunc = function(value) GT.SV[67717] = value end,
                },
                {
                    type = 'checkbox',
                    name = 'Ignite',
                    width = 'half',
                    getFunc = function() return GT.SV[48040] end,
                    setFunc = function(value) GT.SV[48040] = value end,
                },
                {
                    type = 'header',
                    name = '|cFFFACDSorcerer|r',
                },
                {
                    type = 'checkbox',
                    name = 'Charged Lightning',
                    width = 'half',
                    getFunc = function() return GT.SV[48085] end,
                    setFunc = function(value) GT.SV[48085] = value end,
                },
                {
                    type = 'checkbox',
                    name = 'Conduit',
                    width = 'half',
                    getFunc = function() return GT.SV[43769] end,
                    setFunc = function(value) GT.SV[43769] = value end,
                },
                {
                    type = 'header',
                    name = '|cFFFACDNightblade|r',
                },
                {
                    type = 'checkbox',
                    name = 'Hidden Refresh',
                    width = 'half',
                    getFunc = function() return GT.SV[37733] end,
                    setFunc = function(value) GT.SV[37733] = value end,
                },
                {
                    type = 'checkbox',
                    name = 'Soul Leech',
                    width = 'half',
                    getFunc = function() return GT.SV[25172] end,
                    setFunc = function(value) GT.SV[25172] = value end,
                },
                {
                    type = 'header',
                    name = '|cFFFACDTemplar|r',
                },
                {
                    type = 'checkbox',
                    name = 'Spear Shards',
                    width = 'half',
                    getFunc = function() return GT.SV[48052], GT.SV[95924] end,
                    setFunc = function(value)
                        GT.sv[48052] = value
                        GT.SV[95924] = value
                    end,
                },
                {
                    type = 'checkbox',
                    name = 'Nova',
                    width = 'half',
                    getFunc = function() return GT.SV[48938], GT.SV[48939] end,
                    setFunc = function(value)
                        GT.SV[48938] = value
                        GT.SV[48939] = value
                    end,
                },
                {
                    type = 'checkbox',
                    name = 'Purify',
                    width = 'half',
                    getFunc = function() return GT.SV[22270] end,
                    setFunc = function(value) GT.SV[22270] = value end,
                },
                {
                    type = 'header',
                    name = '|cFFFACDWarden|r',
                },
                {
                    type = 'checkbox',
                    name = 'Harvest',
                    width = 'half',
                    getFunc = function() return GT.SV[85572] end,
                    setFunc = function(value) GT.SV[85572] = value end,
                },
                {
                    type = 'checkbox',
                    name = 'Icy Escape',
                    width = 'half',
                    getFunc = function() return GT.SV[88892] end,
                    setFunc = function(value) GT.SV[88892] = value end,
                },
                {
                    type = 'header',
                    name = '|cFFFACDNecromancer|r',
                },
                {
                    type = 'checkbox',
                    name = 'Grave Robber',
                    width = 'half',
                    getFunc = function() return GT.SV[115567] end,
                    setFunc = function(value) GT.SV[115567] = value end,
                },
                {
                    type = 'checkbox',
                    name = 'Pure Agony',
                    width = 'half',
                    getFunc = function() return GT.SV[118610] end,
                    setFunc = function(value) GT.SV[118610] = value end,
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
                    width = 'half',
                    getFunc = function() return GT.SV[39521], GT.SV[41966] end,
                    setFunc = function(value)
                        GT.SV[39521] = value
                        GT.SV[41966] = value
                    end,
                },
                {
                    type = 'checkbox',
                    name = 'Spiders',
                    width = 'half',
                    getFunc = function() return GT.SV[39451], GT.SV[41997], GT.SV[42019] end,
                    setFunc = function(value)
                        GT.SV[39451] = value
                        GT.SV[41997] = value
                        GT.SV[42019] = value
                    end,
                },
                {
                    type = 'checkbox',
                    name = 'Radiate',
                    width = 'half',
                    getFunc = function() return GT.SV[41840] end,
                    setFunc = function(value) GT.SV[41840] = value end,
                },
                {
                    type = 'checkbox',
                    name = 'Bone Shield',
                    width = 'half',
                    getFunc = function() return GT.SV[39424], GT.SV[42196] end,
                    setFunc = function(value)
                        GT.SV[39424] = value
                        GT.SV[42196] = value
                    end,
                },
                {
                    type = 'checkbox',
                    name = 'Combustion',
                    width = 'half',
                    getFunc = function() return GT.SV[63512], GT.SV[85434] end,
                    setFunc = function(value)
                        GT.SV[63512] = value
                        GT.SV[85434] = value
                    end,
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
                    width = 'half',
                    getFunc = function() return GT.SV[58813] end,
                    setFunc = function(value) GT.SV[58813] = value end,
                },
                {
                    type = 'checkbox',
                    name = 'Shield of Ursus',
                    width = 'half',
                    getFunc = function() return GT.SV[111440] end,
                    setFunc = function(value) GT.SV[111440] = value end,
                },
                {
                    type = 'checkbox',
                    name = 'Sanguine Burst',
                    width = 'half',
                    getFunc = function() return GT.SV[141971] end,
                    setFunc = function(value) GT.SV[141971] = value end,
                },
                {
                    type = 'checkbox',
                    name = 'Heed The Call',
                    width = 'half',
                    getFunc = function() return GT.SV[142713] end,
                    setFunc = function(value) GT.SV[142713] = value end,
                },
            },
        },
    }

    LibAddonMenu2:RegisterAddonPanel(GT.name, PanelData)
    LibAddonMenu2:RegisterOptionControls(GT.name, OptionsTable)
end