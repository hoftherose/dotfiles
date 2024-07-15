-- To run this script without installing the library, set GI_TYPELIB_PATH and LD_LIBRARY_PATH to the build/src directory
-- GI_TYPELIB_PATH=build/src LD_LIBRARY_PATH=build/src luajit examples/simple-example.lua

-- For GTK4 Layer Shell to get linked before libwayland-client we must explicitly load it before importing with lgi
-- local ffi = require("ffi")
-- ffi.cdef[[
--     void *dlopen(const char *filename, int flags);
-- ]]
-- ffi.C.dlopen("libgtk4-layer-shell.so", 0x101)
-- NOTES> Could not get ffi to work properly (between testing various versions and multiple compiles of differente libraries)
-- Instead to make this work, clone lgi (https://github.com/lgi-devs/lgi) and make using lua 5.3+ (only versions I could get to work)
-- For ease of use, I copied build/src to /usr/lib and the remaining command to run this is as shown below
-- LD_PRELOAD=/usr/lib/libgtk4-layer-shell.so GI_TYPELIB_PATH=/usr/lib lua examples/simple-example.lua

-- Now open the library normally with LGI
local lgi = require("lgi")
local Gtk = lgi.require("Gtk", "4.0")
local layer_shell = lgi.require("Gtk4LayerShell")
local app = Gtk.Application {
    application_id = "com.github.a-cloud-ninja.gtk4-layer-shell.lua-example",
}

function app:on_startup()
    Gtk.ApplicationWindow({
        application = self,
        default_width = 400,
        default_height = 400,
    })
end

function app:on_activate()
    layer_shell.init_for_window(self.active_window)
    layer_shell.set_layer(self.active_window, layer_shell.Layer.BOTTOM)
    layer_shell.set_anchor(self.active_window, layer_shell.Edge.BOTTOM, true)
    layer_shell.set_exclusive_zone(self.active_window, 0)
    local img = Gtk.Image({
        visible = true, file = "icon.png"
    })
    self.active_window:set_child(img)
    self.active_window:present()
end
app:run()
