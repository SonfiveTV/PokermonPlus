-- Describe all the logic for debuffing or undebuffing

-- return values: true, false, or 'prevent_debuff'
SMODS.current_mod.set_debuff = function(card)
   if card and card.ability and card.ability.fainted == G.GAME.round then
      return G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.HAND_PLAYED or G.STATE == G.STATES.DRAW_TO_HAND
   end

   -- prevent debuffs
   if card.ability.name == "nacli" then return 'prevent_debuff' end
   if card.ability.name == "naclstack" then return 'prevent_debuff' end
   if card.ability.name == "garganacl" then return 'prevent_debuff' end

   return false
end


energy_shift = function(card, energy_delta, etype, evolving, silent)
    local rounded = nil
    local frac = nil
    local frac_added = nil
    if type(card.ability.extra) == "table" then
        for name, _ in pairs(energy_values) do
            local data = card.ability.extra[name]
            if type(data) == "number" then
                local addition = energy_values[name] * energy_delta
                addition = addition + (addition / 2) * (#SMODS.find_card("j_marcpoke_toxtricity_amped"))
                local previous_mod = nil
                local updated_mod = nil
                if name == "mult_mod" or name == "chip_mod" then previous_mod = card.ability.extra[name] end
                if (card.ability.extra.ptype ~= "Colorless" and not card.ability.colorless_sticker) and etype == "Colorless" then
                    card.ability.extra[name] = data + (card.config.center.config.extra[name] * addition/2) * (card.ability.extra.escale or 1)
                else
                    card.ability.extra[name] = data + (card.config.center.config.extra[name] * addition) * (card.ability.extra.escale or 1)
                end
                updated_mod = card.ability.extra[name]
                rounded, frac = round_energy_value(card.ability.extra[name], name)
                card.ability.extra[name] = rounded
                if frac then
                    if name == "mult_mod" or name == "chip_mod" then
                        set_frac(card, frac, name, rounded > 0, updated_mod/previous_mod)
                    else
                        set_frac(card, frac, name, rounded > 0)
                    end
                    frac = nil
                    frac_added = true
                end
            end
        end
    elseif type(card.ability.extra) == "number" then
        local mults = {"Joker" , "Jolly Joker", "Zany Joker", "Mad Joker", "Crazy Joker", "Droll Joker", "Half Joker", "Mystic Summit", "Gros Michel", "Popcorn"}
        local mult_mods = {"Greedy Joker", "Lusty Joker", "Wrathful Joker", "Gluttonous Joker", "Fibonacci", "Abstract Joker", "Even Steven", "Ride the Bus", "Green Joker", "Red Card", "Erosion",
        "Fortune Teller", "Pokedex", "Flash Card", "Spare Trousers", "Smiley Face", "Onyx Agate", "Shoot the Moon", "Bootstraps"}
        local chipss = {"Sly Joker", "Wily Joker", "Clever Joker", "Devious Joker", "Crafty Joker", "Stuntman"}
        local chip_mods = {"Banner", "Scary Face", "Odd Todd", "Runner", "Blue Joker", "Hiker", "Square Joker", "count Joker", "Bull", "Castle", "Arrowhead", "Wee Joker"}
        local Xmults = {"Loyalty Card", "Blackboard", "Cavendish", "Card Sharp", "Ramen", "Acrobat", "Flower Pot", "Seeing Double", "The Duo", "The Trio", "The Family", "The Order", "The Tribe", 
        "Driver's License"}
        local Xmult_mods = {"Joker Stencil", "Steel Joker", "Constellation", "Madness", "Vampire", "Hologram", "Baron", "Obelisk", "Photograph", "Lucky Cat", "Baseball Card", "Evercount", "Ancient Joker",
        "Campfire", "Throwback", "Bloodcount", "Glass Joker", "The Idol", "Hit the Road", "Canio", "Triboulet", "Yorick"}
        local monies = {"Delayed Gratification", "Egg", "Cloud 9", "Rocket", "Gift Card", "Reserved Parking", "Mail-In Rebate", "To the Moon", "Golden Joker", "Trading Card", "Golden Ticket", "Rough Gem",
        "Satellite", "Matador"}
        
        local scoring_values = {mult = mults, mult_mod = mult_mods, chips = chipss, chip_mod = chip_mods, Xmult = Xmults, Xmult_mod = Xmult_mods, money = monies}
        for k, v in pairs(scoring_values) do
            for x, y in pairs(v) do
                if card.ability.name == y then
                    local increase = energy_values[k] * energy_delta
                    if not card.ability.colorless_sticker and etype == "Colorless" then
                        increase = increase/2
                    end
                    card.ability.extra = card.ability.extra + (card.config.center.config.extra * increase)
                end
            end
        end
    else
        local increase = nil
        if (card.ability.mult and card.ability.mult > 0) or (card.ability.t_mult and card.ability.t_mult > 0) then
            increase = energy_values.mult * energy_delta
        elseif (card.ability.t_chips and card.ability.t_chips > 0) then
            increase = energy_values.chips * energy_delta
        end
        if increase then
            if not card.ability.colorless_sticker and etype == "Colorless" then
                increase = increase/2
            end
            if (card.ability.mult and card.ability.mult > 0) then
                card.ability.mult = card.ability.mult + (card.config.center.config.mult * increase)
            end
            if (card.ability.t_mult and card.ability.t_mult > 0) then
                card.ability.t_mult = card.ability.t_mult + (card.config.center.config.t_mult * increase)
            end
            if (card.ability.t_chips and card.ability.t_chips > 0) then
                card.ability.t_chips = card.ability.t_chips + (card.config.center.config.t_chips * increase)
            end
        end
    end
    if not silent then
        if energy_delta > 0 then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("poke_energized_ex")..energy_delta, colour = G.C.CHIPS})
        elseif energy_delta < 0 then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("poke_deenergized_ex")..energy_delta, colour = G.C.CHIPS})
        end
    end
end

void = false


highlighted_negative_energy_can_use = function(self, card)
  if void and card.edition and card.edition.negative then
  if not G.jokers.highlighted or #G.jokers.highlighted ~= 1 then return false end
  local choice = G.jokers.highlighted[1]
  if energy_matches(choice, self.etype, true) then
    if type(choice.ability.extra) == "table" then
        for name, _ in pairs(energy_values) do
          if type(choice.ability.extra[name]) == "number" then
            return true
          end
        end
    elseif type(choice.ability.extra) == "number" then
        return true
      end
    elseif (choice.ability.mult and choice.ability.mult > 0) or (choice.ability.t_mult and choice.ability.t_mult > 0) or (choice.ability.t_chips and choice.ability.t_chips > 0)
          or (choice.ability.x_mult and choice.ability.x_mult > 1) then
        return true
      end
    end
  return false
end

highlighted_negative_energy_use = function(self, card, area, copier)
  local viable = false
  if not G.jokers.highlighted or #G.jokers.highlighted ~= 1 then return false end
  local choice = G.jokers.highlighted[1]
  if G.GAME.energies_used then
    G.GAME.energies_used = G.GAME.energies_used  + 1
  else
    G.GAME.energies_used = 1
  end
  set_spoon_item(card)
  if (energy_matches(choice, self.etype, true) or self.etype == "Trans") then
    if type(choice.ability.extra) == "table" then
        for name, _ in pairs(energy_values) do
          if type(choice.ability.extra[name]) == "number" then
            viable = true
          end
      end
    elseif (type(choice.ability.extra) == "number" or (choice.ability.mult and choice.ability.mult > 0) or (choice.ability.t_mult and choice.ability.t_mult > 0) or
      (choice.ability.t_chips and choice.ability.t_chips > 0) or (choice.ability.x_mult and choice.ability.x_mult > 1)) then
        viable = true
      end
    end
    if viable then
      if type(choice.ability.extra) == "table" then
        if (energy_matches(choice, self.etype, false) or self.etype == "Trans") then
          if choice.ability.extra.negative_energy_count then
            choice.ability.extra.negative_energy_count = choice.ability.extra.negative_energy_count + 1
          else
            choice.ability.extra.negative_energy_count = 1
          end
          negative_energize(choice, false)
        elseif self.etype == "Colorless" then
          if choice.ability.extra.negative_c_energy_count then
            choice.ability.extra.negative_c_energy_count = choice.ability.extra.negative_c_energy_count + 1
          else
            choice.ability.extra.negative_c_energy_count = 1
          end
          negative_energize(choice, self.etype, false)
        end
      elseif type(choice.ability.extra) == "number" or (choice.ability.mult and choice.ability.mult > 0) or (choice.ability.t_mult and choice.ability.t_mult > 0) or 
           (choice.ability.t_chips and choice.ability.t_chips > 0) or (choice.ability.x_mult and choice.ability.x_mult > 1) then
        if (energy_matches(choice, self.etype, false) or self.etype == "Trans") then
          if choice.ability.negative_energy_count then
            choice.ability.negative_energy_count = choice.ability.negative_energy_count + 1
          else
            choice.ability.negative_energy_count = 1
          end
          negative_energize(choice, false)
        elseif self.etype == "Colorless" then
          if choice.ability.negative_c_energy_count then
            choice.ability.negative_c_energy_count = choice.ability.negative_c_energy_count + 1
          else
            choice.ability.negative_c_energy_count = 1
          end
          negative_energize(choice, self.etype, false)
        end
      end
  end
end

negative_energize = function(card, etype, evolving, silent)
  local rounded = nil
  local frac = nil
  local frac_added = nil
  if type(card.ability.extra) == "table" then
    for name, _ in pairs(energy_values) do
      local data = card.ability.extra[name]
      if type(data) == "number" then
        local addition = energy_values[name]
        local previous_mod = nil
        local updated_mod = nil
        if name == "mult_mod" or name == "chip_mod" then previous_mod = card.ability.extra[name] end
        if evolving then
          if card.ability.extra.ptype ~= "Colorless" and not card.ability.colorless_sticker then
            addition = (addition * (card.ability.extra.negative_energy_count or 0)) + (addition/2 * (card.ability.extra.negative_c_energy_count or 0))
          else
            addition = (addition * ((card.ability.extra.negative_energy_count or 0) + (card.ability.extra.negative_c_energy_count or 0)))
          end
          card.ability.extra[name] =  data + (card.config.center.config.extra[name] * addition) * (card.ability.extra.escale or 1)
          updated_mod = card.ability.extra[name]
          rounded, frac = round_energy_value(card.ability.extra[name], name)
          card.ability.extra[name] = rounded
          if frac then
            if name == "mult_mod" or name == "chip_mod" then
              set_frac(card, frac, name, rounded > 0, updated_mod/previous_mod)
            else
              set_frac(card, frac, name, rounded > 0)
            end
            frac = nil
            frac_added = true
          end
        else
          if (card.ability.extra.ptype ~= "Colorless" and not card.ability.colorless_sticker) and etype == "Colorless" then
            card.ability.extra[name] = data + (card.config.center.config.extra[name] * addition/2) * (card.ability.extra.escale or 1)
          else
            card.ability.extra[name] = data + (card.config.center.config.extra[name] * addition) * (card.ability.extra.escale or 1)
          end
          updated_mod = card.ability.extra[name]
          rounded, frac = round_energy_value(card.ability.extra[name], name)
          card.ability.extra[name] = rounded
          if frac then
            if name == "mult_mod" or name == "chip_mod" then
              set_frac(card, frac, name, rounded > 0, updated_mod/previous_mod)
            else
              set_frac(card, frac, name, rounded > 0)
            end
            frac = nil
            frac_added = true
          end
        end
      end
    end
  elseif type(card.ability.extra) == "number" then
    local mults = {"Joker" , "Jolly Joker", "Zany Joker", "Mad Joker", "Crazy Joker", "Droll Joker", "Half Joker", "Mystic Summit", "Gros Michel", "Popcorn"}
    local mult_mods = {"Greedy Joker", "Lusty Joker", "Wrathful Joker", "Gluttonous Joker", "Fibonacci", "Abstract Joker", "Even Steven", "Ride the Bus", "Green Joker", "Red Card", "Erosion",
                       "Fortune Teller", "Pokedex", "Flash Card", "Spare Trousers", "Smiley Face", "Onyx Agate", "Shoot the Moon", "Bootstraps"}
    local chipss = {"Sly Joker", "Wily Joker", "Clever Joker", "Devious Joker", "Crafty Joker", "Stuntman"}
    local chip_mods = {"Banner", "Scary Face", "Odd Todd", "Runner", "Blue Joker", "Hiker", "Square Joker", "count Joker", "Bull", "Castle", "Arrowhead", "Wee Joker"}
    local Xmults = {"Loyalty Card", "Blackboard", "Cavendish", "Card Sharp", "Ramen", "Acrobat", "Flower Pot", "Seeing Double", "Driver's License"}
    local Xmult_mods = {"Joker Stencil", "Steel Joker", "Constellation", "Madness", "Vampire", "Hologram", "Baron", "Obelisk", "Photograph", "Lucky Cat", "Baseball Card", "Evercount", "Ancient Joker",
                        "Campfire", "Throwback", "Bloodcount", "Glass Joker", "The Idol", "Hit the Road", "Canio", "Triboulet", "Yorick"}
    local monies = {"Delayed Gratification", "Egg", "Cloud 9", "Rocket", "Gift Card", "Reserved Parking", "Mail-In Rebate", "To the Moon", "Golden Joker", "Trading Card", "Golden Ticket", "Rough Gem",
                    "Satellite", "Matador"}
    
    local scoring_values = {mult = mults, mult_mod = mult_mods, chips = chipss, chip_mod = chip_mods, Xmult = Xmults, Xmult_mod = Xmult_mods, money = monies}
    for k, v in pairs(scoring_values) do
      for x, y in pairs(v) do
        if card.ability.name == y then
          local increase = energy_values[k]
          if not card.ability.colorless_sticker and etype == "Colorless" then
            increase = increase/2
          end
          card.ability.extra = card.ability.extra + (card.config.center.config.extra * increase)
        end
      end
    end
  else
    local increase = nil
    if (card.ability.mult and card.ability.mult > 0) or (card.ability.t_mult and card.ability.t_mult > 0) then
      increase = energy_values.mult
    elseif (card.ability.t_chips and card.ability.t_chips > 0) then
      increase = energy_values.chips
    elseif (card.ability.x_mult and card.ability.x_mult > 1) then
      increase = energy_values.Xmult
    end
    if increase then
      if not card.ability.colorless_sticker and etype == "Colorless" then
        increase = increase/2
      end
      if (card.ability.mult and card.ability.mult > 0) then
        card.ability.mult = card.ability.mult + (card.config.center.config.mult * increase)
      end
      if (card.ability.t_mult and card.ability.t_mult > 0) then
        card.ability.t_mult = card.ability.t_mult + (card.config.center.config.t_mult * increase)
      end
      if (card.ability.t_chips and card.ability.t_chips > 0) then
        card.ability.t_chips = card.ability.t_chips + (card.config.center.config.t_chips * increase)
      end
      if (card.ability.x_mult and card.ability.x_mult > 1) then
        card.ability.x_mult = card.ability.x_mult + (card.config.center.config.Xmult * increase)
      end
    end
  end
  if not silent then
    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("poke_energized_ex"), colour = G.ARGS.LOC_COLOURS.pink})
  end
end

negative_energy_can_use = function(self, card)
  for k, v in pairs(G.jokers.cards) do
    if energy_matches(v, self.etype, true) then
      if type(v.ability.extra) == "table" then
          for name, _ in pairs(energy_values) do
            local data = v.ability.extra[name]
            if type(data) == "number" then
              return true
            end
          end
      elseif type(v.ability.extra) == "number" then
          return true
      elseif (v.ability.mult and v.ability.mult > 0) or (v.ability.t_mult and v.ability.t_mult > 0) or (v.ability.t_chips and v.ability.t_chips > 0)
            or (v.ability.x_mult and v.ability.x_mult > 1) then
          return true
        end
      end
    end
  return false
end

negative_energy_use = function(self, card, area, copier)
  local applied = false
  local viable = false
  if G.GAME.energies_used then
    G.GAME.energies_used = G.GAME.energies_used  + 1
  else
    G.GAME.energies_used = 1
  end
  set_spoon_item(card)
  for k, v in pairs(G.jokers.cards) do
    if applied ~= true and (energy_matches(v, self.etype, true) or self.etype == "Trans") then
      if type(v.ability.extra) == "table" then
          for name, _ in pairs(energy_values) do
            if type(v.ability.extra[name]) == "number" then
              viable = true
            end
          end
      elseif applied ~= true and (type(v.ability.extra) == "number" or (v.ability.mult and v.ability.mult > 0) or (v.ability.t_mult and v.ability.t_mult > 0) or
            (v.ability.t_chips and v.ability.t_chips > 0) or (v.ability.x_mult and v.ability.x_mult > 1)) then
          viable = true
        end
      end
      if viable then
        increment_negative_energy(v, self.etype)
        applied = true
      end
    end
end

increment_negative_energy = function(card, etype)
  if card.ability.extra and type(card.ability.extra) == "table" then
    if (energy_matches(card, etype, false) or etype == "Trans") then
      if card.ability.extra.negative_energy_count then
        card.ability.extra.negative_energy_count = card.ability.extra.negative_energy_count + 1
      else
        card.ability.extra.negative_energy_count = 1
      end
      negative_energize(card, false)
    elseif etype == "Colorless" then
      if card.ability.extra.negative_c_energy_count then
        card.ability.extra.negative_c_energy_count = card.ability.extra.negative_c_energy_count + 1
      else
        card.ability.extra.negative_c_energy_count = 1
      end
      negative_energize(card, etype, false)
    end
  elseif type(card.ability.extra) == "number" or (card.ability.mult and card.ability.mult > 0) or (card.ability.t_mult and card.ability.t_mult > 0) or 
       (card.ability.t_chips and card.ability.t_chips > 0) or (card.ability.x_mult and card.ability.x_mult > 1) then
    if (energy_matches(card, etype, false) or etype == "Trans") then
      if card.ability.negative_energy_count then
        card.ability.negative_energy_count = card.ability.negative_energy_count + 1
      else
        card.ability.negative_energy_count = 1
      end
      negative_energize(card, false)
    elseif etype == "Colorless" then
      if card.ability.negative_c_energy_count then
        card.ability.negative_c_energy_count = card.ability.negative_c_energy_count + 1
      else
        card.ability.negative_c_energy_count = 1
      end
      negative_energize(card, etype, false)
    end
  end
end


sandstorm = function()
  local count = 0
  for i=1, #G.hand.cards do
    if SMODS.has_enhancement(G.hand.cards[i], 'm_count') then 
        count = count + 1
    end
  end
  if count == #G.hand.cards then
    return true
  else 
    return false
  end
end

hail = function()
  local count = 0
  for i=1, #G.hand.cards do
    if SMODS.has_enhancement(G.hand.cards[i], 'm_glass') then 
        count = count + 1
    end
  end
  if count == #G.hand.cards then
    return true
  else 
    return false
  end
end

rain = function()
  local count = 0
  for i=1, #G.hand.cards do
    if SMODS.has_enhancement(G.hand.cards[i], 'm_bonus') then 
        count = count + 1
    end
  end
  if count == #G.hand.cards then
    return true
  else 
    return false
  end
end

sunny = function()
  local count = 0
  for i=1, #G.hand.cards do
    if SMODS.has_enhancement(G.hand.cards[i], 'm_mult') then 
        count = count + 1
    end
  end
  if count == #G.hand.cards then
    return true
  else 
    return false
  end
end




unique_hand_tooltip = function(self, info_queue, center)
  if center.ability and center.ability.extra and type(center.ability.extra) == "table" and center.ability.extra.played_hands then
    local a = center.ability.extra

    -- master hand order
    local hands = {
      "High Card", "Pair", "Two Pair", "Three of a Kind", "Straight",
      "Flush", "Full House", "Four of a Kind", "Straight Flush",
      "Five of a Kind", "Flush House", "Flush Five"
    }

    -- Collect only played hands
    local played_list = {}
    for _, hand in ipairs(hands) do
      if a.played_hands[hand] then
        table.insert(played_list, hand)
      end
    end

    -- Only show tooltip if there is at least one played hand
    if #played_list > 0 then
      local key = "ston_hands" .. #played_list  -- dynamic key
      info_queue[#info_queue + 1] = {set = 'Other', key = key, vars = played_list}
    end
  end
end




