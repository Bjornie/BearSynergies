local BS = BearSynergies
local LAM = LibAddonMenu2

function BS.BuildMenu()
    local panelData = BS.GetModulePanelData()

    local optionsTable = {
        {
            type = 'header',
            name = '|cFFFACDGeneral|r',
        },
        {
            type = 'checkbox',
            name = 'Account-Wide Settings',
            getFunc = function() return BearSynergiesSV.defaults[GetDisplayName()]['$AccountWide'].isAccountWide end,
            setFunc = function(value) BearSynergiesSV.defaults[GetDisplayName()]['$AccountWide'].isAccountWide = value end,
            requiresReload = true,
            default = BS.defaults.isAccountWide,
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
            default = BS.defaults.isBlock,
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
            default = BS.defaults.isGroupTrack,
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
            default = BS.defaults.isTrack,
        },
        {
            type = 'description',
            text = 'Enables the possibility of tracking the cooldown of synergies.',
            width = 'half',
        },
    }

    LAM:RegisterAddonPanel(BS.name .. 'Main', panelData)
    LAM:RegisterOptionControls(BS.name .. 'Main', optionsTable)
end