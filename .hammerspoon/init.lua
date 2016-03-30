require 'expandmode'
require 'movemode'

local screenmon = nil
local super = {'ctrl', 'alt', 'cmd', 'shift'}

function screensChangedCallback()
  local screen1 = hs.screen.allScreens()[1]:name()
  if screen1 == 'Color LCD' then
    hs.notify.show('Switched KWM modes', '', 'Switched to floating window mode',''):withdraw()
    hs.execute('kwmc space -t float', true)
  end
end

screenmon = hs.screen.watcher.new(screensChangedCallback)
screenmon:start()
