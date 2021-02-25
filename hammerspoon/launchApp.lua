-- -------------------------------------------------------------------------- --
-- 应用快捷启动器
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
        hs.application.launchOrFocus(app)
    end)
end