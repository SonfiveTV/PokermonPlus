local subdir = "src/quests/"

sonfive_quests = sonfive_quests or {}

local load_quests = function(item)
  item.discovered = true
  if not item.key then
    item.key = item.name
  end
  if not item.custom_pool_func then
    item.in_pool = function(self)
      return false(self)
    end
  end
  if not item.config then
    item.config = {}
  end
  SMODS.Joker(item)
end

local quests = function(item, custom_prefix, custom_atlas)
  if custom_prefix then
    item.poke_custom_prefix = custom_prefix
  end
  if not custom_atlas then
    item.atlas = 'poke_'..item.atlas
    item.poke_no_custom_atlas = true
    item.prefix_config = {atlas = false}
  else
    item.poke_custom_atlas = true
  end
  load_quests(item)
end

local function load_quest_folder(folder)
  local pfiles = NFS.getDirectoryItems(mod_dir .. folder)
    local count = 0

  if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] then
    for _, file in ipairs(pfiles) do
      sendDebugMessage("The file is: " .. file)
        count = count + 1
      local quest, load_error = SMODS.load_file(folder .. file)
      if load_error then
        sendDebugMessage("The error is: " .. load_error)
      else
        local curr_quest = quest()
        if curr_quest.init then
          curr_quest:init()
        end

        local family = {}

        if curr_quest.list and #curr_quest.list > 0 then
          for _, item in ipairs(curr_quest.list) do
            family[#family + 1] = item.name

            if not item.key then item.key = item.name end
            item.cost = 1

            item.config = item.config or {}
            item.config.extra = item.config.extra or {}

            item.discovered = true
            item.unlocked = true
            item.stage = "Other"
            item.no_collection = true
            item.no_mod_badges = true
            item.custom_pool_func = true
            item.aux_poke = true
            item.rarity = 1
            item.atlas = "sonfive_questbook"
            item.pos = item.pos or {x = count, y = 0}

            item.in_pool = function(self)
              return false
            end

            item.set_card_type_badge = function(self, card, badges)
              badges[#badges + 1] =
                create_badge('Quest', G.C.CLEAR, G.C.CLEAR, 0)
            end

            if item.ptype then
              item.config.extra.ptype = item.ptype
            end

            if item.atlas and string.find(item.atlas, "sonfive") then
              quests(item, "sonfive", true)
            else
              poke_load_atlas(item)
              poke_load_sprites(item)
              quests(item, "sonfive", false)
            end
          end

          if #family > 1 then
            pokermon.add_family(family)
          end
          table.insert(sonfive_quest_keys, curr_quest.list[1].key)
        end
      end
    end
  end
end

load_quest_folder(subdir)
