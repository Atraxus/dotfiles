-- Hyprland Lua config (migrated from hyprlang for 0.55+)
-- https://wiki.hypr.land/Configuring/Start/

--------------------
---- MONITORS ----
--------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Preferred/auto for the default monitor; specific configs sourced externally.
-- NOTE: "source" becomes require() in Lua. Your monitors.conf and workspaces.conf
-- still use hyprlang syntax — migrate those separately, or keep them as .conf
-- files if Hyprland still loads them. If not, you'll need to translate them too.
-- require("monitors")
-- require("workspaces")
require("monitors")

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal   = "alacritty"
local fileManager = "dolphin"
local menu       = "wofi --show drun --gtk-dark --allow-images --insensitive --style ~/.config/wofi/style.css"
local lock       = "hyprlock"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("udiskie")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("dbus-update-activation-environment --systemd GNOME_KEYRING_CONTROL")
    -- For dark mode (runs once at start, not on every reload like exec did)
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'")
    hl.exec_cmd("wl-paste --watch cliphist store")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE",                 "24")
hl.env("HYPRCURSOR_SIZE",              "24")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("QT_QPA_PLATFORMTHEME",         "qt6ct")

-- Proxy settings for work (uncomment if needed):
-- hl.env("http_proxy",  "http://http-proxy.helmholtz-berlin.de:3128")
-- hl.env("https_proxy", "http://http-proxy.helmholtz-berlin.de:3128")
-- hl.env("HTTP_PROXY",  "http://http-proxy.helmholtz-berlin.de:3128")
-- hl.env("HTTPS_PROXY", "http://http-proxy.helmholtz-berlin.de:3128")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 0,
        gaps_out = 0,
        border_size = 2,
        col = {
            active_border   = { colors = {"rgba(d14eeabb)", "rgba(6300ffbb)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = 1,
        rounding_power = 2,
        active_opacity   = 1.0,
        inactive_opacity = 0.9,
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
            -- ignore_window removed: this is now the default in 0.55
        },
        blur = {
            enabled   = false,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Curves
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1.0}  } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Animations
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default"      })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick"        })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- Layouts
hl.config({
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
})

-- Misc
hl.config({
    misc = {
        force_default_wallpaper = 1,
        disable_hyprland_logo   = false,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,de",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:win_space_toggle, caps:escape",
        kb_rules   = "",
        follow_mouse  = 1,
        sensitivity   = 0,
        accel_profile = "flat",
        touchpad = {
            natural_scroll = true,
        },
        repeat_delay = 250,
        repeat_rate  = 40,
    },
})

-- Per-device config
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod  = "SUPER"
local shiftMod = "SUPER + SHIFT"
local ctrlMod  = "SUPER + CTRL"

hl.bind(mainMod .. " + code:36",   hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",         hl.dsp.window.close())
hl.bind(mainMod .. " + M",         hl.dsp.exec_cmd(lock))
hl.bind(shiftMod .. " + M",        hl.dsp.exit())
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + R",         hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo())
hl.bind(shiftMod .. " + C", function()
    hl.dispatch(hl.dsp.exec_cmd("logseq-clip"))
end)

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down"  }))

-- Move windows
hl.bind(shiftMod .. " + H", hl.dsp.window.move({ direction = "left"  }))
hl.bind(shiftMod .. " + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(shiftMod .. " + K", hl.dsp.window.move({ direction = "up"    }))
hl.bind(shiftMod .. " + J", hl.dsp.window.move({ direction = "down"  }))

-- Resize windows
hl.bind(shiftMod .. " + right", hl.dsp.window.resize({ x =  40, y =   0, relative = true }), { repeating = true })
hl.bind(shiftMod .. " + left",  hl.dsp.window.resize({ x = -40, y =   0, relative = true }), { repeating = true })
hl.bind(shiftMod .. " + up",    hl.dsp.window.resize({ x =   0, y = -40, relative = true }), { repeating = true })
hl.bind(shiftMod .. " + down",  hl.dsp.window.resize({ x =   0, y =  40, relative = true }), { repeating = true })

-- Workspaces
for i = 1, 9 do
    hl.bind(mainMod  .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(shiftMod .. " + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod  .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(shiftMod .. " + 0", hl.dsp.window.move({ workspace = 10 }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + equal", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + minus", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Screenshot
hl.bind("PRINT",           hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(shiftMod .. " + S", hl.dsp.exec_cmd("hyprshot -m region"))

-- Move/resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia / brightness keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),         { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),   { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),   { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),     { locked = true })

-- Lock on lid open
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd(lock .. " --immediate"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Ignore maximize requests from apps
hl.window_rule({
    name           = "suppress-maximize",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix XWayland dragging issues
hl.window_rule({
    name       = "fix-xwayland-drags",
    match      = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus   = true,
})
