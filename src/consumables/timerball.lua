local timerball = {
  name = "timerball",
  key = "timerball",
  set = "Item",
  config = {
    extra = {
      legendary = 15, rare = 7, uncommon = 3, common = 1 -- Rounds requirement for each rarity
    }
  },

  loc_vars = function(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'timer'}
    local a = center.ability.extra
    local round = a.count or 0
    local rarity, color, key = localize('k_common'), G.C.BLUE
    local rarities = {
        {threshold = a.legendary, name = localize('k_legendary'), color = G.C.PURPLE},
        {threshold = a.rare,      name = localize('k_rare'),      color = G.C.RED},
        {threshold = a.uncommon,  name = localize('k_uncommon'),  color = G.C.GREEN},
        {threshold = a.common,    name = localize('k_common'),    color = G.C.BLUE},
    }
    
    for i = #rarities, 1, 1 do
        if round >= rarities[i].threshold then
            rarity = rarities[i].name
            color = rarities[i].color
            break
        end
    end

    key = (round >= a.legendary and self.key.."_max")
        or (round > 0 and round < a.common and self.key.."_start")
        or self.key.."_deck"

    round = (round >= a.legendary and 999)
        or (round >= a.rare and (a.legendary - round))
        or (round >= a.uncommon and (a.rare - round))
        or (round >= a.common and (a.uncommon - round))
        or (round >= 0 and (a.common - round))
        or round
    return {vars = {rarity, round, colours = {color}},  key = key}
  end,
  pos = { x = 0, y = 0 },
  soul_pos = {x = 1, y = 3},
  cost = 3,
  pokeball = true,
  custom_pool_func = true,
  in_pool = function(self)
    return sonfive_config.customItems
        or G.GAME.selected_back.effect.center.key == "b_sonfive_virtousdeck"
        or (next(SMODS.find_mod("CardSleeves")) and G.GAME.selected_sleeve == "sleeve_sonfive_virtuoussleeve")
  end,
  can_use = function(self, card)
    return (#G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers) and (card.ability.extra.count) >= 1
  end,
  calculate = function(self, card, context)
    if context.setting_blind then
      card.ability.extra.count = (card.ability.extra.count or 0) + 1
    end
  end,
  use = function(self, card, area, copier)
      set_spoon_item(card)
      G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
              play_sound('timpani')

              local a = self.config.extra
              local count = a.count or 0

              -- Determine stage
              local stage = count >= a.legendary and "Legendary" or nil

              -- Determine rarity
              local rarity
              if count >= a.legendary then
                  rarity = nil
              elseif count >= a.rare then
                  rarity = "rare"
              elseif count >= a.uncommon then
                  rarity = "uncommon"
              elseif count >= a.common then
                  rarity = "common"
              else
                  rarity = "common"
              end

              -- Create card safely
              local _card = create_random_poke_joker("timerball", stage, rarity)
              if _card then
                  _card:add_to_deck()
                  G.jokers:emplace(_card)
              end

              return true
          end
      }))
      delay(0.6)
  end,

  update = function(self, card, dt)
      if G.STAGE == G.STAGES.RUN then
          local a = self.config.extra
          local count = a.count or 0

          -- Determine sprite Y position
          local sprite_y
          if count >= a.legendary then
              sprite_y = 4
          elseif count >= a.rare then
              sprite_y = 3
          elseif count >= a.uncommon then
              sprite_y = 2
          elseif count >= a.common then
              sprite_y = 1
          else
              sprite_y = 0
          end

          -- Update floating sprite for max
          if count >= a.legendary and card.children.floating_sprite then
              card.children.floating_sprite:set_sprite_pos({x = 1, y = 4})
          end

          -- Update center sprite
          if card.children.center then
              card.children.center:set_sprite_pos({x = 0, y = sprite_y})
          end
      end
  end,

}

return {
      name = "Timerball",
      list = {timerball}
}