local quest_meltan = {
    name = "quest_meltan",
    loc_vars = function(self, info_queue, card)
        local vars = {}
        local colours = {}
        local quest = G.GAME.meltan_quest or {}
        quest.energy_used = quest.energy_used or 0
        quest.metalcoat = quest.metalcoat or 0
        quest.chariot = quest.chariot or 0
        vars[1] = (quest.energy_used > 0) and "Use Metal Energy: "..quest.energy_used.."/10" or "???: 0/10"
        vars[2] = (quest.metalcoat > 0) and "Use Metal Coat: "..quest.metalcoat.."/10" or "???: 0/10"
        vars[3] = (quest.chariot > 0) and "Use Chariot: "..quest.chariot.."/10" or "???: 0/10"
        vars[4] = (quest.energy_used >=10 and quest.metalcoat >=10 and quest.chariot >=10) and "(Requirements have been met!)" or "(Must meet all requirements)"
        colours[1] = (quest.energy_used >=10) and G.C.GREEN or G.C.UI.TEXT_INACTIVE
        colours[2] = (quest.metalcoat >=10) and G.C.GREEN or G.C.UI.TEXT_INACTIVE
        colours[3] = (quest.chariot >=10) and G.C.GREEN or G.C.UI.TEXT_INACTIVE
        colours[4] = (quest.energy_used >=10 and quest.metalcoat >=10 and quest.chariot >=10) and G.C.GREEN or G.C.UI.TEXT_INACTIVE
        vars.colours = colours
        return { vars = vars }
    end,
}

local quest_meltan_active = {
    name = "quest_meltan_active",
}

local quest_meltan_complete = {
    name = "quest_meltan_complete",
}

local list = {quest_meltan, quest_meltan_active, quest_meltan_complete}

return {name = "Meltan Quest", 
list = list
}