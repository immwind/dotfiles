-- -------------------------------------------------------------------------- --
-- 监测睡眠状态并执行指定操作
--
-- 前置：brew install blueutil (on: 1, off: 0)

local blueutil = "'/usr/local/bin/blueutil'"
local sleepWatcher = require("hs.caffeinate.watcher")

cw = sleepWatcher.new(function(screenEvent)
        if screenEvent == sleepWatcher.screensDidSleep then
            if hs.battery.powerSource() == "Battery Power" then
                hs.wifi.setPower(false)
                hs.execute(blueutil.." --power 0")
            end
        elseif screenEvent == sleepWatcher.screensDidWake then
            hs.wifi.setPower(true)
            hs.execute(blueutil.." --power 1")
        end
end):start()