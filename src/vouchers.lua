local subdir = "src/vouchers/"

local vouchers = NFS.getDirectoryItems(mod_dir..subdir)

for _, file in ipairs(vouchers) do
  sendDebugMessage ("The file is: "..file)
  local voucher, load_error = SMODS.load_file(subdir..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_voucher = voucher()
    if curr_voucher.init then curr_voucher:init() end
    
    for i, item in ipairs(curr_voucher.list) do
      SMODS.Voucher(item)
    end
  end
end