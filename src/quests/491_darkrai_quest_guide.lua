local quest_darkrai = {
    name = "quest_darkrai",
    loc_vars = function(self, info_queue, card)
        G.GAME.darkrai_quest_types = G.GAME.darkrai_quest_types or {}

        local energy_tasks = {
            "Grass", "Fire", "Water", "Lightning", "Psychic",
            "Fighting", "Colorless", "Dark", "Metal", "Fairy",
            "Dragon", "Earth",
        }

        local vars = {}
        local colours = {}

        -- Count completed tasks
        local completed_count = 0
        for _, energy in ipairs(energy_tasks) do
            if G.GAME.darkrai_quest_types[energy] then
                completed_count = completed_count + 1
            end
        end

        vars[1] = (completed_count == 12)
            and "(Quest available in the shop!)"
            or "(Must meet all requirements)"
        colours[1] = (completed_count == 12)
            and G.C.GREEN
            or G.C.UI.TEXT_INACTIVE

        -- Populate task texts and colours (FIXED)
        for i, energy in ipairs(energy_tasks) do
            local done = G.GAME.darkrai_quest_types[energy]

            if done then
                vars[i + 1] =
                    "Use a " .. energy .. (energy == "Dark" and "ness" or "") .. " Energy"
                colours[i + 1] = G.C.GREEN
            else
                vars[i + 1] = "???"
                colours[i + 1] = G.C.UI.TEXT_INACTIVE
            end
        end

        vars.colours = colours
        return { vars = vars }
    end,
}

local function display_text()
    local display_text = {}
    if not (G.GAME.quest_complete and G.GAME.quest_complete.darkrai) then
        G.GAME.darkrai_quest_types = G.GAME.darkrai_quest_types or {}
        local energy_tasks = {
            "Grass", "Fire", "Water", "Lightning", "Psychic",
            "Fighting", "Colorless", "Dark", "Metal", "Fairy",
            "Dragon", "Earth",
        }
        display_text = {}
        local count = 0
        for _, energy in ipairs(energy_tasks) do
            if G.GAME.darkrai_quest_types[energy] then
                count = count + 1
                -- table.insert(display_text, "Use a " .. energy .. (energy == "Dark" and "ness" or "") .. " Energy")
            -- else
                -- table.insert(display_text, "???")
            end
        end
        display_text[1] = (count > 0) and string.format("Use a unique Energy: "..count.."/"..#energy_tasks) or "???: 0/"..#energy_tasks
        display_text[2] = (count == #energy_tasks) and localize("key_darkrai") or "???"
        display_text[3] = (G.GAME.active_quest == "darkrai") and localize("key_darkrai_active") or "???"
    else
        display_text = {localize("quest_completed")}
    end
    return display_text
end

local function reward_text()
  return {localize("reward_darkrai")}
end

if next(SMODS.find_mod("PokermonMaelmc")) then
    maelmc_add_quest({
        name = "quest_darkrai",
        atlas = "sonfive_questbook",
        pos = {x = 2, y = 0},
        display_text = display_text,
        dex = 491,
        reward_text = reward_text,
        reward_atlas = "sonfive_boss_blinds",
        reward_pos = {x = 0, y = 1},
        set = "Blind",
    })
end

local list = {quest_darkrai}

return {name = "Darkrai Quest", 
list = list
}