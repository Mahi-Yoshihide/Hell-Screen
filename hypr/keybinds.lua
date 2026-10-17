
---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Aplicativos
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Z", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(navegador))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

hl.bind(mainMod .. " + SHIFT + W",
    hl.dsp.exec_cmd(
        "kitty --class=wallpaper-picker --title=WallpaperPicker --override close_on_child_death=always -e ~/.local/bin/wallpaper-picker"
    ))

    -- Janelas
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Alternar entre janelas com Alt + Tab
hl.bind("ALT + TAB", hl.dsp.exec_cmd(
    "hyprctl dispatch cyclenext && hyprctl dispatch bringactivetotop"
))

-- Captura de tela: Ctrl + Shift + S
hl.bind("CTRL + SHIFT + S", hl.dsp.exec_cmd(
    "mkdir -p ~/Imagens/Screenshots && grim -g \"$(slurp)\" ~/Imagens/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png"
))

-- Mover o foco entre janelas
hl.bind(mainMod .. " + LEFT",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + UP",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + DOWN",  hl.dsp.focus({ direction = "down" }))

-- Workspaces 1–10
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i }))
end

-- Workspace especial
hl.bind(mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S",
    hl.dsp.window.move({ workspace = "special:magic" }))

-- Navegação de workspaces com a rodinha do mouse
hl.bind(mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" }))

-- Arrastar e redimensionar janelas com o mouse
hl.bind(mainMod .. " + mouse:272",
    hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273",
    hl.dsp.window.resize(), { mouse = true })

-- Áudio
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })

-- Brilho
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true })

-- Controles de mídia (playerctl)
hl.bind("XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Encerrar a sessão
hl.bind(mainMod .. " + M",
    hl.dsp.exec_cmd("hyprctl dispatch exit"))
