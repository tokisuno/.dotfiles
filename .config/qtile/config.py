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

mod = 'mod4'
meta = 'mod1'
file_manager = 'thunar'
browser = 'firefox'
widgetbox = widget.WidgetBox(widgets=[
        widget.Systray(),
        widget.Clock(format="%Y年%m月%d日 | %H:%M")],
                             text_closed="[<]",
                             text_open="[>]")


def floating_to_front(qtile):
    w = qtile.current_window
    if w.floating:
        w.bring_to_front()

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
    Key([mod], "t",
        lazy.function(floating_to_front)),

    # Move window
    Key([mod, "shift"], "h",
        lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l",
        lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up()),

    # Window toggles
    Key([mod], "f",
        lazy.window.toggle_fullscreen()),
    Key([mod, meta], "f",
        lazy.window.toggle_floating()),

    # Terminal of choice
    Key([mod], "Return",
        lazy.spawn('kitty -e tmux')),
    Key([mod], "space",
        lazy.spawn('emacsclient -c')),

    # Launching programs
    Key([], "Print",
        lazy.spawn("flameshot gui")),
    Key([mod, "shift"], "m",
        lazy.spawn('mpv --player-operation-mode=pseudo-gui')),
    Key([mod], "s",
        lazy.spawn('firefox --new-window https://www.lifeofdiscipline.com/my-habits')),
    Key([mod], "w",
        lazy.spawn(browser)),
    Key([mod], "z",
        lazy.spawn(file_manager)),

    # Rofi stuff
    Key([mod], "p",
        lazy.spawn('rofi -modes "drun" -show drun')),
    Key([mod], "c",
        lazy.spawn('rofi -modes "calc" -show calc')),
    Key([mod], "m",
        lazy.spawn('rofi-mixer')),

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

    # Widget box hiding (distraction free)
    Key([mod], "y",
        lazy.widget["widgetbox"].toggle()),

]


# ---------- #
# WORKSPACES #
# ---------- #
# TODO: Change group names
groups = [
        Group("1", label="●", matches=[Match(wm_class="firefox")]),
        Group("2", label="●"),
        Group("3", label="●"),
        Group("4", label="●"),
        Group("5", label="●"),
        Group("6", label="●"),
        Group("7", label="●"),
        Group("8", label="●", matches=[Match(wm_class="Zotero")]),
        Group("9", label="●", matches=[Match(wm_class="Spotify")]),
        ]

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
    ]))
keys.extend([
    Key([mod], "v",
        lazy.group['scratchpad'].dropdown_toggle('mixer')),
    ])


# ------------ #
# LAYOUT STUFF #
# ------------ #
layouts = [
    layout.Spiral(name="lilgap",
                  margin=6,
                  ratio=0.6,
                  border_width=2,
                  border_focus="#FFFFFF",
                  border_normal="#2f2f2f"
                  ),

    layout.Spiral(name="gapped",
                  margin=42,
                  ratio=0.6,
                  border_width=2,
                  border_focus="#FFFFFF",
                  border_normal="#2f2f2f"
                  ),

    layout.Max(name="focus",
               margin=100,
               border_width=2,
               border_focus="#1A1A1A",
               border_normal="#2a2a2a"
               ),
]
# -------------------- #
# WIDGET CUSTOMIZATION #
# -------------------- #

widget_defaults = dict(
    font="IBM Plex Sans JP",
    fontsize=14,
    padding=4,
    background="#000000")

extension_defaults = widget_defaults.copy()
screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.WindowName(fmt='<i>{}</i>',
                                  markup=True,
                                  ),
                widget.CurrentLayout(fmt='{}', foreground="#A0A0A0"),
                widget.GroupBox(
                    center_aligned=True,
                    borderwidth=2,
                    highlight_method="text",
                    active="#666666",
                    inactive="#2a2a2a",
                    this_current_screen_border="#FFFFFF",
                ),
                widget.Spacer(),
                widget.GenPollCommand(
                    name="vpn",
                    shell=True,
                    fmt="{}", update_interval=60,
                    foreground="#A0A0A0",
                    cmd="nordvpn status | grep Status"
                ),
                widget.GenPollCommand(
                    name="vpn_country",
                    shell=True,
                    fmt="{}", update_interval=60,
                    foreground="#cc241d",
                    cmd="nordvpn status | grep Country",
                ),
                widget.Clock(format="%A!"),
                widget.GenPollText(
                    name="1440",
                    fmt="{}分", update_interval=60,
                    func=lambda: subprocess.check_output(os.path.expanduser("~/.config/qtile/goltime")).decode("utf-8")
                ),
                widgetbox,
            ],
            20,
            border_color="#4a4a4a",
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
wmname = "LG3D"
cursor_warp = True

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


@hook.subscribe.client_new
def disable_floating(window):
    rules = [
        Match(wm_class="mpv")
    ]

    if any(window.match(rule) for rule in rules):
        window.togroup(qtile.current_group.name)
        window.cmd_disable_floating()



reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
