local DisplayCard = Moveable:extend()

local templates = assert(SMODS.load_file("src/settings/load_templates.lua"))()

DisplayCard.set_card_area = Card.set_card_area
DisplayCard.set_sprites = Card.set_sprites
DisplayCard.hard_set_T = Card.hard_set_T
DisplayCard.move = Card.move
DisplayCard.release = Card.release
DisplayCard.align = Card.align
DisplayCard.align_h_popup = Card.align_h_popup
DisplayCard.update = Card.update
DisplayCard.juice_up = Card.juice_up

-- Necessary for drawing
DisplayCard.should_draw_shadow = Card.should_draw_shadow
DisplayCard.should_draw_base_shader = Card.should_draw_base_shader
DisplayCard.draw = Card.draw

-- Necessary for displaying the tooltip
DisplayCard.hover = Card.hover
DisplayCard.stop_hover = Card.stop_hover
function DisplayCard:generate_UIBox_ability_table()
  local template = self.config.center
  local loc_vars = nil
  if type(template.loc_vars) == 'function' then
    -- This really should be `self` in the third variable, but that requires me to open up `:set_ability`
    loc_vars = (template.loc_vars(template, {}, template) or {}).vars
  end
  return generate_card_ui(template, nil, loc_vars, nil, {}, false, nil, nil, self)
end

-- Necessary for not crashing
function DisplayCard:update_alert() end

function DisplayCard:init(X, Y, W, H, key)
  self.is_display_card = true
  -- SMODS still uses these params even though we set the values to true manually. Oh well.
  self.params = { bypass_discovery_center = true, bypass_discovery_ui = true }

  Moveable.init(self, X, Y, W, H)

  self.CT = self.VT
  self.config = {
    card = {},
    -- See if we can get by without this somehow,
    -- as losing the center lets us not bother with patching pokermon
    center = templates[key],
  }
  self.tilt_var = { mx = 0, my = 0, dx = 0, dy = 0, amt = 0 }
  self.ambient_tilt = 0.2

  self.states.collide.can = true
  self.states.hover.can = true
  self.states.drag.can = true
  self.states.click.can = true

  self.back = 'selected_back'
  self.bypass_discovery_center = true
  self.bypass_discovery_ui = true
  self.bypass_lock = true
  self.no_ui = self.config.card and self.config.card.no_ui
  self.children = {}
  self.base_cost = 0
  self.extra_cost = 0
  self.cost = 0
  self.sell_cost = 0
  self.sell_cost_label = 0
  self.children.shadow = Moveable(0, 0, 0, 0)
  self.unique_val = 1 - self.ID / 1603301
  self.edition = nil
  self.zoom = true
  self.ability = {} -- self:set_ability(center, true)
  self:set_sprites(self.config.center)

  self.discard_pos = {
    r = 3.6 * (math.random() - 0.5),
    x = math.random(),
    y = math.random()
  }

  self.facing = 'front'
  self.sprite_facing = 'front'
  self.flipping = nil
  self.area = nil
  self.highlighted = false
  self.click_timeout = 0.3
  self.T.scale = 0.95
  self.debuff = false

  if self.children.front then self.children.front.VT.w = 0 end
  self.children.back.VT.w = 0
  self.children.center.VT.w = 0

  if self.children.front then
    self.children.front.parent = self; self.children.front.layered_parallax = nil
  end
  self.children.back.parent = self; self.children.back.layered_parallax = nil
  self.children.center.parent = self; self.children.center.layered_parallax = nil
end

return DisplayCard