-- -------------------------------------------------------------------------- --
-- 模拟键盘输入（F17 键由 Karabiner-Elements 映射）

hs.hotkey.bind("", "f17", function()
    hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)