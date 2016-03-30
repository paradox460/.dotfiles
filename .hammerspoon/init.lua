require 'expandmode'
require 'movemode'

local super = {'ctrl', 'alt', 'cmd', 'shift'}

function screensChangedCallback()
  local screens = hs.screen.allScreens()
  if #screens < 2 then
    hs.notify.show('Switched KWM modes', '', 'Switched to floating window mode',''):withdraw()
    hs.execute('kwmc space -t float', true)
    hs.execute('kwmc config focused-border off', true)
  else
    hs.notify.show('Switched KWM modes', '', 'Switched to bsp window mode',''):withdraw()
    hs.execute('kwmc space -t bsp', true)
    hs.execute('kwmc config focused-border on', true)
  end
end

hs.screen.watcher.new(screensChangedCallback):start()
