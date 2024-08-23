lib: with lib; {
  "org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    show-battery-percentage = true;
  };

  "org/gnome/desktop/peripherals/tablets/056a:5215" = {
    mapping = "absolute";
  };

  "org/gnome/desktop/wm/keybindings" = {
    close = [ "<Super>q" ];
    maximize = [ "<Shift><Super>y" ];
    minimize = [ ];
    move-to-workspace-1 = [ "<Shift><Super>u" ];
    move-to-workspace-2 = [ "<Shift><Super>i" ];
    move-to-workspace-3 = [ "<Shift><Super>o" ];
    move-to-workspace-4 = [ "<Shift><Super>n" ];
    switch-input-source = [ ];
    switch-input-source-backward = [ ];
    switch-to-workspace-1 = [ "<Super>u" ];
    switch-to-workspace-2 = [ "<Super>i" ];
    switch-to-workspace-3 = [ "<Super>o" ];
    switch-to-workspace-4 = [ "<Super>n" ];
    toggle-fullscreen = [ "<Super>y" ];
  };

  "org/gnome/settings-daemon/plugins/color" = {
    night-light-enabled = true;
  };

  "org/gnome/settings-daemon/plugins/media-keys" = {
    custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" ];
    mic-mute = [ "<Shift><Super>m" ];
    screensaver = [ ];
  };

  "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
    binding = "<Super>Return";
    command = "kitty";
    name = "Terminal";
  };

  "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
    binding = "<Super>m";
    command = "/home/davi/.local/scripts/dropdown-kitty.sh";
    name = "Dropdown Terminal";
  };

  "org/gnome/shell" = {
    disabled-extensions = [ "windowsNavigator@gnome-shell-extensions.gcampax.github.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "another-window-session-manager@gmail.com" "ddterm@amezin.github.com" ];
    enabled-extensions = [ "pop-shell@system76.com" "system-monitor@gnome-shell-extensions.gcampax.github.com" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "grand-theft-focus@zalckos.github.com" "no-overview@fthx" "caffeine@patapon.info" "appindicatorsupport@rgcjonas.gmail.com" ];
    favorite-apps = [ "org.gnome.Nautilus.desktop" "firefox.desktop" ];
    last-selected-power-profile = "performance";
    welcome-dialog-last-shown-version = "46.2";
  };

  "org/gnome/shell/app-switcher" = {
    current-workspace-only = true;
  };

  "org/gnome/shell/extensions/auto-move-windows" = {
    application-list = [ "dev.vencord.Vesktop.desktop:4" "com.spotify.Client.desktop:4" "firefox.desktop:1" "codium.desktop:2" "codium-url-handler.desktop:2" "md.obsidian.Obsidian.desktop:3" "com.discordapp.Discord.desktop:4" "chromium-browser.desktop:1" "io.dbeaver.DBeaverCommunity.desktop:2" ];
  };

  "org/gnome/shell/extensions/caffeine" = {
    duration-timer = 2;
    indicator-position-max = 1;
    inhibit-apps = [ "com.spotify.Client.desktop" ];
    screen-blank = "never";
    toggle-state = false;
    trigger-apps-mode = "on-focus";
  };

  "org/gnome/shell/extensions/pop-shell" = {
    activate-launcher = [ "<Super>d" ];
    active-hint = true;
    active-hint-border-radius = mkUint32 2;
    focus-up = [ "<Super>Up" "<Super>KP_Up" "<Super>k" ];
    fullscreen-launcher = false;
    hint-color-rgba = "rgb(0,97,230)";
    mouse-cursor-follows-active-window = false;
    pop-monitor-down = [ ];
    pop-monitor-left = [ ];
    pop-monitor-right = [ ];
    pop-monitor-up = [ ];
    pop-workspace-down = [ ];
    pop-workspace-up = [ ];
    search = [ "<Super>d" ];
    show-skip-taskbar = true;
    stacking-with-mouse = false;
    tile-by-default = true;
    tile-enter = [ "<Super>r" ];
    tile-orientation = [ "<Super>w" ];
    toggle-floating = [ "<Shift><Super>space" ];
    toggle-stacking-global = [ "<Super>s" ];
    toggle-tiling = [ "<Super>z" ];
  };

  "org/gnome/shell/extensions/system-monitor" = {
    show-download = false;
    show-swap = false;
    show-upload = false;
  };

  "org/gnome/shell/keybindings" = {
    focus-active-notification = [ ];
    toggle-message-tray = [ "<Super>v" ];
    toggle-quick-settings = [ ];
  };

  "org/gtk/gtk4/settings/file-chooser" = {
    date-format = "regular";
    location-mode = "path-bar";
    show-hidden = false;
    sidebar-width = 140;
    sort-column = "name";
    sort-directories-first = true;
    sort-order = "ascending";
    type-format = "category";
    view-type = "list";
    window-size = mkTuple [ 1207 670 ];
  };

  "org/gtk/settings/file-chooser" = {
    date-format = "regular";
    location-mode = "path-bar";
    show-hidden = false;
    show-size-column = true;
    show-type-column = true;
    sidebar-width = 157;
    sort-column = "name";
    sort-directories-first = false;
    sort-order = "ascending";
    type-format = "category";
    window-position = mkTuple [ 26 23 ];
    window-size = mkTuple [ 1231 902 ];
  };
}
