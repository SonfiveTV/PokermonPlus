local reverencedeck = {
    name = "reverencedeck",
    key = "reverencedeck",
    atlas = "backs",
    pos = {x = 0, y = 0},
    config = {},
    loc_vars = function(self, info_queue, center)
        return {vars = {hands, dollars}}
    end,
    apply = function(self)
        G.GAME.modifiers.poke_force_seal = "poke_silver"
    end,
}
local virtuousdeck = {
	name = "virtuousdeck",
	key = "virtuousdeck",  
    atlas = "backs",
    pos = { x = 1, y = 0 },
	config = {consumables = {"c_sonfive_timerball"}, hands = -1, dollars = -4},
  loc_vars = function(self, info_queue, center)
    return {vars = {}}
  end,


} 


local dList = {reverencedeck, virtuousdeck}

return {name = "Back",
        list = dList
        
}
