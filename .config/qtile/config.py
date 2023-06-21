
# - copy shit from my i3 config
# - profit

import os
import subprocess
import wttr

from libqtile import qtile
from libqtile import bar, layout, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

# qtile-extras-git from AUR
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.widget.decorations import PowerLineDecoration
from qtile_extras.widget.decorations import BorderDecoration

mod = 'mod1'
terminal = 'alacritty'
file_manager = 'thunar'
popup = 'rofi -modes "drun,run" -show drun'
browser = 'firefox'
email = 'thunderbird'
screenshot = "flameshot gui --path ~/photos/screenshots"
# password = "bitwarden-desktop"
# ----------------- #
# Bindings/Mappings #
# ----------------- #
keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggles fullscren"),
    Key([mod], "space", lazy.window.toggle_floating()),
    Key([mod], "s", lazy.next_screen(), desc="toggles screen"),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    # Launching programs
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "c", lazy.spawn(file_manager), desc="Launch file manager"),
    Key([mod], "d", lazy.spawn(popup), desc="Launch file manager"),
    Key([mod], "w", lazy.spawn(browser), desc="Launch browser"),
    Key([mod, "control"], "f", lazy.spawn(email), desc="Spawn email"),
    Key([mod, "control", "shift"], "s", lazy.spawn("i3lock && systemctl suspend"), desc="suspends system"),
    Key([mod], "y", lazy.spawn('alacritty -e ytfzf -t -f'), desc='launches yt client'),

    # idk why tf this doesn't work
    # Key([], "Print", lazy.spawn("flameshot gui --path ~/photos/screenshots")),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # Laptop/Volume Mappings
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%"), desc="Lower Volume by 5%"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%"), desc="Raise Volume by 5%"),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"), desc="Mute/Unmute Volume"),    # multiple stack panes
    Key([], "XF86MonBrightnessUp", lazy.spawn('xbacklight -inc 10'), desc="Raise brightness"),
    Key([], "XF86MonBrightnessDown", lazy.spawn('xbacklight -dec 10'), desc="Lower brightness"),

]

# ---------- #
# WORKSPACES #
# ---------- #
groups = [Group(i) for i in "123456789"]
for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ])
groups.append(ScratchPad('scratchpad', [
    DropDown('mixer', 'pavucontrol', width=0.4, x=0.3, y=0.2),
    DropDown('lf', 'alacritty -e lf', width=0.6, height=0.4, x=0.2, y=0.2),
    DropDown('term', terminal, width=0.5, height=0.5, x=0.25, y=0.25),
    DropDown('kanji', 'tagainijisho', width=0.3, height=0.65, x=0.6, y=0.2),
    # DropDown('pomo', 'alacritty -e qwer', width=0.6, height=0.8, x=0.2, y=0.2),
    ]))
keys.extend([
    Key([mod], "v", lazy.group['scratchpad'].dropdown_toggle('mixer')),
    Key([mod], "u", lazy.group['scratchpad'].dropdown_toggle('lf')),
    Key([mod], "p", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key([mod], "m", lazy.group['scratchpad'].dropdown_toggle('kanji')),
    # Key([mod], "o", lazy.group['scratchpad'].dropdown_toggle('pomo')),
    ])

# ------------ #
# LAYOUT STUFF #
# ------------ #
def init_layout_theme():
    return {"margin": 16,
            "border_width": 2,
            "border_focus": "#EFDF00",
            "border_normal": "#474200"}

layout_theme = init_layout_theme()
floating_layout = layout.Floating(
    border_width=0,
    border_focus="#000000",
    border_normal="#000000",
)
layouts = [
    layout.MonadTall(**layout_theme),
    layout.Columns(margin = [16, 8, 8, 8], 
                   border_width=2, 
                   border_focus="EFDF00",
                       border_normal="#474200"),
    layout.Max(),
]
# -------------------- #
# WIDGET CUSTOMIZATION #
# -------------------- #
decor = {
    "decorations": [
        RectDecoration(colour="#600060", radius=10, filled=True, padding_y=5)
    ],
    "padding": 18,
}
powerline = {
    "decorations": [
        RectDecoration(use_widget_background=True, padding_y=5, filled=True, radius=0),
        PowerLineDecoration(path="arrow_right", padding_y=5)
    ]}
weather = dict(
    update_interval=60,
    metric=True,
    format='{condition_text} {condition_temp}°')

widget_defaults = dict(
    font="JetBrains Mono Nerd Font",
    fontsize=12,
    padding=3,
    background="#1d2021")

extension_defaults = widget_defaults.copy()
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox("(～￣▽￣)～"),
                widget.GroupBox(
                    highlight_color='#383838',
                    highlight_method='line',
                ),
                widget.Prompt(),
                widget.TextBox("[]="),
                widget.WindowName(markup=True, background='#333333'),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # widget.TextBox(":D", name="default"),
                widget.Sep(),
                widget.Wttr(
                    lang='en',
                    location={'Hamilton, Ontario': 'Uni'},
                    format='%l: %C, temp: %t, feels: %f',
                    units='m',
                    update_interval=30,
                    decorations = [
                        BorderDecoration(
                            colour = "#ff6f6f",
                            border_width = [0, 0, 2, 0],
                            padding_x = 5,
                            padding_y = None,
                        )
                    ],
                ),
                widget.Sep(),
                widget.PulseVolume(fmt='vol:{}', update_interval=0.5, padding=5, 
                                decorations = [
                                BorderDecoration(
                                     colour = "#458588",
                                     border_width = [0, 0, 2, 0],
                                     padding_x = 5,
                                     padding_y = None,
                                 )
                             ],
                         ),
                widget.Sep(),
                widget.Net(
                    decorations = [
                        BorderDecoration(
                            colour = "#689d6a",
                            border_width = [0, 0, 2, 0],
                            padding_x = 5,
                            padding_y = None,
                        )
                    ],
                ),
                widget.Sep(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %Hh%M"),
                widget.CurrentLayoutIcon(),
                # widget.QuickExit(),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
floating_layout = layout.Floating(
        border_width=0,
        border_focus="#000000",
        border_normal="#000000",
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
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
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.run([home])

reconfigure_screens = True
auto_minimize = True
wl_input_rules = None

wmname = "LG3D"
