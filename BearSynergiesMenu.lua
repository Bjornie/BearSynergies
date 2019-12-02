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
        {
            type = "header",
            name = "Dragonknight",
        },
        {
            type = "checkbox",
            name = "Shackle",
            tooltip = "Disabling this will prevent you from being able to activate the Shackle synergy, provided by the Dragonknight Standard skill.",
            getFunc = function() return end,
            setFunc = function(value) end,
        },
    }
end