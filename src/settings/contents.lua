---@format disable
return {
  pages = {
    {
      title = function() return localize("sonfive_config_page1") end,
      tiles = {
        { list = { "j_sonfive_heatran" }, label = function() return localize { type = "name_text", set = "Joker", key = "j_sonfive_heatran" } end, config_key = "heatran" },
        { list = { "j_sonfive_darkrai", "j_sonfive_mega_darkrai" }, label = function() return localize { type = "name_text", set = "Joker", key = "j_sonfive_darkrai" } end, config_key = "darkrai" },
        { list = { "j_sonfive_heliolisk", "j_sonfive_helioptile" }, label = function() return localize { type = "name_text", set = "Joker", key = "j_sonfive_heliolisk" } end, config_key = "heliolisk" },
        { list = { "j_sonfive_minior" }, label = function() return localize { type = "name_text", set = "Joker", key = "j_sonfive_minior" } end, config_key = "minior" },
        { list = { "j_sonfive_meltan", "j_sonfive_melmetal" }, label = function() return localize { type = "name_text", set = "Joker", key = "j_sonfive_meltan" } end, config_key = "meltan" },
        { list = { "j_sonfive_stonjourner" }, label = function() return localize { type = "name_text", set = "Joker", key = "j_sonfive_stonjourner" } end, config_key = "stonjourner" },
      }
    },
    {
      title = function() return localize("sonfive_config_page2") end,
      tiles = {
        { list = { "j_sonfive_duraludon" , "j_sonfive_archaludon"}, label = function() return localize { type = "name_text", set = "Joker", key = "j_sonfive_duraludon" } end, config_key = "duraludon" },
        { list = { "j_sonfive_lechonk", "j_sonfive_oinkologne" }, label = function() return localize { type = "name_text", set = "Joker", key = "j_sonfive_oinkologne" } end, config_key = "oinkologne" },
        { list = { "j_sonfive_shroodle", "j_sonfive_grafaiai" }, label = function() return localize { type = "name_text", set = "Joker", key = "j_sonfive_shroodle" } end, config_key = "shroodle" },
        { list = { "j_sonfive_cetoddle", "j_sonfive_cetitan" }, label = function() return localize { type = "name_text", set = "Joker", key = "j_sonfive_cetoddle" } end, config_key = "cetoddle" },
        { list = { "j_sonfive_canari_plush" }, label = function() return localize { type = "name_text", set = "Joker", key = "j_sonfive_canari_plush" } end, config_key = "canari_plush" },
      }
    },
    {
      title = function() return localize("sonfive_config_items") end,
      tiles = {
        { list = { "c_sonfive_timerball" }, label = function() return localize { type = "name_text", set = "Item", key = "c_sonfive_timerball" } end, config_key = "timerball" },
      }
    }
  }
}
