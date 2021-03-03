-- -------------------------------------------------------------------------- --
-- 在输入法改变时进行提示

hs.keycodes.inputSourceChanged(function()

    local currentSourceID = hs.keycodes.currentSourceID()

    -- 如果当前 SourceID 和上一 SourceID 相同，不进行提示
    if currentSourceID == lastSourceID then
        return
    end

    -- 提示当前输入法
    if (currentSourceID == "com.apple.keylayout.ABC") then
        sourcePrompt = "ABC"
    elseif (currentSourceID == "com.apple.inputmethod.SCIM.Shuangpin") then
        sourcePrompt = "双拼"
    elseif (currentSourceID == "com.apple.inputmethod.SCIM.ITABC") then
        sourcePrompt = "拼音"
    end

    lastSourceID = currentSourceID
    hs.alert.show(sourcePrompt, 0.8)
end)