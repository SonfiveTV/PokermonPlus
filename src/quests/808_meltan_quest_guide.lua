local quest_meltan = {
    name = "quest_meltan",
    loc_vars = function(self, info_queue, card)
        local vars = {}
        local colours = {}
        local quest = G.GAME.meltan_quest or {}
        quest.energy_used = quest.energy_used or 0
        quest.metalcoat = quest.metalcoat or 0
        quest.chariot = quest.chariot or 0
        vars[1] = (quest.energy_used > 0) and "Use Metal Energy: "..quest.energy_used.."/8" or "???: 0/8"
        vars[2] = (quest.metalcoat > 0) and "Use Metal Coat: "..quest.metalcoat.."/8" or "???: 0/8"
        vars[3] = (quest.chariot > 0) and "Use Chariot: "..quest.chariot.."/8" or "???: 0/8"
        vars[4] = (quest.energy_used >=8 and quest.metalcoat >=8 and quest.chariot >=8) and "(Quest available in the shop!)" or "(Must meet all requirements)"
        colours[1] = (quest.energy_used >=8) and G.C.GREEN or G.C.UI.TEXT_INACTIVE
        colours[2] = (quest.metalcoat >=8) and G.C.GREEN or G.C.UI.TEXT_INACTIVE
        colours[3] = (quest.chariot >=8) and G.C.GREEN or G.C.UI.TEXT_INACTIVE
        colours[4] = (quest.energy_used >=8 and quest.metalcoat >=8 and quest.chariot >=8) and G.C.GREEN or G.C.UI.TEXT_INACTIVE
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

local function display_text()
    local display_text = {}
    if not (G.GAME.quest_complete and G.GAME.quest_complete.meltan) then
        local quest = G.GAME.meltan_quest or {}
        quest.energy_used = quest.energy_used or 0
        quest.metalcoat = quest.metalcoat or 0
        quest.chariot = quest.chariot or 0
        display_text[1] = (quest.energy_used > 0) and "Use Metal Energy: "..math.min(quest.energy_used, 8).."/8" or "???: 0/8"
        display_text[2] = (quest.metalcoat > 0) and "Use Metal Coat: "..math.min(quest.metalcoat, 8).."/8" or "???: 0/8"
        display_text[3] = (quest.chariot > 0) and "Use Chariot: "..math.min(quest.chariot, 8).."/8" or "???: 0/8"
        display_text[4] = (quest.energy_used >=8 and quest.metalcoat >=8 and quest.chariot >=8) and localize("key_meltan") or "???"
        display_text[5] = G.GAME.active_quest == "meltan" and localize("key_meltan_active") or "???"
    else
        display_text = {localize("quest_completed")}
    end
    return display_text
end

local function reward_text()
  return {localize("reward_meltan")}
end

if next(SMODS.find_mod("PokermonMaelmc")) then
    maelmc_add_quest({
        name = "quest_meltan",
        atlas = "sonfive_questbook",
        pos = {x = 3, y = 0},
        display_text = display_text,
        dex = 808,
        reward_text = reward_text,
        reward_atlas = "sonfive_boss_blinds",
        reward_pos = {x = 0, y = 2},
        set = "Blind",
    })
end

local list = {quest_meltan, quest_meltan_active, quest_meltan_complete}

return {name = "Meltan Quest", 
list = list
}