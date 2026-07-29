local minior = {
  name = "minior",
  config = {extra = {shields = true, revealed = false, Xmult = 1.25, form = "mult"}},
  loc_vars = function(self, info_queue, card)
    local abbr = card.ability.extra or self.config.extra
    local key = not abbr.shields and self.key .. "_" .. abbr.form or self.key
    local vars = {
      abbr.revealed and abbr.form:gsub('^%l', string.upper) or "???",
      math.max(2 - G.GAME.current_round.hands_played, 0),
      abbr.Xmult
    }
    vars.colours = { abbr.revealed and G.C.FILTER or G.C.UI.TEXT_INACTIVE }
    return {vars = vars, key = key}
  end,
  designer = "Sonfive",
  rarity = 2,
  cost = 6,
  enhancement_gate = 'm_stone',
  stage = "Basic",
  ptype = "Earth",
  gen = 7,
  set_sprites = function(self, card, front)
    if not (card and card.ability and card.ability.extra) then return end
    if not (G.GAME.current_round.hands_played >= 2) then return end
    local abbr = card.ability and card.ability.extra
    local float = card.children and card.children.floating_sprite
    local enhancements = {
      ["mult"] = { x = 9, y = 3 },
      ["wild"] = { x = 10, y = 3 },
      ["gold"] = { x = 11, y = 3 },
      ["lucky"] = { x = 0, y = 4 },
      ["glass"] = { x = 1, y = 4 },
      ["bonus"] = { x = 2, y = 4 },
      ["steel"] = { x = 8, y = 3 }
    }
    if float then
      float:set_sprite_pos(abbr.shields and {x = 7, y = 3} or enhancements[abbr.form])
    end
    SMODS.calculate_effect({message = abbr.shields and '' or localize('sonfive_shieldsdown_ex')}, card)
  end,
  set_ability = function(self, card, initial, delay_sprites)
    if initial then self:set_nature(card) end
  end,
  calc_dollar_bonus = function(self, card)
    if not card.ability.extra.shields then
      card.ability.extra.shields = true
      if card.children.floating_sprite then
        card.children.floating_sprite:set_sprite_pos({x = 7, y = 3})
      end
      SMODS.calculate_effect({message = ''}, card)
    end
  end,
  calculate = function(self, card, context)
    local abbr = card.ability.extra
    local hands_played = G.GAME.current_round.hands_played

    if context.joker_main and hands_played < 2 then
      return { xmult = abbr.Xmult }
    end

    if G.GAME.blind.in_blind and hands_played >= 2 and abbr.shields then
      abbr.revealed = true
      abbr.shields = false
      self:set_sprites(card)
    end

    if context.check_enhancement and hands_played >= 2 then
      if SMODS.has_enhancement(context.other_card, 'm_stone') then
        local key = "m_"..abbr.form
        return { [key] = true }
      end
    end

    if context.round_eval and not abbr.shields then
      abbr.shields = true
      self:set_sprites(card)
    end
  end,
  set_nature = function(self, card)
    card.ability.extra.form = pokermon.get_target_card_enhancements("minior", 1)
    card.ability.extra.form = card.ability.extra.form[1]:sub(3, -1) -- taking out 'm_' from the key
  end,
}

return {
  name = "Minior",
  list = { minior }
}