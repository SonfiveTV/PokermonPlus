local reverencesleeve = {
    key = 'reverencesleeve',
    name = 'Reverence Sleeve',
    prefix_config = {},
    atlas = "sleeves",
    pos = { x = 0, y = 0 },
    config = {},
    loc_vars = function(self, info_queue, center)
        local key
        return {vars = {}}
    end,
    apply = function(self)
        G.GAME.modifiers.poke_force_seal = "poke_silver"
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

local slist = {reverencesleeve, virtuoussleeve}

return {Name = "Sleeve",
            init = init,
            list = slist
}
