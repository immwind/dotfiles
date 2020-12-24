-- -------------------------------------------------------------------------- --
-- 显示器切换
--
-- ddcctl: https://github.com/kfix/ddcctl

hs.hotkey.bind(hypers, 's', function()
    local inputSource = 15

    if hs.host.localizedName() == "Surface Pro" then
        inputSource = 27
    end

    hs.execute("~/.ddcctl/ddcctl -d 1 -i " .. inputSource)
end)