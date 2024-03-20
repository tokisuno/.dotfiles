# tokisuno qtile config.py
# 2024-02-12
# description: cleaning up config

import os
import subprocess

from libqtile import (
        qtile,
        bar,
        layout,
        hook
    )
from libqtile.config import (
        Click,
        Drag,
        DropDown,
        Group,
        Key,
        Match,
        ScratchPad,
        Screen,
    )
from libqtile.lazy import lazy

# qtile-extras-git from AUR
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration

mod = 'mod4'
file_manager = 'thunar'
browser = 'firefox'
# ----------------- #
# Bindings/Mappings #
# ----------------- #

keys = [
    # Change focused window
    Key([mod], "h",
        lazy.layout.left()),
    Key([mod], "l",
        lazy.layout.right()),
    Key([mod], "j",
        lazy.layout.down()),
    Key([mod], "k",
        lazy.layout.up()),
    # Move window
    Key([mod, "shift"], "h",
        lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l",
        lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up()),
    # Resize window
    Key([mod, "control"], "h",
        lazy.layout.grow()),
    Key([mod, "control"], "l",
        lazy.layout.shrink()),
    Key([mod, "control"], "j",
        lazy.layout.grow_down()),
    Key([mod, "control"], "k",
        lazy.layout.grow_up()),
    # Reset windows
    Key([mod], "n",
        lazy.layout.reset()),
    # Window toggles
    Key([mod], "f",
        lazy.window.toggle_fullscreen()),
    Key([mod], "space",
        lazy.window.toggle_floating()),
    Key([mod, "shift"], "Return",
        lazy.layout.toggle_split()),
    # Attaching to tmux sessions
    Key([mod], "y",
        lazy.spawn('bash -c "kitty -e tmux attach-session -t term"')),
    Key([mod], "u",
        lazy.spawn('bash -c "kitty -e tmux attach-session -t alt-term"')),
    # Launching programs
    Key([mod], "c",
        lazy.spawn(file_manager)),
    Key([mod], "d",
        lazy.spawn(
            os.path.expanduser("~/.local/share/scripts/script_launcher")
        )),
    Key([mod], 'period', lazy.next_screen(), desc='Next monitor'),
    Key([mod], "i",
        lazy.spawn("zathura ~/Sync/university/ipa.pdf")),
    Key([mod], "e",
        lazy.spawn('bash -c "emacs --init-directory ~/.config/emacs"')),
    Key([mod], "o",
        lazy.spawn(os.path.expanduser("sxiv ~/Sync/backgrounds/roles.png"))),
    Key([mod], "p",
        lazy.spawn('rofi -modes "drun" -show drun')),
    Key([mod], "w",
        lazy.spawn(browser)),
    Key([mod, "control", "shift"], "s",
        lazy.spawn("systemctl suspend")),
    Key([], "Print",
        lazy.spawn("flameshot gui")),
    # Toggle between different layouts as defined below
    Key([mod], "Tab",
        lazy.next_layout()),
    # Quality of life
    Key([mod], "q",
        lazy.window.kill()),
    Key([mod, "control"], "r",
        lazy.reload_config()),
    # Laptop/Desktop Volume Mappings
    Key([], "XF86AudioLowerVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%")),
    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%")),
    Key([], "XF86AudioMute",
        lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    Key([], "XF86MonBrightnessUp",
        lazy.spawn('xbacklight -inc 10')),
    Key([], "XF86MonBrightnessDown",
        lazy.spawn('xbacklight -dec 10')),
    # Bar mappings
    Key([mod], "b",
        lazy.hide_show_bar("top")),
]


# ---------- #
# WORKSPACES #
# ---------- #
groups = [Group(i) for i in "123456789"]
for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
            ),
        ])

# ----------#
# SCRACHPAD #
# ----------#
groups.append(ScratchPad('scratchpad', [
    DropDown('mixer',
             'pavucontrol',
             width=0.4, x=0.3, y=0.2, on_focus_lost_hide=False),
    DropDown('kanji',
             'tagainijisho',
             width=0.3, height=0.7, x=0.7, y=0.3, on_focus_lost_hide=False),
    ]))
keys.extend([
    Key([mod], "v",
        lazy.group['scratchpad'].dropdown_toggle('mixer')),
    ])


# ------------ #
# LAYOUT STUFF #
# ------------ #
def init_layout_theme():
    return {"margin": 13,
            "single_margin": 32,
            "border_width": 2,
            "border_focus": "#f1fa8c",
            "border_normal": "#6272a4"}


def init_focus_theme():
    return {"margin": 52,
            "border_width": 2,
            "border_focus": "#ff5555",
            "border_normal": "#cc6c6c"}


focus_theme = init_focus_theme()
layout_theme = init_layout_theme()

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**focus_theme),
    # layout.Spiral(**focus_theme),
]
# -------------------- #
# WIDGET CUSTOMIZATION #
# -------------------- #

widget_defaults = dict(
    font="Ubuntu",
    fontsize=14,
    padding=2,
    background="#1e202e")

extension_defaults = widget_defaults.copy()
screens = [
    Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayoutIcon(),
                widget.GroupBox(
                    center_aligned=True,
                    borderwidth=2,
                    active="#a8a8a8",
                    highlight_color="#44475A",
                    highlight_method="line",
                    this_current_screen_border="#d1d1d1",
                    ),
                widget.TextBox("(=^^=)>>~"),
                widget.WindowName(format='{name}!', markup=True),
                widget.CurrentLayout(fmt='<i>{}</i>', foreground="#A0A0A0"),
                widget.Systray(),
                widget.Clock(format=" %Y-%m-%d | %H:%M "),
                # widget.UPowerWidget(),
            ],
            26,
            opacity=0.85,
            background=["#1e202e"],
            border_width=[1, 1, 1, 1],
            border_color="#F8F8F2",
            margin=2,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1",
         lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3",
         lazy.window.set_size_floating()),
    Click([mod], "Button2",
          lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = True
wmname = "cringe"
cursor_warp = False
floating_layout = layout.Floating(
        border_width=0,
        border_focus="#000000",
        border_normal="#000000",
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"


# Hooks
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/startup.sh')
    subprocess.run([home])


reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
