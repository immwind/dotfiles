-- -------------------------------------------------------------------------- --
-- 在切换输入法时进行提示

hs.keycodes.inputSourceChanged(function()

    local currentSourceID = hs.keycodes.currentSourceID()

    -- 如果当前 SourceID 和上一 SourceID 相同，不进行提示
    if currentSourceID == lastSourceID then
        return
    end

    -- 提示当前输入法
    if (currentSourceID == "com.apple.keylayout.ABC") then
        showUUID = hs.alert.show("ABC", 0.8)
    elseif (currentSourceID == "com.apple.inputmethod.SCIM.Shuangpin") then
        showUUID = hs.alert.show("双拼", 0.8)
    elseif (currentSourceID == "com.apple.inputmethod.SCIM.ITABC") then
        showUUID = hs.alert.show("拼音", 0.8)
    end

    lastSourceID = currentSourceID
end)