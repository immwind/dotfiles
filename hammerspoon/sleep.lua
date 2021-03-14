-- -------------------------------------------------------------------------- --
-- 监测睡眠状态并执行指定操作
--
-- 前置：brew install blueutil (on: 1, off: 0)

local caffeinateWatcher = require("hs.caffeinate.watcher")

cs = caffeinateWatcher.new(function(screenEvent)
    if hs.battery.powerSource() == "Battery Power" then
        if screenEvent == caffeinateWatcher.screensDidSleep then
            hs.wifi.setPower(false)
            hs.execute("/usr/local/bin/blueutil --power 0")
        elseif screenEvent == caffeinateWatcher.screensDidWake then
            hs.wifi.setPower(true)
            hs.execute("/usr/local/bin/blueutil --power 1")
        end
    end
end):start()