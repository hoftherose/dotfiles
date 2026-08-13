-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- monitor=DP-2,preferred,0x0,1
-- monitor=DP-1,preferred,1920x0,1,
hl.monitor({
    output   = "DP-2",
    mode     = "preferred",
    position = "0x0",
    scale    = "1",
})
hl.monitor({
    output   = "DP-1",
    mode     = "preferred",
    position = "1920x0",
    scale    = "1",
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal      = "kitty byobu new -A -s main"
local fileManager   = "kitty yazi"
local menu          = "pkill wofi || wofi --show drun"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
    hl.exec_cmd("/home/HolyTech/.config/hypr/scripts/launch-waybar.sh && swaybg")
    hl.exec_cmd("fcitx5 -d &")
    hl.exec_cmd("waypaper --restore --backend swaybg")
    hl.exec_cmd("/usr/bin/pypr # -- debug /tmp/pypr.log")
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("nm-applet --no-agent")
    hl.exec_cmd("/home/HolyTech/.config/hypr/scripts/restart-hyprland-portal.sh")
    hl.exec_cmd("systemctl --user start wayscriber.service")
    -- hl.exec_cmd("sh /home/HolyTech/.config/hypr/scripts/conky-launch-startup.sh")
    -- hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,

        border_size = 3,

        col = {
            active_border = {
                colors = {
                    "rgba(33ccffee)",
                    "rgba(00ff99ee)",
                },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 3,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,

            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint",    { type = "bezier", points = {{0.23,1},     {0.32,1}}})
hl.curve("easeInOutCubic",  { type = "bezier", points = {{0.65,0.05},  {0.36,1}}})
hl.curve("linear",          { type = "bezier", points = {{0,0},        {1,1}}})
hl.curve("almostLinear",    { type = "bezier", points = {{0.5,0.5},    {0.75,1.0}}})
hl.curve("quick",           { type = "bezier", points = {{0.15,0},     {0.1,1}}})

hl.animation({ leaf="global", enabled=true, speed=10, bezier="default" })
hl.animation({ leaf="border", enabled=true, speed=5.39, bezier="easeOutQuint" })
hl.animation({ leaf="windows", enabled=true, speed=4.79, bezier="easeOutQuint" })
hl.animation({ leaf="windowsIn", enabled=true, speed=4.1, bezier="easeOutQuint", style="popin 87%" })
hl.animation({ leaf="windowsOut", enabled=true, speed=1.49, bezier="linear", style="popin 87%" })
hl.animation({ leaf="fadeIn", enabled=true, speed=1.73, bezier="almostLinear" })
hl.animation({ leaf="fadeOut", enabled=true, speed=1.46, bezier="almostLinear" })
hl.animation({ leaf="fade", enabled=true, speed=3.03, bezier="quick" })
hl.animation({ leaf="layers", enabled=true, speed=3.81, bezier="easeOutQuint" })
hl.animation({ leaf="layersIn", enabled=true, speed=4, bezier="easeOutQuint", style="fade" })
hl.animation({ leaf="layersOut", enabled=true, speed=1.5, bezier="linear", style="fade" })
hl.animation({ leaf="fadeLayersIn", enabled=true, speed=1.79, bezier="almostLinear" })
hl.animation({ leaf="fadeLayersOut", enabled=true, speed=1.39, bezier="almostLinear" })
hl.animation({ leaf="workspaces", enabled=true, speed=1.94, bezier="almostLinear", style="fade" })
hl.animation({ leaf="workspacesIn", enabled=true, speed=1.21, bezier="almostLinear", style="fade" })
hl.animation({ leaf="workspacesOut", enabled=true, speed=1.94, bezier="almostLinear", style="fade" })

hl.config({
    master = {
        new_status = "master",
    },
})

--------------
---- MISC ----
--------------

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "latam,jp,us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
        tablet = {
            output = "current",
        }
    }
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- TODO
-- plugin {
--     split-monitor-workspaces {
--         count = 10
--         keep_focused = 1
--         enable_notifications = 1
--         enable_persistent_workspaces = 0
--     }
-- }
--
-- xwayland {
--     force_zero_scaling = true
-- }

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "CTRL + ALT"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.window.close({}))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd(menu), { release=true })
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("looking-glass-client -F"))
-- hl.bind(mainMod .. " + =", hl.dsp.exit())

-- Application bindings
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("vesktop"))
hl.bind("PRINT"          , hl.dsp.exec_cmd("~/.config/hypr/scripts/grim.sh"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("wayscriber --daemon-toggle"))
-- hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/swaylock-text.sh"))

-- Switch and move to workspaces with mainMod + [0-9]
package.path = package.path .. ";./?.lua;./?/init.lua"
local smw = require("plugins.split-monitor-workspaces")
smw.setup({
    --- Number of workspaces assigned to each monitor.
    workspace_count = 10,

    --- Monitor priority order: determines which monitor gets the lowest workspace IDs.
    --- Monitors not listed are assigned priorities in the order Hyprland reports them.
    monitor_priority = { "DP-1", "DP-2" },

    --- Per-monitor workspace count overrides (optional).
    --- Monitors not listed fall back to workspace_count.
    -- max_workspaces = { ["DP-2"] = 3 }, -- DP-2 gets only 3 workspaces, DP-1 is not overridden and gets 5.

    --- Keep the currently focused workspace when the config is reloaded (recommended).
    -- keep_focused = true,

    --- Show a Hyprland notification on init and remap.
    -- enable_notifications = false,

    --- Keep workspaces alive even when empty.
    enable_persistent_workspaces = false,

    --- Wrap around when cycling past the first or last workspace.
    enable_wrapping = true,

    --- Switch all monitors simultaneously when changing workspaces (Gnome-style).
    -- link_monitors = false,
})

for i = 1, smw.get_amount_of_workspaces() do
    local n = tostring(i)
    if n == "10" then n = "0" end
    hl.bind(mainMod .. " +" .. n, smw.workspace(n))
    hl.bind(mainMod .. " + SHIFT +" .. n, smw.move_to_workspace(n))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + W", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("spotify"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify"))
hl.bind(mainMod .. " + O", hl.dsp.workspace.toggle_special("obsidian"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + Z", hl.dsp.workspace.toggle_special("obsidian"))

-- Toggle Magnify Plugin
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("pypr zoom ++0.5"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("pypr zoom"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", smw.cycle_workspaces("next"))
hl.bind(mainMod .. " + mouse_up", smw.cycle_workspaces("prev"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + right", smw.workspace("+1"))
hl.bind(mainMod .. " + left", smw.workspace("-1"))

-- Move window with focus with mainMod + arrow keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ monitor="-1"}))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ monitor="+1"}))

-- # One handed swap focus to another monitor
hl.bind(mainMod .. " + escape", hl.dsp.focus({ monitor="+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {mouse=true})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {mouse=true})

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { repeating = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { repeating = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { repeating = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name = "xwayland fixes",
    match = {
        class       = "^$",
        title       = "^$",
        float       = true,
        xwayland    = true,
        fullscreen  = false,
        pin         = false,
    },

    no_focus = true,
})

hl.window_rule({
    name = "ueberzugpp",
    match = {
        class = "ueberzugpp_.*",
    },
    no_anim = true,
})

