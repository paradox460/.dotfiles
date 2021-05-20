require "mp.msg"
function write_name(filename)
  if string.find(mp.get_property("path"), "http") then
    return
  end
  file = io.open(filename, "a+")
  path = mp.get_property("path")
  file:write(mp.get_property("path"), "\n")
  mp.command("playlist-next force")
  mp.msg.info("Wrote " .. path .. " to " .. filename)
  file:flush()
  file:close()
end

function failed()
  write_name("failed")
end

mp.add_key_binding(nil, "write_name", write_name)

mp.add_hook("on_load_fail", 50, failed)
