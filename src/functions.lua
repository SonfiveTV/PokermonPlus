local subdir = "src/functions/"

local functions = NFS.getDirectoryItems(mod_dir..subdir)
for _, file in ipairs(functions) do
    sendDebugMessage ("The file is: "..file)
    local sprite, load_error = SMODS.load_file(subdir..file)
    if load_error then
        sendDebugMessage ("The error is: "..load_error)
    else
        sprite()
    end
end