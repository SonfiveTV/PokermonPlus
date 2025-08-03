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
        if self.get_current_deck_key() == "b_sonfive_shinydeck" then
            key = self.key.."_alt"
            vars = {}
        else
            key = self.key
            vars = {}
        end
        return {key = key, vars = vars}
    end,
    calculate = function(self, card, context)
    if context.setting_blind then
      print(G.GAME.shiny_edition_rate)
    end
  end,
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
}

local megasleeve = {
    key = 'megasleeve',
    name = 'Mega Sleeve',
    prefix_config = {},
    atlas = "sleeves",
    pos = { x = 4, y = 0 },
	config = {},
  loc_vars = function(self, info_queue, center)
    local key, vars
    if self.get_current_deck_key() == "b_sonfive_megadeck" then
        key = self.key
        self.config = {consumables = {"c_poke_megastone"}}
        vars = {}
    else
        key = self.key
        self.config = {consumables = {"c_poke_megastone"}}
        vars = {}
    end
    return {key = key, vars = vars}
end,

  apply = function(self)
    G.GAME.win_ante = (G.GAME.win_ante + 4)
    if self.key == "megasleeve_alt" then
        delay(0.4)
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _, v in ipairs(self.config.consumables) do
                        local card = SMODS.create_card{key=v}
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                    end
                    return true
                end
            }))
    else
        delay(0.4)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, v in ipairs(self.config.consumables) do
                    local card = SMODS.create_card{key=v}
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                end
                return true
            end
        }))
    end
    
    end
} 

if sonfive_config.customItems then
local slist = {virtuoussleeve, propheticsleeve, shinysleeve, megasleeve}
return {name = "Back",
        list = slist
        
}
else 
  local slist = {propheticsleeve, shinysleeve, megasleeve}


return {name = "Sleeves",
        list = slist
        
}
end
