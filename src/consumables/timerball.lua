local timerball = {
  name = "timerball",
  key = "timerball",
  set = "Item",
  config = {extra = {count = 1, round_on_add = 1, legendary = 15, rare = 7, uncommon = 3, common = 1}},
  loc_vars = function(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'timer'}
    local rarities = {localize('k_common'), localize('k_uncommon'), localize('k_rare'), localize('k_legendary')}
    local rarity = rarities[1]
    local round = center.ability.extra.count - center.ability.extra.round_on_add
    local colors = {G.C.BLUE, G.C.GREEN, G.C.RED, G.C.PURPLE}
    local color = colors[1]
    local key

    if round >= center.ability.extra.legendary then
      round = 999
      rarity = rarities[4]
      color = colors[4]
      key = self.key.."_max"      
    elseif round >= center.ability.extra.rare then
      round = center.ability.extra.legendary - round
      rarity = rarities[3]
      color = colors[3]
    elseif round >= center.ability.extra.uncommon then
      round = center.ability.extra.rare - round
      rarity = rarities[2]
      color = colors[2]
    elseif round >= center.ability.extra.common then
      round = center.ability.extra.uncommon - round
      rarity = rarities[1]
      color = colors[1]
    elseif round < center.ability.extra.common and round > 0 then
      round = center.ability.extra.common - round
      rarity = rarities[1]
      color = colors[1]
      key = self.key.."_start"
    else 
      key = self.key.."_deck"
    end
    return {vars = {rarity, round, colours = {color}},  key = key}
    
  end,
  pos = { x = 0, y = 0 },
  soul_pos = {x = 1, y = 3},
  atlas = "consumables",
  cost = 3,
  unlocked = true,
  discovered = true,
  custom_pool_func = true,
  in_pool = function(self)
    if sonfive_config.customItems
    or G.GAME.selected_back.effect.center.key == "b_sonfive_virtousdeck"
    or (next(SMODS.find_mod("CardSleeves")) and G.GAME.selected_sleeve == "sleeve_sonfive_virtuoussleeve") then
      return true
    end
  end,
  can_use = function(self, card)
    if (#G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers) and (card.ability.extra.count - card.ability.extra.round_on_add) >= 1 then
      return true
    else
      return false
    end
  end,
  calculate = function(self, card, context)
    if context.setting_blind then
      card.ability.extra.count = card.ability.extra.count + 1
    end
  end,
  use = function(self, card, area, copier)
    set_spoon_item(card)
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
      play_sound('timpani')
      local _card = nil
      local difference = (card.ability.extra.count - card.ability.extra.round_on_add)
      if difference < self.config.extra.uncommon then
        _card = create_random_poke_joker("timerball", nil, "common", nil, nil)
      elseif self.config.extra.uncommon <= difference and difference < self.config.extra.rare then
        _card = create_random_poke_joker("timerball", nil, "uncommon", nil, nil)
      elseif self.config.extra.rare <= difference and difference < self.config.extra.legendary then
        _card = create_random_poke_joker("timerball", nil, "rare", nil, nil)
      elseif self.config.extra.legendary <= difference  then
        _card = create_random_poke_joker("timerball", "Legendary")
      end
      _card:add_to_deck()
      G.jokers:emplace(_card)
      return true end }))
    delay(0.6)
  end,
  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      card.ability.extra.round_on_add = 1
    end
  end,
  update = function(self, card, dt)
    if G.STAGE == G.STAGES.RUN then
    local difference = (card.ability.extra.count - card.ability.extra.round_on_add)
      if self.config.extra.common <= difference and difference < self.config.extra.uncommon then
        card.children.center:set_sprite_pos({x = 0, y = 1})
      elseif self.config.extra.uncommon <= difference and difference < self.config.extra.rare then
        card.children.center:set_sprite_pos({x = 0, y = 2})
      elseif self.config.extra.rare <= difference and difference < self.config.extra.legendary then
        card.children.center:set_sprite_pos({x = 0, y = 3})
      elseif self.config.extra.legendary <= difference  then
        card.children.center:set_sprite_pos({x = 0, y = 4})
        card.children.floating_sprite:set_sprite_pos({ x = 1, y = 4 })
      else
        card.children.center:set_sprite_pos({x = 0, y = 0})
      end
    end
  end,
}

return {name = "Timerball",
      list = {timerball}

}
