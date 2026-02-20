local minior = {
  name = "minior",
  config = {extra = {enhancement = "mult", revealed = false, core = false, hands_played = 0, Xmult = 1.25}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    local vars = {}
    local colours = {}
    local key = card.ability.extra.core and self.key.."_"..card.ability.extra.enhancement or self.key
    local enhancement = card.ability.extra.enhancement:sub(1,1):upper() .. card.ability.extra.enhancement:sub(2)
    vars[1] = (card.ability.extra.revealed and enhancement or "???")
    vars[2] = math.max( 2 - (card.ability.extra.hands_played), 0)
    vars[3] = card.ability.extra.Xmult
    colours[1] = (card.ability.extra.revealed and G.C.FILTER or G.C.UI.TEXT_INACTIVE)
    vars.colours = colours
  		return {vars = vars, key = key}
  end,
  designer = "Sonfive",
  rarity = 2,
  cost = 6,
  enhancement_gate = 'm_stone',
  stage = "Basic",
  ptype = "Earth",
  gen = 7,
  blueprint_compat = false,
  set_sprites = function(self, card, front)
    if card.ability and card.ability.extra and card.ability.extra.hands_played >= 2 then
      local enhancements = {
          {name = "mult", pos = { x = 9, y = 3 }},
          {name = "wild", pos = { x = 10, y = 3 }},
          {name = "gold", pos = { x = 11, y = 3 }},
          {name = "lucky", pos = { x = 0, y = 4 }},
          {name = "glass", pos = { x = 1, y = 4 }},
          {name = "bonus", pos = { x = 2, y = 4 }},
          {name = "steel", pos = { x = 8, y = 3 }}
        }
      for _, enhancement in ipairs(enhancements) do
        if card.ability.extra.enhancement == enhancement.name then
          card.children.floating_sprite:set_sprite_pos(enhancement.pos)
        end
      end
    end
  end,
  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      card.ability.extra.enhancement = pseudorandom_element({
        "mult", "wild", "gold", "lucky", "glass", "bonus", "steel"
      }, pseudoseed('minior'))
    end
  end,
  calculate = function(self, card, context)
    local abbr = card.ability.extra
    if context.joker_main and abbr.hands_played < 2 then
      G.E_MANAGER:add_event(Event({
          func = function()
              abbr.hands_played = abbr.hands_played + 1
              return true
          end,
      }))
      return { xmult = card.ability.extra.Xmult }
      
    end
    if not context.setting_blind and G.GAME.blind.in_blind and not abbr.core and abbr.hands_played >= 2 then
      abbr.revealed = true
      local enhancements = {
          {name = "mult", pos = { x = 9, y = 3 }},
          {name = "wild", pos = { x = 10, y = 3 }},
          {name = "gold", pos = { x = 11, y = 3 }},
          {name = "lucky", pos = { x = 0, y = 4 }},
          {name = "glass", pos = { x = 1, y = 4 }},
          {name = "bonus", pos = { x = 2, y = 4 }},
          {name = "steel", pos = { x = 8, y = 3 }}
        }
      abbr.core = true
      for _, enhancement in ipairs(enhancements) do
        if abbr.enhancement == enhancement.name then
          card.children.floating_sprite:set_sprite_pos(enhancement.pos)
        end
      end
    end
    if abbr.hands_played >= 2 and context.check_enhancement then
      if SMODS.has_enhancement(context.other_card, 'm_stone') then
        local key = "m_"..abbr.enhancement
          return {[key] = true}
      end
    end
    if context.end_of_round and abbr.core then
      abbr.core = false
      card.children.floating_sprite:set_sprite_pos({x = 7, y = 3})
      abbr.hands_played = 0
    end
  end,
}

local list = {minior}

return {name = "Minior", 
list = list
}