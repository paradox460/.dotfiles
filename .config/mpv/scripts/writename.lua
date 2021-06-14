require "mp.msg"

function unmute()
  mp.unregister_event(unmute)
  mp.set_property_bool("mute", false)
end

function write_name(filename, no_skip, mute)
  file = io.open(filename, "a+")
  path = mp.get_property("path")
  file:write(mp.get_property("path"), "\n")
  if not no_skip then
    mp.command("playlist-next force")
  end
  mp.osd_message("Wrote to " .. filename)
  mp.msg.info("Wrote " .. path .. " to " .. filename)
  file:flush()
  file:close()
  if mute then
    mp.set_property_bool("mute", true)
    mp.register_event("end-file", unmute)
  end
end

function failed()
  if string.find(mp.get_property("path"), "http") then
    return
  end
  write_name("failed")
end

mp.add_key_binding(nil, "write_name", write_name)

mp.add_hook("on_load_fail", 50, failed)
