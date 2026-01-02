local shroodle = {
  name = "shroodle",
  config = {extra = {targets = {{value = "Grass"}, {value = "Fire"}, {value = "Water"}}, count = 0}, evo_rqmt = 3},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    local abbr = card.ability.extra
    local vars = {}
    local colours = {}
    for i = 1, #abbr.targets do
      vars[i] = abbr.targets[i].value
      colours[i] = G.ARGS.LOC_COLOURS[string.lower(abbr.targets[i].value)] or G.C.UI.TEXT_INACTIVE
      colours[i + #abbr.targets] = (abbr.targets[i].value == 'Lightning' and G.C.BLACK or G.C.WHITE)
    end
    vars[(1+#abbr.targets)] = math.max(0, (self.config.evo_rqmt - card.ability.extra.count))
    vars.colours = colours

    return {vars = vars}
  end,
  designer = "Sonfive",
  rarity = 2,
  cost = 6,
  stage = "Basic",
  ptype = "Dark",
  gen = 9,
  blueprint_compat = true,
  
  calculate = function(self, card, context)
    if context.tag_triggered then
      card.ability.extra.count = card.ability.extra.count + 1
    end
    if (context.end_of_round and G.GAME.blind.boss) and not context.repetition and not context.individual then
      G.E_MANAGER:add_event(Event({
        func = (function()
            local tags = {}
            for k, v in pairs(G.P_TAGS) do
              if v.key ~= "tag_boss" then
                tags[#tags + 1] = v
              end
            end
            local temp_tag = pseudorandom_element(tags, pseudoseed('shroodle'))
            local tag = Tag(temp_tag.key)
            if tag.key == "tag_orbital" then 
              local _poker_hands = {}
              for k, v in pairs(G.GAME.hands) do
                if v.visible then
                  _poker_hands[#_poker_hands + 1] = k
                end
              end
              tag.ability.orbital_hand = pseudorandom_element(_poker_hands, pseudoseed('shroodle'))
            end
            add_tag(tag)
            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
            play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
            return true
        end)
      }))
    end
    return scaling_evo(self, card, context, "j_sonfive_grafaiai", card.ability.extra.count, self.config.evo_rqmt)
  end,
  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      self:set_nature(card)
    end
  end,
  set_nature = function(self, card)
    local types = {
      "Grass", "Fire", "Water", "Lightning", "Psychic",
      "Fighting", "Colorless", "Dark", "Metal", "Fairy",
      "Dragon", "Earth"
    }

    local targets = card.ability.extra.targets or {}
    local total = #targets
    local replace_count = math.min(3, total)
    local start_index = total - replace_count + 1

    local new_targets = {}
    local used = {}

    -- mark existing (untouched) targets as used
    for i = 1, start_index - 1 do
      new_targets[i] = targets[i]
      used[targets[i].value] = true
    end

    -- build available pool excluding used values
    local pool = {}
    for _, t in ipairs(types) do
      if not used[t] then
        table.insert(pool, t)
      end
    end

    -- replace last N targets without duplicates
    for i = start_index, total do
      if #pool == 0 then break end

      local choice = pseudorandom_element(pool, pseudoseed("shroodle_" .. i))
      new_targets[i] = { value = choice }

      for j, v in ipairs(pool) do
        if v == choice then
          table.remove(pool, j)
          break
        end
      end
    end

    card.ability.extra.targets = new_targets
  end

}

local grafaiai = {
  name = "grafaiai",
  config = {extra = {targets = {{value = "Grass"}, {value = "Fire"}, {value = "Water"}}}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    local abbr = card.ability.extra
    local vars = {}
    local colours = {}
    for i = 1, #abbr.targets do
      vars[i] = abbr.targets[i].value
      colours[i] = G.ARGS.LOC_COLOURS[string.lower(abbr.targets[i].value)] or G.C.UI.TEXT_INACTIVE
      colours[i + #abbr.targets] = (abbr.targets[i].value == 'Lightning' and G.C.BLACK or G.C.WHITE)
    end
    vars[(1+#abbr.targets)] = G.GAME.last_tag and localize{type = 'name_text', key = G.GAME.last_tag, set = 'Tag'} or localize('k_none')
    vars.colours = colours

    return {vars = vars}
  end,
  designer = "Sonfive",
  rarity = "poke_safari",
  cost = 6,
  stage = "One",
  ptype = "Dark",
  gen = 9,
  blueprint_compat = true,
  
  calculate = function(self, card, context)
    if (context.end_of_round and G.GAME.blind.boss) and not context.repetition and not context.individual then
      if G.GAME.last_tag then
        G.E_MANAGER:add_event(Event({
          func = (function()
              add_tag(Tag(G.GAME.last_tag))
              play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
              play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
              return true
          end)
        }))
      end
    end
  end,
  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      self:set_nature(card)
    end
  end,
  set_nature = function(self, card)
    local types = {
      "Grass", "Fire", "Water", "Lightning", "Psychic",
      "Fighting", "Colorless", "Dark", "Metal", "Fairy",
      "Dragon", "Earth"
    }

    local targets = card.ability.extra.targets or {}
    local total = #targets
    local replace_count = math.min(3, total)
    local start_index = total - replace_count + 1

    local new_targets = {}
    local used = {}

    -- mark existing (untouched) targets as used
    for i = 1, start_index - 1 do
      new_targets[i] = targets[i]
      used[targets[i].value] = true
    end

    -- build available pool excluding used values
    local pool = {}
    for _, t in ipairs(types) do
      if not used[t] then
        table.insert(pool, t)
      end
    end

    -- replace last N targets without duplicates
    for i = start_index, total do
      if #pool == 0 then break end

      local choice = pseudorandom_element(pool, pseudoseed("shroodle_" .. i))
      new_targets[i] = { value = choice }

      for j, v in ipairs(pool) do
        if v == choice then
          table.remove(pool, j)
          break
        end
      end
    end

    card.ability.extra.targets = new_targets
  end
}


local list = {shroodle, grafaiai}

return {name = "Shroodle", 
list = list

}
