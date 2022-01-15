-- -------------------------------------------------------------------------- --
-- 监测睡眠状态并执行指定操作
--
-- 前置：brew install blueutil (on: 1, off: 0)

local blueutil = "'/usr/local/bin/blueutil'"
local sleepWatcher = require("hs.caffeinate.watcher")

cw = sleepWatcher.new(function(screenEvent)
    if screenEvent == sleepWatcher.systemWillSleep then
        if hs.battery.powerSource() == "Battery Power" then
            hs.execute(blueutil.." --power 0")
            hs.wifi.setPower(false)
        end
    elseif screenEvent == sleepWatcher.screensDidWake then
        hs.execute(blueutil.." --power 1")
        hs.timer.doAfter(2, function() hs.wifi.setPower(true) end)
    end
end):start()