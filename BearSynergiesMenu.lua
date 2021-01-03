local BS = BearSynergies
local LAM = LibAddonMenu2

function BS.BuildMenu()
    local PanelData = BS.GetModulePanelData()

    local OptionsTable = {
        {
            type = 'header',
            name = '|cFFFACDGeneral|r',
        },
        {
            type = 'checkbox',
            name = 'Account-Wide Settings',
            getFunc = function() return BearSynergiesSV.Default[GetDisplayName()]['$AccountWide'].isAccountWide end,
            setFunc = function(value)
                BearSynergiesSV.Default[GetDisplayName()]['$AccountWide'].isAccountWide = value
                BS.BuildMenu()
            end,
            default = BS.Default.isAccountWide,
        },
        {
            type = 'header',
            name = '|cFFFACDModule Settings|r',
        },
        {
            type = 'checkbox',
            name = 'Synergy Block',
            getFunc = function() return BS.SV.isBlock end,
            setFunc = function(value) BS.SV.isBlock = value end,
            width = 'half',
            requiresReload = true,
            default = BS.Default.isBlock,
        },
        {
            type = 'description',
            text = 'Enables the possibility of blocking specific synergies or all synergies in defined scenarios.',
            width = 'half',
        },
        {
            type = 'checkbox',
            name = 'Group Tracker',
            getFunc = function() return BS.SV.isGroupTrack end,
            setFunc = function(value) BS.SV.isGroupTrack = value end,
            width = 'half',
            requiresReload = true,
            default = BS.Default.isGroupTrack,
        },
        {
            type = 'description',
            text = 'Enables tracking of synergy cooldowns for group members, uptime of Alkosh and alerts for when Alkosh user needs your synergies.',
            width = 'half',
        },
        {
            type = 'checkbox',
            name = 'Synergy Tracker',
            getFunc = function() return BS.SV.isTrack end,
            setFunc = function(value) BS.SV.isTrack = value end,
            width = 'half',
            requiresReload = true,
            default = BS.Default.isTrack,
        },
        {
            type = 'description',
            text = 'Enables the possibility of tracking the cooldown of synergies.',
            width = 'half',
        },
    }

    LAM:RegisterAddonPanel(BS.name .. 'Main', PanelData)
    LAM:RegisterOptionControls(BS.name .. 'Main', OptionsTable)
end