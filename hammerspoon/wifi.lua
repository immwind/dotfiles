-- -------------------------------------------------------------------------- --
-- 根据当前连接 Wi-Fi 进行指定操作
--
-- 注：
--   因为 HS 无法正确获取系统变量，因此截取最后二位进行匹配。

local workWiFi = "ee"
local homeWiFi = "io"

local appLists = {
    WeChat = "微信",
    DingTalk = "钉钉",
}

-- 判断指定 APP 是否运行，如果未运行，则运行
function launchApp()
    for app, process in pairs(appLists) do
        local getApp = hs.application.get(process)
        if not getApp then
            hs.application.launchOrFocus(app)
            hs.notify.show(process, "已成功运行", "")
        end
    end
end

-- 判断指定 APP 是否运行，如果已运行，则退出
function killApp()
    for app, process in pairs(appLists) do
        local getApp = hs.application.get(process)
        if getApp then
            getApp:kill()
            hs.notify.show(process, "已成功被 Kill", "")
        end
    end
end

-- 根据当前网络连接 Wi-F 进行操作
wifiWatcher = hs.wifi.watcher.new(function()
    local currWiFi = string.sub(hs.wifi.currentNetwork(), -2)

    if currWiFi == workWiFi then
        launchApp()
    elseif currWiFi == homeWiFi then
        killApp()
    end
end)

wifiWatcher:start()