BearSynergies = {
	name = "BearSynergies",
	version = "1.1.0",
	svName = "BearSynergiesSV",
  svVersion = 4,
  
	default = {
    isBlock = true,
    isTrack = true,
	},
}

local BS = BearSynergies

function BS.OnAddonLoaded(_, addonName)
	if addonName == BS.name then
		EVENT_MANAGER:UnregisterForEvent(BS.name, EVENT_ADD_ON_LOADED)
		BS.Initialise()
	end
end

function BS.Initialise()
	BS.savedVariables = ZO_SavedVars:NewAccountWide(BS.svName, BS.svVersion, nil, BS.default)

  if BS.savedVariables.isBlock then BS.Block.Initialise() end
  if BS.savedVariables.isTrack then BS.Track.Initialise() end

	BS.BuildMenu()
end

function BS.GetModulePanelData(name)
	return {
		type = "panel",
		name = name and string.format("Bear Synergies - %s", name) or "Bear Synergies",
		displayname = name and string.format("Bear Synergies - %s",	name) or "Bear Synergies",
		author = "|c00BFFFBjørnTheBurr|r",
		version = BS.version,
		registerForRefresh = true,
	}
end

EVENT_MANAGER:RegisterForEvent(BS.name, EVENT_ADD_ON_LOADED, BS.OnAddonLoaded)