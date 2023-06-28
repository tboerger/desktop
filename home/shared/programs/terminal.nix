{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.terminal;

in
{
  options = {
    profile = {
      programs = {
        terminal = {
          enable = mkEnableOption "Terminal";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      file = {
        ".var/app/com.raggesilver.BlackBox/config/glib-2.0/settings/keyfile".text = ''
          [com/raggesilver/BlackBox]
          hide-single-tab=true
          headerbar-draw-line-single-tab=true
          theme-dark='Solarized Dark'
          scrollback-mode=1
          was-maximized=true
          cursor-shape=0
          theme-light='Solarized Dark'
          show-headerbar=true
          font='Monospace 14'
          remember-window-size=true
          style-preference=0
          stealth-single-tab=true
          show-menu-button=true
          headerbar-drag-area=false
          cursor-blink-mode=1
        '';
      };
    };

    xgd = {
      configFile = {
        "wezterm/wezterm.lua".text = ''
          local wezterm = require "wezterm";
          wezterm.add_to_config_reload_watch_list(wezterm.config_dir)

          return {
            check_for_updates = false,
            color_scheme = "Solarized Darcula",
            font_size = 14.0,

            exit_behavior = "Close",
            scrollback_lines = 100000,
            enable_scroll_bar = false,
            warn_about_missing_glyphs = false,

            keys = {
              {
                mods = "CTRL|SHIFT",
                key = "c",
                action = wezterm.action{ CopyTo="Clipboard" }
              },
              {
                mods = "CTRL|SHIFT",
                key = "v",
                action = wezterm.action{ PasteFrom="Clipboard" }
              },

              {
                mods = "CTRL",
                key = "n",
                action = "SpawnWindow"
              },
              {
                mods = "CTRL|SHIFT",
                key = "n",
                action = "SpawnWindow"
              },

              {
                mods = "CTRL",
                key = "t",
                action = wezterm.action{ SpawnTab="CurrentPaneDomain" }
              },
              {
                mods = "CTRL|SHIFT",
                key = "t",
                action = wezterm.action{ SpawnTab="CurrentPaneDomain" }
              },

              {
                mods = "CTRL",
                key = "w",
                action = wezterm.action{ CloseCurrentTab={ confirm = true } }
              },
              {
                mods = "CTRL",
                key = "f",
                action = wezterm.action{ Search={ CaseSensitiveString = "" } }
              },
              {
                mods = "CTRL",
                key = "k",
                action = wezterm.action{ ClearScrollback="ScrollbackAndViewport" }
              },
              {
                mods = "CTRL",
                key = "r",
                action = "ReloadConfiguration"
              },

              {
                mods = "CTRL",
                key = "1",
                action = wezterm.action{ ActivateTab=0 }
              },
              {
                mods = "CTRL",
                key = "2",
                action = wezterm.action{ ActivateTab=1 }
              },
              {
                mods = "CTRL",
                key = "3",
                action = wezterm.action{ ActivateTab=2 }
              },
              {
                mods = "CTRL",
                key = "4",
                action = wezterm.action{ ActivateTab=3 }
              },
              {
                mods = "CTRL",
                key = "5",
                action = wezterm.action{ ActivateTab=4 }
              },
              {
                mods = "CTRL",
                key = "6",
                action = wezterm.action{ ActivateTab=5 }
              },
              {
                mods = "CTRL",
                key = "7",
                action = wezterm.action{ ActivateTab=6 }
              },
              {
                mods = "CTRL",
                key = "8",
                action = wezterm.action{ ActivateTab=7 }
              },
              {
                mods = "CTRL",
                key = "9",
                action = wezterm.action{ ActivateTab=-1 }
              },

              {
                mods = "CTRL",
                key = "PageUp",
                action = wezterm.action{ ActivateTabRelative=-1 }
              },
              {
                mods = "CTRL",
                key = "PageDown",
                action = wezterm.action{ ActivateTabRelative=1 }
              },
              {
                mods = "CTRL",
                key = "Tab",
                action = wezterm.action{ ActivateTabRelative=1 }
              },

              {
                mods = "CTRL|SHIFT",
                key = "PageUp",
                action = wezterm.action{ MoveTabRelative=-1 }
              },
              {
                mods = "CTRL|SHIFT",
                key = "PageDown",
                action = wezterm.action{ MoveTabRelative=1 }
              },

              {
                mods = "SHIFT",
                key = "PageUp",
                action = wezterm.action{ ScrollByPage=-1 }
              },
              {
                mods = "SHIFT",
                key = "PageDown",
                action = wezterm.action{ ScrollByPage=1 }
              },

              {
                mods = "ALT",
                key = "Enter",
                action = "ToggleFullScreen"
              },

              {
                mods = "CTRL",
                key = "-",
                action = "DecreaseFontSize"
              },
              {
                mods = "CTRL",
                key = "+",
                action = "IncreaseFontSize"
              },
              {
                mods = "CTRL",
                key = "0",
                action = "ResetFontSize"
              }
            }
          }
        '';
      };
    };
  };
}
