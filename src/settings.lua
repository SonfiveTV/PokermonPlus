local Tile = assert(SMODS.load_file("src/settings/tile.lua"))()

local list_map = function(list, func)
  new_list = {}
  for _, v in pairs(list) do
    new_list[#new_list + 1] = func(v)
  end
  return new_list
end

local content = assert(SMODS.load_file("src/settings/contents.lua"))()

local function create_tile_spacer()
  return { n = G.UIT.B, config = { w = 0.1, h = 3.5 } }
end

local function create_tile_grid(args)
  local page_options = {}

  for i, _ in ipairs(content.pages) do
    page_options[#page_options + 1] = localize('k_page') .. " " .. i .. "/" .. #content.pages
  end

  local current_page = content.pages[args.page_num]

  local first_row = { n = G.UIT.R, config = { align = "cm" }, nodes = { create_tile_spacer() } }
  local second_row = { n = G.UIT.R, config = { align = "cm" }, nodes = { create_tile_spacer() } }

  local tiles = current_page.tiles and list_map(current_page.tiles, function(tile)
    return Tile {
      label = tile.label(),
      display_cards = tile.list,
      ref_table = sonfive_config,
      ref_value = tile.config_key,
    }
  end) or {}
  
  for i, tile in ipairs(tiles) do
    if i < 4 then
      table.insert(first_row.nodes, tile:render())
      table.insert(first_row.nodes, create_tile_spacer())
    else
      table.insert(second_row.nodes, tile:render())
      table.insert(second_row.nodes, create_tile_spacer())
    end
  end
  
  return {
    n = G.UIT.ROOT,
    config = { colour = G.C.CLEAR },
    nodes = {
      {
        n = G.UIT.C,
        nodes = {
          {
            n = G.UIT.R,
            config = { align = "cm", padding = 0.2 },
            nodes = {
              { n = G.UIT.T, config = { text = current_page.title(), colour = G.C.UI.TEXT, scale = 0.5 } },
            }
          },
          first_row,
          second_row,
          {
            n = G.UIT.R,
            config = { align = "cm", padding = 0.2 },
            nodes = {
              create_option_cycle({
                options = page_options,
                current_option = args.page_num,
                opt_callback = "sonfive_update_config_page",
                scale = 0.8,
                colour = G.C.RED,
                cycle_shoulders = false,
                no_pips = true
              })
            }
          }
        }
      }
    }
  }
end

function G.FUNCS.sonfive_update_config_page(e)
  if not e or not e.cycle_config then return end
  
  local grid_wrap = G.OVERLAY_MENU:get_UIE_by_ID("sonfive_grid_wrap")
  
  grid_wrap.config.object:remove()
  grid_wrap.config.object = UIBox {
    definition = create_tile_grid { page_num = e.cycle_config.current_option },
    config = { parent = grid_wrap, type = "cm" },
  }
  
  grid_wrap.UIBox:recalculate()
end

function SMODS.current_mod.extra_tabs()
  return {
    -- ======================
    -- Pokemon Config tab
    -- ======================
    {
      label = 'Pokemon Config',
      tab_definition_function = function()
        local grid = UIBox {
          definition = create_tile_grid { page_num = 1 },
          config = { type = "cm" },
        }

        return {
          n = G.UIT.ROOT,
          config = {
            r = 0.1,
            minw = 14,
            minh = 8.5,
            align = "cm",
            colour = G.C.BLACK,
            emboss = 0.05,
          },
          nodes = {
            {
              n = G.UIT.O,
              config = {
                id = "sonfive_grid_wrap",
                object = grid
              }
            }
          }
        }
      end
    },

    -- ======================
    -- Extra tab
    -- ======================
    {
      label = 'Extra',
      tab_definition_function = function()
        return {
          n = G.UIT.ROOT,
          config = {
            r = 0.1,
            minw = 7,
            align = "cm",
            colour = G.C.BLACK,
            emboss = 0.05,
          },
          nodes = {
            create_toggle({
              label = localize("enable_timerball"),
              ref_table = sonfive_config,
              ref_value = "timerball",
            }),
          }
        }
      end
    },

    -- ======================
    -- Quests tab (FIXED)
    -- ======================
    {
      label = 'Quests',
      tab_definition_function = function()
        return {
          n = G.UIT.ROOT,
          config = {
            r = 0.1,
            minw = 7,
            align = "cm",
            colour = G.C.BLACK,
            emboss = 0.05,
          },
          nodes = {
            {
              n = G.UIT.R,           -- Row = horizontal stack
              config = {
                align = "cm",        -- top-middle alignment
                padding = 0.2        -- space between items
              },
              nodes = {
                {
                  n = G.UIT.T,
                  config = {
                    text = 'Heatran',
                    shadow = true,
                    scale = 1.0,
                    colour = G.C.UI.TEXT_LIGHT
                  }
                },
                {
                  n = G.UIT.T,
                  config = {
                    text = 'Have at least 1 Lucky card in your deck.',
                    shadow = true,
                    scale = 0.5,
                    colour = G.C.UI.TEXT_LIGHT
                  }
                }
              }
            }
          }
        }
      end
    },
  }
end




--     create_toggle({
--         label = "Allow Custom Stakes?",
--         ref_table = sonfive_config,
--         ref_value = "customStakes",
--     }),
--     
--   }