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

local list = {quest_darkrai}

return {name = "Darkrai Quest", 
list = list
}