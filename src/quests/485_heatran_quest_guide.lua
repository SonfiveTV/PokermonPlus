local quest_heatran = {
    name = "quest_heatran",
    loc_vars = function(self, info_queue, card)
        local cards = G.playing_cards or {}

        local REQUIREMENTS = {
            -- Enhancements / Centers
            { key = "m_bonus",        text = "Bonus",           type = "enhancement" },
            { key = "m_mult",         text = "Mult",            type = "enhancement" },
            { key = "m_wild",         text = "Wild",            type = "enhancement" },
            { key = "m_glass",        text = "Glass",           type = "enhancement" },
            { key = "m_steel",        text = "Steel",           type = "enhancement" },
            { key = "m_stone",        text = "Stone",           type = "enhancement" },
            { key = "m_gold",         text = "Gold",            type = "enhancement" },
            { key = "m_lucky",        text = "Lucky",           type = "enhancement" },

            -- Editions
            { key = "e_foil",         text = "Foil",            type = "edition" },
            { key = "e_holo",         text = "Holographic",     type = "edition" },
            { key = "e_polychrome",   text = "Polychrome",      type = "edition" },

            -- Seals
            { key = "gold",           text = "Gold",            type = "seal" },
            { key = "red",            text = "Red",             type = "seal" },
            { key = "blue",           text = "Blue",            type = "seal" },
            { key = "purple",         text = "Purple",          type = "seal" },
            { key = "poke_pink_seal", text = "Pink",            type = "seal" },
            { key = "poke_silver",    text = "Silver",          type = "seal" },
        }

        local center_present = {}
        local seal_present   = {}

        -- Scan deck
        for _, card in pairs(cards) do
            if card.config and card.config.center and card.config.center.key then
                center_present[card.config.center.key] = true
            end
            if card.edition and card.edition.key then
                center_present[card.edition.key] = true
            end
            if card.seal then
                local seal_key = type(card.seal) == "table" and card.seal.key or card.seal
                if seal_key then seal_present[seal_key:lower()] = true end
            end
        end

        local vars = {}
        local colours = {}
        local found_type = { enhancement = false, edition = false, seal = false }

        -- Initialize headers
        vars[2], vars[3], vars[4] = "???:", "???:", "???:"
        colours[2], colours[3], colours[4] = G.C.UI.TEXT_INACTIVE, G.C.UI.TEXT_INACTIVE, G.C.UI.TEXT_INACTIVE

        local all_met = true

        for i, req in ipairs(REQUIREMENTS) do
            local done = center_present[req.key] or seal_present[req.key]

            if done then
                vars[i + 4] = req.text
                colours[i + 4] = G.C.GREEN

                -- Reveal header once per type
                if not found_type[req.type] then
                    found_type[req.type] = true
                    if req.type == "enhancement" then
                        vars[2] = "Enhancements acquired:"
                        colours[2] = G.C.UI.TEXT
                    elseif req.type == "edition" then
                        vars[3] = "Editions acquired:"
                        colours[3] = G.C.UI.TEXT
                    elseif req.type == "seal" then
                        vars[4] = "Seals acquired:"
                        colours[4] = G.C.UI.TEXT
                    end
                end
            else
                vars[i + 4] = "???"
                colours[i + 4] = G.C.UI.TEXT_INACTIVE
                all_met = false
            end
        end

        -- Top line: all requirements met or not
        vars[1] = all_met and "(Quest available in the shop!)" or "(Must meet all requirements)"
        colours[1] = all_met and G.C.GREEN or G.C.UI.TEXT_INACTIVE
        vars.colours = colours

        return { vars = vars }
    end,
}

local quest_heatran_active = {
    name = "quest_heatran_active",
}

local quest_heatran_complete = {
    name = "quest_heatran_complete",
}

local function display_text()
    local display_text = {}
    local cards = G.playing_cards or {}
        local REQUIREMENTS = {
            -- Enhancements / Centers
            { key = "m_bonus",        text = "Bonus",           type = "enhancement" },
            { key = "m_mult",         text = "Mult",            type = "enhancement" },
            { key = "m_wild",         text = "Wild",            type = "enhancement" },
            { key = "m_glass",        text = "Glass",           type = "enhancement" },
            { key = "m_steel",        text = "Steel",           type = "enhancement" },
            { key = "m_stone",        text = "Stone",           type = "enhancement" },
            { key = "m_gold",         text = "Gold",            type = "enhancement" },
            { key = "m_lucky",        text = "Lucky",           type = "enhancement" },

            -- Editions
            { key = "e_foil",         text = "Foil",            type = "edition" },
            { key = "e_holo",         text = "Holographic",     type = "edition" },
            { key = "e_polychrome",   text = "Polychrome",      type = "edition" },

            -- Seals
            { key = "gold",           text = "Gold",            type = "seal" },
            { key = "red",            text = "Red",             type = "seal" },
            { key = "blue",           text = "Blue",            type = "seal" },
            { key = "purple",         text = "Purple",          type = "seal" },
            { key = "poke_pink_seal", text = "Pink",            type = "seal" },
            { key = "poke_silver",    text = "Silver",          type = "seal" },
        }

        local enhancement_present = {}
        local edition_present   = {}
        local seal_present   = {}
        local enhancements = {}
        local editions = {}
        local seals = {}


        -- Scan deck
        for _, card in pairs(cards) do
            if card.config and card.config.center and card.config.center.key then
                enhancement_present[card.config.center.key] = true
            end
            if card.edition and card.edition.key then
                edition_present[card.edition.key] = true
            end
            if card.seal then
                local seal_key = type(card.seal) == "table" and card.seal.key or card.seal
                if seal_key then seal_present[seal_key:lower()] = true end
            end
        end

        local display_text = {}
        local found_type = { enhancement = false, edition = false, seal = false }

        -- Initialize headers
        display_text[1], display_text[3], display_text[5] = "???:", "???:", "???:"
        

        local all_met = true

        for i, req in ipairs(REQUIREMENTS) do
            local done = enhancement_present[req.key] or edition_present[req.key] or seal_present[req.key]

            if done then
                if req.type == "enhancement" then
                    table.insert(enhancements, req.text)
                elseif req.type == "edition" then
                    table.insert(editions, req.text)
                elseif req.type == "seal" then
                    table.insert(seals, req.text)
                end

                -- Reveal header once per type
                if not found_type[req.type] then
                    found_type[req.type] = true
                    if req.type == "enhancement" then
                        display_text[1] = "Enhancements acquired:"
                    elseif req.type == "edition" then
                        display_text[3] = "Editions acquired:"
                    elseif req.type == "seal" then
                        display_text[5] = "Seals acquired:"
                    end
                end
            else
                if req.type == "enhancement" then
                    table.insert(enhancements, "???")
                elseif req.type == "edition" then
                    table.insert(editions, "???")
                elseif req.type == "seal" then
                    table.insert(seals, "???")
                end
                all_met = false
            end
            display_text[2] = table.concat(enhancements, ", ")
            display_text[4] = table.concat(editions, ", ")
            display_text[6] = table.concat(seals, ", ")
        end

        -- Top line: all requirements met or not
        display_text[7] = all_met and localize("key_heatran") or "???"
        display_text[8] = (G.GAME.active_quest == "heatran") and localize("key_heatran_active") or "???"

    return display_text
end

local function reward_text()
  return {localize("reward_heatran")}
end

if next(SMODS.find_mod("PokermonMaelmc")) then
    maelmc_add_quest({
        name = "quest_heatran",
        atlas = "sonfive_questbook",
        pos = {x = 1, y = 0},
        display_text = display_text,
        dex = 485,
        reward_text = reward_text,
        reward_atlas = "sonfive_boss_blinds",
        reward_pos = {x = 0, y = 0},
        set = "Blind",
    })
end

local list = {quest_heatran, quest_heatran_active, quest_heatran_complete}

return {name = "Heatran Quest", 
list = list
}