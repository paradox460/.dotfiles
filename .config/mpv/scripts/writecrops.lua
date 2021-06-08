require "mp.msg"

function write_crop(filename)
  if string.find(mp.get_property("path"), "http") then
    return
  end
  file = io.open(filename, "a+")
  path = mp.get_property("path")
  vftable =  mp.get_property_native("vf")
  croprules = ""

  if #vftable == 0 then
    return
  end
  for i = #vftable, 1, -1 do
    if vftable[i].name == "crop" then
      crop_params = vftable[i].params
      croprules = string.format("x=%s:y=%s:w=%s:h=%s", crop_params.x, crop_params.y, crop_params.w, crop_params.h)
    end
  end

  file:write(mp.get_property("path"), "\t", croprules, "\n")
  mp.msg.info("Wrote " .. path .. " to " .. filename)
  file:flush()
  file:close()
end

mp.add_key_binding(nil, "write_crop", write_crop)
