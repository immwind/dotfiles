-- -------------------------------------------------------------------------- --
-- 在输入法改变时进行提示

hs.keycodes.inputSourceChanged(function()

    local currentSourceID = hs.keycodes.currentSourceID()

    -- 如果当前 SourceID 和上一 SourceID 相同，不进行提示
    if currentSourceID == lastSourceID then
        return
    end
    hs.alert.closeSpecific(sourcePrompt)

    if (currentSourceID == "com.apple.keylayout.ABC") then
        message = "ABC"
    elseif (currentSourceID == "im.rime.inputmethod.Squirrel.Rime") then
        message = "鼠须管"
    elseif (currentSourceID == "com.apple.inputmethod.SCIM.Shuangpin") then
        message = "双拼"
    elseif (currentSourceID == "com.apple.inputmethod.SCIM.ITABC") then
        message = "拼音"
    end

    sourcePrompt = hs.alert.show(message, 0.8)
    lastSourceID = currentSourceID

end)