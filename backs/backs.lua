local reverencedeck = {
    name = "reverencedeck",
    key = "reverencedeck",
    atlas = "backs",
    pos = {x = 0, y = 0},
    config = {},
    loc_vars = function(self, info_queue, center)
        return {vars = {}}
    end,
    apply = function(self)
        G.GAME.modifiers.poke_force_seal = "poke_silver"
    end
}

local virtuousdeck = {
	name = "virtuousdeck",
	key = "virtuousdeck",  
    atlas = "backs",
    pos = { x = 1, y = 0 },
	config = {consumables = {"c_sonfive_timerball"}, hands = -1, dollars = 0},
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end
} 

local propheticdeck ={
    name = "propheticdeck",
    key = "propheticdeck",
    atlas = "backs",
    pos = { x = 2, y = 0 },
    config = {hand_size = -1, extra = {scry = 3}},
    loc_vars = function(self, info_queue, center)
        return {vars = {self.config.hand_size, self.config.extra.scry}}
    end,

    
    apply = function(self)
        G.GAME.scry_amount = self.config.extra.scry
    end    
}

local shinydeck ={
    name = "shinydeck",
    key = "shinydeck",
    atlas = "backs",
    pos = { x = 3, y = 0 },
    config = {extra = {chance = 100}},
    loc_vars = function(self, info_queue, center)
        return {vars = {}}
    end,    

    apply = function(self)
        local previous_shiny_get_weight = G.P_CENTERS.e_poke_shiny.get_weight
        G.P_CENTERS.e_poke_shiny.get_weight = function(self)
          return previous_shiny_get_weight(self) + ((G.GAME.shiny_edition_rate or 1) - 1) * G.P_CENTERS.e_poke_shiny.weight
        end
        G.GAME.shiny_edition_rate = (G.GAME.shiny_edition_rate or 1) * self.config.extra.chance
    end   
}

local megadeck = {
	name = "megadeck",
	key = "megadeck",  
    atlas = "backs",
    pos = { x = 4, y = 0 },
	config = {consumables = {"c_poke_megastone"}},
  loc_vars = function(self, info_queue, center)
    return {vars = {self.config.consumables}}
  end,

  apply = function(self)
    G.GAME.win_ante = (G.GAME.win_ante + 4)
  end
} 



local dList = {reverencedeck, virtuousdeck, propheticdeck, shinydeck, megadeck}

return {name = "Back",
        list = dList
        
}


