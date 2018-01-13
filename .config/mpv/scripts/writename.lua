-- require "mp.msg"
function write_name()
  file = io.open("watched", "a+")
  file:write(mp.get_property("path"), "\n")
  mp.command("playlist-next force")
  file:flush()
  file:close()
end

mp.add_key_binding(nil, "write_name", write_name)
