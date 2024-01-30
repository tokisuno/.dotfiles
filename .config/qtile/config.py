# - tokisuno config
import os
import subprocess

# literally haven't used these once
# import wttr
# import spotify

from libqtile import qtile
from libqtile import bar, layout, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

# qtile-extras-git from AUR
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.widget.decorations import PowerLineDecoration

mod = 'mod1'
file_manager = 'thunar'
popup = '/'
browser = 'firefox'
email = 'thunderbird'
# password = "bitwarden-desktop"
# ----------------- #
# Bindings/Mappings #
# ----------------- #

keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.shrink(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.reset(), desc="Reset all window sizes"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggles fullscren"),
    Key([mod], "space", lazy.window.toggle_floating()),
    Key([mod], "s", lazy.next_screen(), desc="toggles screen"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    # Attaching to tmux sessions
    Key([mod], "y", lazy.spawn('bash -c "kitty -e tmux attach-session -t term"'), desc="Launch terminal"),
    Key([mod], "u", lazy.spawn('bash -c "kitty -e tmux attach-session -t alt-term"'), desc="Launch terminal"),
    Key([mod], "d", lazy.spawn(os.path.expanduser("~/.local/share/scripts/script_launcher")), desc="launch scriopt launcher"),

    # Launching programs
    Key([mod], "c", lazy.spawn(file_manager), desc="Launch file manager"),
    Key([mod], "e", lazy.spawn('bash -c "emacs --init-directory ~/.config/emacs"'), desc="Launch file manager"),
    Key([mod], "p", lazy.spawn('rofi -modes "drun,run" -show drun'), desc="Launch rofi"),
    Key([mod], "w", lazy.spawn(browser), desc="Launch browser"),
    Key([mod, "control"], "f", lazy.spawn(email), desc="Spawn email"),
    Key([mod, "control", "shift"], "s", lazy.spawn("systemctl suspend"), desc="suspends system"),
    Key([], "Print", lazy.spawn("flameshot gui")),
    Key([mod], "i", lazy.spawn("zathura ~/Sync/university/ipa.pdf")),
    Key([mod], "o", lazy.spawn(os.path.expanduser("sxiv ~/Sync/backgrounds/roles.png"), shell=True)),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),


    # Laptop/Volume Mappings
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%"), desc="Lower Volume by 5%"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%"), desc="Raise Volume by 5%"),

    Key([mod], "minus", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%"), desc="Lower Volume by 5%"),
    Key([mod], "plus", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%"), desc="Raise Volume by 5%"),

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
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ])
groups.append(ScratchPad('scratchpad', [
    DropDown('mixer', 'pavucontrol', width=0.4, x=0.3, y=0.2),
    DropDown('kanji', 'tagainijisho', width=0.3, height=0.7, x=0.7, y=0.3, on_focus_lost_hide=False),
    ]))
keys.extend([
    Key([mod], "v", lazy.group['scratchpad'].dropdown_toggle('mixer')),
    Key([mod], "m", lazy.group['scratchpad'].dropdown_toggle('kanji')),
    ])

# ------------ #
# LAYOUT STUFF #
# ------------ #
def init_layout_theme():
    return {"margin": 12,
            "border_width": 2,
            "border_focus": "#85b4ea",
            "border_normal": "#7c818c"}

layout_theme = init_layout_theme()

def init_vert_layout():
    return{"margin": 6,
           "border_width": 2,
           "border_focus": "#85b4ea",
           "border_normal": "#7c818c"}

vert_theme = init_vert_layout()

layouts = [
    layout.MonadTall(**layout_theme),
    layout.VerticalTile(**vert_theme),
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
        PowerLineDecoration()
    ]}

widget_defaults = dict(
    font="JetBrains Mono Nerd Font",
    fontsize=14,
    padding=2,
    background="#111111")

extension_defaults = widget_defaults.copy()
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.CurrentLayout(),
                widget.Sep(),
                widget.GroupBox(
                    center_aligned=True,
                    borderwidth=2,
                    active="#a8a8a8",
                    highlight_color="#1f1f1f",
                    highlight_method="text",
                    this_current_screen_border="#d1d1d1",
                ),
                widget.Prompt(),
                widget.Sep(),
                widget.WindowName(markup=True),
                widget.Sep(),
                widget.Systray(),
                widget.Sep(),
                widget.Clock(format="%Y-%m-%d %H:%M"),
                widget.Sep(),
                widget.UPowerWidget(),
            ],
            23, background=["#E3CBA7"]
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
bring_front_click = True
wmname = "cringe"
cursor_warp = False
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
