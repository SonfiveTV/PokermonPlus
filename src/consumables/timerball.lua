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
    info_queue[#info_queue + 1] = {set = 'Other', key = 'timer'}

    local a = center.ability.extra or {}
    local count = a.count or 0

    -- Default rarity and color
    local rarity, color = localize('k_common'), G.C.BLUE

    -- Rarity thresholds
    local rarities = {
        {threshold = a.legendary or 15, name = localize('k_legendary'), color = G.C.PURPLE},
        {threshold = a.rare or 7,      name = localize('k_rare'),      color = G.C.RED},
        {threshold = a.uncommon or 3,  name = localize('k_uncommon'),  color = G.C.GREEN},
        {threshold = a.common or 1,    name = localize('k_common'),    color = G.C.BLUE},
    }

    -- Determine rarity based on count
    for i = #rarities, 1, -1 do
        if count >= rarities[i].threshold then
            rarity = rarities[i].name
            color = rarities[i].color
            break
        end
    end

    -- Determine key based on count
    local key
    if count >= (a.legendary) then
        key = self.key .. "_max"
    elseif count >= (a.common) then
        key = self.key
    elseif count > 0 and count < (a.common) then
        key = self.key .. "_start"
    else
        key = self.key .. "_deck"
    end

    -- Calculate rounds until next threshold
    local rounds
    if count >= (a.legendary or 15) then
        rounds = 999
    elseif count >= (a.rare or 7) then
        rounds = (a.legendary or 15) - count
    elseif count >= (a.uncommon or 3) then
        rounds = (a.rare or 7) - count
    elseif count >= (a.common or 1) then
        rounds = (a.uncommon or 3) - count
    else
        rounds = (a.common or 1) - count
    end

    return {vars = {rarity, rounds, colours = {color}}, key = key}
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

          if card.children.floating_sprite then
              local float_y = (count >= (a.legendary or 15)) and 4 or sprite_y
              card.children.floating_sprite:set_sprite_pos({x = 1, y = float_y})
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