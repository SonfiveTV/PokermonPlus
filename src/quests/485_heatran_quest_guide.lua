local quest_heatran = {
    name = "quest_heatran",
    loc_vars = function(self, info_queue, card)
        local cards = G.playing_cards or {}

        -- All requirements: Centers / Editions / Seals
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

        -- Scan deck (same logic as quest)
        for _, card in pairs(cards) do
            if card.config and card.config.center and card.config.center.key then
                center_present[card.config.center.key] = true
            end

            if card.edition and card.edition.key then
                center_present[card.edition.key] = true
            end

            if card.seal then
                local seal_key = type(card.seal) == "table" and card.seal.key or card.seal
                if seal_key then
                    seal_present[seal_key:lower()] = true
                end
            end
        end

        local vars = {}
        local colours = {}
        local completed_count = 0

        -- Initialize headers
        vars[2], vars[3], vars[4] = "???:", "???:", "???:"
        colours[2], colours[3], colours[4] =
            G.C.UI.TEXT_INACTIVE, G.C.UI.TEXT_INACTIVE, G.C.UI.TEXT_INACTIVE

        -- Track which header types have been revealed
        local found_type = { enhancement = false, edition = false, seal = false }

        -- Loop through all requirements
        for i, req in ipairs(REQUIREMENTS) do
            local done = center_present[req.key] or seal_present[req.key]

            if done then
                completed_count = completed_count + 1
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
            end
        end

        vars[1] = completed_count
        vars.colours = colours

        return { vars = vars}
    end,


}

local quest_heatran_active = {
    name = "quest_heatran_active",
}

local quest_heatran_complete = {
    name = "quest_heatran_complete",
}

local list = {quest_heatran, quest_heatran_active, quest_heatran_complete}

return {name = "Heatran Quest", 
list = list
}