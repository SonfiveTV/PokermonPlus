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
  config = {extra = {pack_slots = -1}},
  loc_vars = function(self, info_queue, center)
      return {vars = {}}
  end,    
  calculate = function(self, back, context)
    if context.round_eval and G.GAME.last_blind and not G.GAME.last_blind.boss then
      G.E_MANAGER:add_event(Event({
        func = function()
          add_tag(Tag('tag_poke_shiny_tag'))
          play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
          play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
          return true
        end
      }))
    end
  end,
  apply = function(self)
    SMODS.change_booster_limit(self.config.extra.pack_slots)
  end
}

local roguedeck = {
	name = "roguedeck",
	key = "roguedeck",  
    atlas = "backs",
    pos = { x = 4, y = 0 },
	config = {consumables = {"c_poke_megastone"}},
  loc_vars = function(self, info_queue, center)
    return {vars = {self.config.consumables}}
  end,
  apply = function(self)
    G.GAME.win_ante = (G.GAME.win_ante + 4)
    -- G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {}
    -- G.GAME.perscribed_bosses[1] = 'bl_fish'
  end
} 

local voiddeck = {
	name = "voiddeck",
	key = "voiddeck",  
    atlas = "backs",
    pos = { x = 5, y = 0 },
	config = {},   -- spectral_rate = 2, consumables = {"c_poke_nightmare"}
  loc_vars = function(self, info_queue, center)
    return {vars = {"c_poke_nightmare"}}
  end,
  calculate = function(self, back, context)
    G.GAME.modifiers.void = true
    if not context.repetition and not context.individual and context.end_of_round and G.GAME.last_blind and G.GAME.last_blind.boss then
      if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      local _card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_poke_nightmare')
      -- local edition = {negative = true}
      -- _card:set_edition(edition, true)
      _card:add_to_deck()
      G.consumeables:emplace(_card)
      card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
    end
  end
  end,
  apply = function(self)
    G.GAME.modifiers.void = true
  end
} 

local dList = {virtuousdeck, propheticdeck, shinydeck, roguedeck, voiddeck}
return {name = "Back",
        list = dList}


