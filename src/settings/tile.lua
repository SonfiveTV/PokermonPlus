local AgarTile = Object:extend()

local templates = assert(SMODS.load_file("src/settings/load_templates.lua"))()

local SettingsComponent = PokeDisplayCardComponent:extend()

function SettingsComponent:apply(args)
  for k, v in pairs(args.properties or {}) do
    self.display_card.properties[k] = v
  end
  self.display_card.properties.generate_ui = SMODS.Center.generate_ui
  self.display_card.no_ui = nil
end

local tile_colour_enabled = G.C.GREY
local tile_colour_disabled = mix_colours(G.C.GREY, G.C.UI.BACKGROUND_INACTIVE, 0.3)
local text_colour_enabled = G.C.WHITE
local text_colour_disabled = G.C.UI.TEXT_INACTIVE
local backdrop_colour_enabled = mix_colours(G.C.GREY, G.C.BLACK, 0.3)
local backdrop_colour_disabled = mix_colours(G.C.UI.BACKGROUND_INACTIVE, G.C.BLACK, 0.3)
local outline_colour_enabled = mix_colours(tile_colour_enabled, G.C.BLACK, 0.5)
local outline_colour_disabled = mix_colours(tile_colour_disabled, G.C.BLACK, 0.5)

local function update_centers(config_key, enable)
  for _, center in pairs(G.P_CENTERS) do
    if center.agar_config_key == config_key then
      center.no_collection = not enable
    end
  end
end

function G.FUNCS.agar_toggle_settings_tile(e)
  e.config.ref_table[e.config.ref_value] = not e.config.ref_table[e.config.ref_value]
  local enabled = e.config.ref_table[e.config.ref_value]

  update_centers(e.config.ref_value, enabled)

  e.config.colour = enabled and backdrop_colour_enabled or backdrop_colour_disabled
  e.config.outline_colour = enabled and outline_colour_enabled or outline_colour_disabled

  -- change CardArea tile colour
  e.children[1].config.colour = enabled and tile_colour_enabled or tile_colour_disabled

  -- change text colour
  e.children[2].children[1].children[1].config.colour = enabled and text_colour_enabled or text_colour_disabled
end

function AgarTile:init(args)
  self.label = args.label or ''
  self.ref_value = args.ref_value
  self.ref_table = args.ref_table
  self.display_cards = args.display_cards or {}
  self.cardarea = CardArea(0, 0, G.CARD_W * (2 - 1 / #self.display_cards), G.CARD_H,
    { card_limit = #self.display_cards, type = 'title' })
  for _, key in ipairs(self.display_cards) do
    local template = templates[key]
    local _args = {
      properties = template,
      components = { SettingsComponent() }
    }
    local card = PokeDisplayCard(_args, 0, 0, G.CARD_W, G.CARD_H)
    self.cardarea:emplace(card)
  end
end

function AgarTile:render()
  local enabled = self.ref_table[self.ref_value]

  return {
    n = G.UIT.C,
    config = {
      r = 0.1,
      padding = 0.025,
      emboss = 0.05,
      colour = enabled and backdrop_colour_enabled or backdrop_colour_disabled,
      outline = 1,
      outline_colour = enabled and outline_colour_enabled or outline_colour_disabled,
      button = "agar_toggle_settings_tile",
      ref_table = self.ref_table,
      ref_value = self.ref_value,
      hover = true,
    },
    nodes = {
      {
        n = G.UIT.R,
        config = {
          align = "cm",
          r = 0.1,
          minw = G.CARD_W * 2,
          padding = 0.1,
          emboss = 0.1,
          colour = enabled and tile_colour_enabled or tile_colour_disabled,
        },
        nodes = {
          { n = G.UIT.O, config = { object = self.cardarea } },
        }
      },
      {
        n = G.UIT.R,
        config = { align = "cm" },
        nodes = {
          {
            n = G.UIT.C,
            nodes = {
              { n = G.UIT.T, config = { text = self.label, colour = enabled and text_colour_enabled or text_colour_disabled, scale = 0.4, } }
            }
          },
        }
      }
    }
  }
end

return AgarTile
