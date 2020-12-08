-- -------------------------------------------------------------------------- --
-- 设定 Hyper 键

hyper = {'cmd', 'alt', 'ctrl'}
hypers = {'cmd', 'alt', 'ctrl', 'shift'}

-- -------------------------------------------------------------------------- --
-- 载入模块

require "window"

-- -------------------------------------------------------------------------- --
-- 自动重载配置

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

myWatcher = hs.pathwatcher.new(
    os.getenv("HOME") .. "/.hammerspoon/", reloadConfig
):start()

hs.alert.show("Config loaded")