-- -------------------------------------------------------------------------- --
-- 窗口管理
-- -------------------------------------------------------------------------- --

--[[
                              分割示意图

                1   2   3   4   5   6   7   8   9   x
            1 |¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|    ∧
            2 |¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|    |
            3 |¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|  height
            4 |¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|¯¯¯|    |
              ˙¯¯¯˙¯¯¯˙¯¯¯˙¯¯¯˙¯¯¯˙¯¯¯˙¯¯¯˙¯¯¯˙¯¯¯˙¯¯¯˙    ∨
              <----------------- width --------------->
--]]

-- -------------------------------------------------------------------------- --
-- 设置及函数

-- 设置屏幕分割的行数和列数，并取消边距
hs.grid.setGrid("10x4")
hs.grid.setMargins("0,0")

local windowMeta = {}

function windowMeta.new()
    local self = {}
    setmetatable(self, windowMeta)

    self.window = hs.window.focusedWindow()
    self.windowGrid = hs.grid.get(self.window)

    return self
end

-- 返回 hs.grid.set 所需参数
function gridCell(x, y, w, h)
    return hs.geometry.rect(x, y, w, h)
end

-- -------------------------------------------------------------------------- --
-- 移动窗口函数
function moveWindow(one, second)
    local windowGrid = windowMeta.new().windowGrid

    if windowGrid == one then
        hs.grid.set(windowMeta.new().window, second)
    else
        hs.grid.set(windowMeta.new().window, one)
    end
end

-- -------------------------------------------------------------------------- --
-- 移动窗口

-- 左 1/2 和 3/5
hs.hotkey.bind(hyper, "H", function()
    moveWindow(gridCell(0,0,5,4), gridCell(0,0,3,4))
end)

-- 左上 1/4 和 左下 1/4
hs.hotkey.bind(hyper, "J", function()
    moveWindow(gridCell(0,0,5,2), gridCell(0,2,5,2))
end)

-- 右 1/2 和 3/5
hs.hotkey.bind(hyper, "L", function()
    moveWindow(gridCell(5,0,5,4), gridCell(7,0,3,4))
end)

-- 右上 1/4 和 右下 1/4
hs.hotkey.bind(hyper, "K", function()
    moveWindow(gridCell(5,0,5,2), gridCell(5,2,5,2))
end)

-- 左上 1/6 和 左下 1/6
hs.hotkey.bind(hypers, "J", function()
    moveWindow(gridCell(0,0,3,2), gridCell(0,2,3,2))
end)

-- 右上 1/6 和 右下 1/6
hs.hotkey.bind(hypers, "K", function()
    moveWindow(gridCell(7,0,3,2), gridCell(7,2,3,2))
end)

-- 居中
hs.hotkey.bind(hyper, "C", function()
    moveWindow(gridCell(3,1,4,2), gridCell(3,0,4,4))
end)

-- 最大化
hs.hotkey.bind(hyper, "z", function()
    hs.grid.maximizeWindow()
end)

-- 全屏
hs.hotkey.bind(hyper, "F", function()
    windowMeta.new().window:toggleFullScreen()
end)