local reverencesleeve = {
    key = 'reverencesleeve',
    name = 'Reverence Sleeve',
    prefix_config = {},
    atlas = "sleeves",
    pos = { x = 0, y = 0 },
    config = {},
    loc_vars = function(self, info_queue, center)
        local key, vars
        if self.get_current_deck_key() == "b_sonfive_reverencedeck" then
            key = self.key.."_alt"
            vars = {}
        else
            key = self.key
            vars = {}
        end
        return {key = key, vars = vars}
    end,
    apply = function(self)
        if self.get_current_deck_key() == "b_sonfive_reverencedeck" then
            G.E_MANAGER:add_event(Event({func = function()
                G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
                return true 
            end }))
        else
            G.GAME.modifiers.poke_force_seal = "poke_silver"
        end
    end
}

local virtuoussleeve = {
    key = 'virtuoussleeve',
    name = 'Virtuous Sleeve',
    prefix_config = {},
    atlas = "sleeves",
    pos = { x = 1, y = 0 },
    config = {consumables = {"c_sonfive_timerball"}, hands = -1, dollars = -4},
    loc_vars = function(self, info_queue, center)
        local key, vars
        if self.get_current_deck_key() == "b_sonfive_virtuousdeck" then
            key = self.key.."_alt"
            self.config = {vouchers = {"v_hieroglyph"}}
            vars = {self.config.vouchers, self.config.consumables}
        else
            key = self.key
            self.config = {consumables = {"c_sonfive_timerball"}, hands = -1}
            vars = {self.config.vouchers, self.config.consumables}
        end
        return {key = key, vars = vars}
    end,
}

local propheticsleeve = {
    key = 'propheticsleeve',
    name = 'Prophetic Sleeve',
    prefix_config = {},
    atlas = "sleeves",
    pos = { x = 2, y = 0 },
    config = {},
    loc_vars = function(self, info_queue, center)
        local key, vars
        if self.get_current_deck_key() == "b_sonfive_propheticdeck" then
            key = self.key.."_alt"
            self.config = {extra = {scry = 6}}
            vars = {self.config.extra.scry}
        else
            key = self.key
            self.config = {hand_size = -1, extra = {scry = 3}}
            vars = {self.config.hand_size, self.config.extra.scry}
        end
        return {key = key, vars = vars}
    end,
    apply = function(self)
        G.GAME.scry_amount = 0
        G.GAME.scry_amount = G.GAME.scry_amount + self.config.extra.scry
    end    
}

local shinysleeve = {
    key = 'shinysleeve',
    name = 'Shiny Sleeve',
    prefix_config = {},
    atlas = "sleeves",
    pos = { x = 3, y = 0 },
    config = {extra = {chance = 100}},
    loc_vars = function(self, info_queue, center)
        local key, vars
        local key, vars
        if self.get_current_deck_key() == "b_sonfive_shinydeck" then
            key = self.key.."_alt"
            vars = {}
        else
            key = self.key
            vars = {}
        end
        return {key = key, vars = vars}
    end,
    apply = function(self)
        apply = function(self)
            local previous_shiny_get_weight = G.P_CENTERS.e_poke_shiny.get_weight
            G.P_CENTERS.e_poke_shiny.get_weight = function(self)
              return previous_shiny_get_weight(self) + ((G.GAME.shiny_edition_rate or 1) - 1) * G.P_CENTERS.e_poke_shiny.weight
            end
            if self.get_current_deck_key() == "b_sonfive_shinydeck" then
                G.GAME.shiny_edition_rate = (G.GAME.shiny_edition_rate) * self.config.extra.chance
            else
                G.GAME.shiny_edition_rate = (1) * self.config.extra.chance
            end
        end   
    end    
}

local slist = {reverencesleeve, virtuoussleeve, propheticsleeve, shinysleeve}

return {Name = "Sleeve",
            init = init,
            list = slist
}
