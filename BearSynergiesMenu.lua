local BS = BearSynergies
local LAM = LibAddonMenu2

function BS.BuildMenu()
    local panelData = BS.GetModulePanelData()

    local optionsTable = {
        {
            type = "header",
            name = "|cFFFACDModule Settings|r",
        },
        {
            type = "checkbox",
            name = "Synergy Block",
            width = "half",
            getFunc = function() return BS.savedVariables["Blocker"] end,
            setFunc = function(value) BS.savedVariables["Blocker"] = value end,
            requiresReload = true,
        },
    }

    LAM:RegisterAddonPanel(BS.name .. "Main", panelData)
    LAM:RegisterOptionControls(BS.name .. "Main", optionsTable)
end