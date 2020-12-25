-- -------------------------------------------------------------------------- --
-- 应用快捷启动器

-- 主要功能：
--     1. 应用在前台时，隐藏应用；
--     2. 应用在后台时，切换到前台；
--     3. 应用未启动时，启动应用；

-- -------------------------------------------------------------------------- --

-- 应用列表
local applist = {
    -- Q、W、E、R、T
    w = "WeChat",
    r = "CodeRunner",
    t = "Things3",
    -- A、S、D、F、G
    a = "Typora",
    s = "Safari",
    d = "DingTalk",
    f = "Finder",
    -- Z、X、C、V、B
    c = "Google Chrome",
    v = "Visual Studio Code",
    -- Y、U、I、O、P
    y = "WorkFlowy",
    i = "iTerm",
    -- H、J、K、L
    -- N、M
    m = "MWeb",
}

-- 启动模块
for key, app in pairs(applist) do
    hs.hotkey.bind("option", key, function()
        local appName = hs.application(app)
        if appName and appName:isFrontmost() then
            appName:hide()
        else
            hs.application.launchOrFocus(app)
        end
    end)
end