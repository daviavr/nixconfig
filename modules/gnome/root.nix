homeLib: with homeLib;
let
  scaling = "['scale-monitor-framebuffer']";
in
{
  "apps/seahorse/listing" = {
    keyrings-selected = [ "openssh:///home/davi/.ssh" ];
  };

  "ca/desrt/dconf-editor" = {
    saved-pathbar-path = "/org/gnome/desktop/wm/keybindings/always-on-top";
    saved-view = "/org/gnome/desktop/wm/keybindings/";
    show-warning = false;
    window-height = 1057;
    window-is-maximized = false;
    window-width = 1012;
  };

  "org/fedoraproject/FirewallConfig" = {
    show-active-bindings = true;
    show-ipsets = true;
  };

  "org/gnome/Console" = {
    last-window-maximised = false;
    last-window-size = mkTuple [ 838 1104 ];
  };

  "org/gnome/Extensions" = {
    window-height = 828;
    window-maximized = false;
    window-width = 1159;
  };

  "org/gnome/TextEditor" = {
    last-save-directory = "file:///home/davi/Desktop/router";
  };

  "org/gnome/Totem" = {
    active-plugins = [ "vimeo" "variable-rate" "skipto" "screenshot" "screensaver" "save-file" "rotation" "recent" "movie-properties" "open-directory" "mpris" "autoload-subtitles" "apple-trailers" ];
    subtitle-encoding = "UTF-8";
  };

  "org/gnome/boxes" = {
    first-run = false;
    view = "icon-view";
    window-maximized = false;
  };

  "org/gnome/calculator" = {
    accuracy = 9;
    angle-units = "degrees";
    base = 10;
    button-mode = "basic";
    number-format = "automatic";
    show-thousands = false;
    show-zeroes = false;
    source-currency = "";
    source-units = "degree";
    target-currency = "";
    target-units = "radian";
    window-maximized = false;
    window-size = mkTuple [ 360 856 ];
    word-size = 64;
  };

  "org/gnome/clocks/state/window" = {
    maximized = false;
    panel-id = "timer";
    size = mkTuple [ 701 507 ];
  };

  "org/gnome/control-center" = {
    last-panel = "wifi";
    window-state = mkTuple [ 1263 835 false ];
  };

  "org/gnome/desktop/a11y/applications" = {
    screen-keyboard-enabled = false;
    screen-reader-enabled = false;
  };

  "org/gnome/desktop/a11y/keyboard" = {
    enable = false;
  };

  "org/gnome/desktop/app-folders" = {
    folder-children = [ "Utilities" "YaST" "Pardus" ];
  };

  "org/gnome/desktop/app-folders/folders/Pardus" = {
    categories = [ "X-Pardus-Apps" ];
    name = "X-Pardus-Apps.directory";
    translate = true;
  };

  "org/gnome/desktop/app-folders/folders/Utilities" = {
    apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
    categories = [ "X-GNOME-Utilities" ];
    name = "X-GNOME-Utilities.directory";
    translate = true;
  };

  "org/gnome/desktop/app-folders/folders/YaST" = {
    categories = [ "X-SuSE-YaST" ];
    name = "suse-yast.directory";
    translate = true;
  };

  "org/gnome/desktop/background" = {
    color-shading-type = "solid";
    picture-options = "zoom";
    picture-uri = "file:///home/davi/.local/share/backgrounds/astro.jpg";
    picture-uri-dark = "file:///home/davi/.local/share/backgrounds/astro.jpg";
    primary-color = "#000000000000";
    secondary-color = "#000000000000";
  };

  "org/gnome/desktop/input-sources" = {
    show-all-sources = false;
    sources = [ (mkTuple [ "xkb" "br" ]) ];
  };

  "org/gnome/desktop/interface" = {
    accent-color = "blue";
    color-scheme = "prefer-dark";
    cursor-theme = "Adwaita";
    gtk-theme = "Adwaita";
    icon-theme = "Adwaita";
    show-battery-percentage = true;
    toolkit-accessibility = false;
  };

  "org/gnome/desktop/notifications" = {
    application-children = [ "org-gnome-console" "dev-vencord-vesktop" "org-gnome-nautilus" "chromium" "com-spotify-client" "gnome-power-panel" "org-gnome-tweaks" "org-gnome-texteditor" "com-google-chrome" "org-prismlauncher-prismlauncher" "code" "xdg-desktop-portal-gnome" "org-gnome-clocks" "org-gnome-boxes" "com-calibre-ebook-calibre" "org-gnome-settings" "steam" "org-gnome-extensions" "com-discordapp-discordcanary" "thorium-browser" "org-gnome-software" "com-github-ismaelmartinez-teams-for-linux" "com-discordapp-discord" ];
  };

  "org/gnome/desktop/notifications/application/chromium" = {
    application-id = "chromium.desktop";
  };

  "org/gnome/desktop/notifications/application/code" = {
    application-id = "code.desktop";
  };

  "org/gnome/desktop/notifications/application/com-calibre-ebook-calibre" = {
    application-id = "com.calibre_ebook.calibre.desktop";
  };

  "org/gnome/desktop/notifications/application/com-discordapp-discord" = {
    application-id = "com.discordapp.Discord.desktop";
  };

  "org/gnome/desktop/notifications/application/com-discordapp-discordcanary" = {
    application-id = "com.discordapp.DiscordCanary.desktop";
  };

  "org/gnome/desktop/notifications/application/com-github-ismaelmartinez-teams-for-linux" = {
    application-id = "com.github.IsmaelMartinez.teams_for_linux.desktop";
  };

  "org/gnome/desktop/notifications/application/com-google-chrome" = {
    application-id = "com.google.Chrome.desktop";
  };

  "org/gnome/desktop/notifications/application/com-spotify-client" = {
    application-id = "com.spotify.Client.desktop";
  };

  "org/gnome/desktop/notifications/application/dev-vencord-vesktop" = {
    application-id = "dev.vencord.Vesktop.desktop";
  };

  "org/gnome/desktop/notifications/application/gnome-power-panel" = {
    application-id = "gnome-power-panel.desktop";
  };

  "org/gnome/desktop/notifications/application/org-gnome-boxes" = {
    application-id = "org.gnome.Boxes.desktop";
  };

  "org/gnome/desktop/notifications/application/org-gnome-clocks" = {
    application-id = "org.gnome.clocks.desktop";
  };

  "org/gnome/desktop/notifications/application/org-gnome-console" = {
    application-id = "org.gnome.Console.desktop";
  };

  "org/gnome/desktop/notifications/application/org-gnome-extensions" = {
    application-id = "org.gnome.Extensions.desktop";
  };

  "org/gnome/desktop/notifications/application/org-gnome-fileroller" = {
    application-id = "org.gnome.FileRoller.desktop";
  };

  "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
    application-id = "org.gnome.Nautilus.desktop";
  };

  "org/gnome/desktop/notifications/application/org-gnome-settings" = {
    application-id = "org.gnome.Settings.desktop";
  };

  "org/gnome/desktop/notifications/application/org-gnome-software" = {
    application-id = "org.gnome.Software.desktop";
  };

  "org/gnome/desktop/notifications/application/org-gnome-texteditor" = {
    application-id = "org.gnome.TextEditor.desktop";
  };

  "org/gnome/desktop/notifications/application/org-gnome-tweaks" = {
    application-id = "org.gnome.tweaks.desktop";
  };

  "org/gnome/desktop/notifications/application/org-prismlauncher-prismlauncher" = {
    application-id = "org.prismlauncher.PrismLauncher.desktop";
  };

  "org/gnome/desktop/notifications/application/steam" = {
    application-id = "steam.desktop";
  };

  "org/gnome/desktop/notifications/application/thorium-browser" = {
    application-id = "thorium-browser.desktop";
  };

  "org/gnome/desktop/notifications/application/xdg-desktop-portal-gnome" = {
    application-id = "xdg-desktop-portal-gnome.desktop";
  };

  "org/gnome/desktop/peripherals/tablets/056a:5215" = {
    mapping = "absolute";
  };

  "org/gnome/desktop/peripherals/touchpad" = {
    two-finger-scrolling-enabled = true;
  };

  "org/gnome/desktop/screensaver" = {
    color-shading-type = "solid";
    picture-options = "zoom";
    picture-uri = "file:///home/davi/.local/share/backgrounds/2025-02-02-23-57-51-gruvbox_astro.jpg";
    primary-color = "#000000000000";
    secondary-color = "#000000000000";
  };

  "org/gnome/desktop/sound" = {
    allow-volume-above-100-percent = false;
  };

  "org/gnome/desktop/wm/keybindings" = {
    close = [ "<Super>q" "<Alt>F4" ];
    maximize = [ ];
    minimize = [ "<Super>n" ];
    move-to-monitor-down = [ ];
    move-to-monitor-left = [ ];
    move-to-monitor-right = [ ];
    move-to-monitor-up = [ ];
    move-to-workspace-1 = [ "<Shift><Super>u" ];
    move-to-workspace-2 = [ "<Shift><Super>i" ];
    move-to-workspace-3 = [ "<Shift><Super>o" ];
    move-to-workspace-4 = [ "<Shift><Super>p" ];
    move-to-workspace-5 = [ "<Shift><Super>m" ];
    move-to-workspace-6 = [ "<Shift><Super>minus" ];
    move-to-workspace-7 = [ "<Shift><Super>comma" ];
    move-to-workspace-8 = [ "<Shift><Super>period" ];
    move-to-workspace-down = [ ];
    move-to-workspace-last = [ "<Shift><Super>apostrophe" ];
    move-to-workspace-up = [ ];
    show-desktop = [ "<Shift><Super>n" ];
    switch-applications = [ ];
    switch-applications-backward = [ ];
    switch-group = [ ];
    switch-group-backward = [ ];
    switch-input-source = [ ];
    switch-input-source-backward = [ ];
    switch-to-workspace-1 = [ "<Super>u" ];
    switch-to-workspace-2 = [ "<Super>i" ];
    switch-to-workspace-3 = [ "<Super>o" ];
    switch-to-workspace-4 = [ "<Super>p" ];
    switch-to-workspace-5 = [ "<Super>m" ];
    switch-to-workspace-6 = [ "<Super>minus" ];
    switch-to-workspace-7 = [ "<Super>period" ];
    switch-to-workspace-8 = [ "<Super>comma" ];
    switch-to-workspace-down = [ "<Primary><Super>Down" "<Primary><Super>j" ];
    switch-to-workspace-last = [ "<Super>Escape" ];
    switch-to-workspace-left = [ ];
    switch-to-workspace-right = [ ];
    switch-to-workspace-up = [ "<Primary><Super>Up" "<Primary><Super>k" ];
    switch-windows = [ "<Alt>Tab" ];
    switch-windows-backward = [ "<Shift><Alt>Tab" ];
    toggle-fullscreen = [ "<Super>y" ];
    unmaximize = [ ];
  };

  "org/gnome/desktop/wm/preferences" = {
    button-layout = "close:appmenu";
    num-workspaces = 10;
    resize-with-right-button = true;
  };

  "org/gnome/epiphany" = {
    ask-for-default = false;
  };

  "org/gnome/epiphany/state" = {
    is-maximized = false;
    window-size = mkTuple [ 1024 768 ];
  };

  "org/gnome/evince/default" = {
    continuous = true;
    dual-page = false;
    dual-page-odd-left = false;
    enable-spellchecking = true;
    fullscreen = false;
    inverted-colors = false;
    show-sidebar = true;
    sidebar-page = "thumbnails";
    sidebar-size = 148;
    sizing-mode = "free";
    window-ratio = mkTuple [ 2.3046428811395554 1.0571075636640062 ];
    zoom = 0.6965703475199996;
  };

  "org/gnome/evolution-data-server" = {
    migrated = true;
  };

  "org/gnome/file-roller/dialogs/extract" = {
    height = 949;
    recreate-folders = true;
    skip-newer = false;
    width = 1362;
  };

  "org/gnome/file-roller/file-selector" = {
    show-hidden = false;
    sidebar-size = 300;
    sort-method = "name";
    sort-type = "ascending";
    window-size = mkTuple [ (-1) (-1) ];
  };

  "org/gnome/file-roller/listing" = {
    list-mode = "as-folder";
    name-column-width = 526;
    show-path = false;
    sort-method = "name";
    sort-type = "ascending";
  };

  "org/gnome/file-roller/ui" = {
    sidebar-width = 200;
    window-height = 548;
    window-width = 1076;
  };

  "org/gnome/gnome-system-monitor" = {
    current-tab = "resources";
    maximized = false;
    show-dependencies = false;
    show-whose-processes = "user";
    window-height = 739;
    window-width = 1016;
  };

  "org/gnome/gnome-system-monitor/proctree" = {
    col-26-visible = false;
    col-26-width = 0;
    columns-order = [ 0 12 1 2 3 4 6 7 8 9 10 11 13 14 15 16 17 18 19 20 21 22 23 24 25 26 ];
    sort-col = 15;
    sort-order = 0;
  };

  "org/gnome/gthumb/browser" = {
    browser-sidebar-width = 285;
    folder-tree-sort-inverse = false;
    folder-tree-sort-type = "name";
    fullscreen-sidebar = "hidden";
    fullscreen-thumbnails-visible = false;
    maximized = false;
    properties-visible = false;
    sidebar-sections = [ "GthFileProperties:expanded" "GthFileComment:expanded" "GthFileDetails:expanded" "GthImageHistogram:expanded" ];
    sidebar-visible = true;
    sort-inverse = false;
    sort-type = "file::mtime";
    startup-current-file = "file:///home/davi/Pictures/WhatsApp%20Image%202024-12-05%20at%2014.10.24.resized.jpeg";
    startup-location = "file:///home/davi/Pictures";
    statusbar-visible = true;
    thumbnail-list-visible = true;
    viewer-sidebar = "tools";
    window-height = 1345;
    window-width = 1708;
  };

  "org/gnome/gthumb/crop" = {
    aspect-ratio = "custom";
    aspect-ratio-height = 4;
    aspect-ratio-invert = false;
    aspect-ratio-width = 3;
    bind-dimensions = false;
    bind-factor = 8;
    grid-type = "thirds";
  };

  "org/gnome/gthumb/data-migration" = {
    catalogs-2-10 = true;
  };

  "org/gnome/gthumb/dialogs/save-file" = {
    show-options = true;
  };

  "org/gnome/gthumb/general" = {
    active-extensions = [ "23hq" "bookmarks" "burn_disc" "catalogs" "change_date" "comments" "contact_sheet" "convert_format" "desktop_background" "edit_metadata" "exiv2_tools" "file_manager" "find_duplicates" "flicker" "gstreamer_tools" "gstreamer_utils" "image_print" "image_rotation" "importer" "jpeg_utils" "list_tools" "oauth" "photo_importer" "raw_files" "red_eye_removal" "rename_series" "resize_images" "search" "selections" "slideshow" "terminal" "webalbums" ];
  };

  "org/gnome/gthumb/pixbuf-savers/jpeg" = {
    default-ext = "jpeg";
    optimize = true;
    progressive = false;
    quality = 100;
    smoothing = 0;
  };

  "org/gnome/mutter" = {
    dynamic-workspaces = false;
    edge-tiling = false;
    experimental-features = [ "scale-monitor-framebuffer" ];
    workspaces-only-on-primary = false;
  };

  "org/gnome/mutter/keybindings" = {
    switch-monitor = [ "XF86Display" ];
    toggle-tiled-left = [ ];
    toggle-tiled-right = [ ];
  };

  "org/gnome/mutter/wayland/keybindings" = {
    restore-shortcuts = [ ];
  };

  "org/gnome/nautilus/icon-view" = {
    default-zoom-level = "large";
  };

  "org/gnome/nautilus/preferences" = {
    default-folder-viewer = "icon-view";
    migrated-gtk-settings = true;
    search-filter-time-type = "last_modified";
  };

  "org/gnome/nautilus/window-state" = {
    initial-size = mkTuple [ 1299 766 ];
    initial-size-file-chooser = mkTuple [ 890 550 ];
    maximized = false;
  };

  "org/gnome/nm-applet/eap/1eac50f4-23f4-4e35-a98c-6d6a9549e15b" = {
    ignore-ca-cert = false;
    ignore-phase2-ca-cert = false;
  };

  "org/gnome/nm-applet/eap/3d3dfec7-a308-4096-9024-6af217b3b435" = {
    ignore-ca-cert = false;
    ignore-phase2-ca-cert = false;
  };

  "org/gnome/nm-applet/eap/428a2d28-3f94-4dfc-b865-1b248e3ee4a1" = {
    ignore-ca-cert = false;
    ignore-phase2-ca-cert = false;
  };

  "org/gnome/nm-applet/eap/52a3fbd7-8605-498f-b693-d504ec0765c1" = {
    ignore-ca-cert = false;
    ignore-phase2-ca-cert = false;
  };

  "org/gnome/nm-applet/eap/71a3099c-bf1c-4887-9127-e2fa61ac4efe" = {
    ignore-ca-cert = false;
    ignore-phase2-ca-cert = false;
  };

  "org/gnome/nm-applet/eap/9f9dd7c2-23c0-4525-80f7-f755cacc1587" = {
    ignore-ca-cert = false;
    ignore-phase2-ca-cert = false;
  };

  "org/gnome/nm-applet/eap/ad2b2b8a-044f-4e56-81b6-e506668b46a2" = {
    ignore-ca-cert = false;
    ignore-phase2-ca-cert = false;
  };

  "org/gnome/nm-applet/eap/afb5717b-13a8-48ff-b7d7-e592cd9d8378" = {
    ignore-ca-cert = false;
    ignore-phase2-ca-cert = false;
  };

  "org/gnome/nm-applet/eap/b878116c-276e-3c5d-926b-88f79cff31d5" = {
    ignore-ca-cert = false;
    ignore-phase2-ca-cert = false;
  };

  "org/gnome/nm-applet/eap/dbefe7c7-fa41-4e0b-8dc7-4fced2f871e4" = {
    ignore-ca-cert = false;
    ignore-phase2-ca-cert = false;
  };

  "org/gnome/nm-applet/eap/e09ba228-306e-47a3-b465-02985c823372" = {
    ignore-ca-cert = false;
    ignore-phase2-ca-cert = false;
  };

  "org/gnome/portal/filechooser/appimagekit_f7c7e0ad6117bd997990eec171dc18f8-Bruno" = {
    last-folder-path = "/home/davi/Documents/api_collections";
  };

  "org/gnome/portal/filechooser/chromium" = {
    last-folder-path = "/home/davi/Projects/blobs/openwrt/bin/targets/ath79/generic";
  };

  "org/gnome/portal/filechooser/com/calibre_ebook/calibre" = {
    last-folder-path = "/home/davi/Documents/diversos/calibre_library";
  };

  "org/gnome/portal/filechooser/com/github/wwmm/easyeffects" = {
    last-folder-path = "/home/davi/dotfiles/easyeffects/output";
  };

  "org/gnome/portal/filechooser/com/google/Chrome" = {
    last-folder-path = "/home/davi/Downloads";
  };

  "org/gnome/portal/filechooser/dev/vencord/Vesktop" = {
    last-folder-path = "/home/davi/Pictures";
  };

  "org/gnome/portal/filechooser/org/gnome/Settings" = {
    last-folder-path = "/home/davi/Pictures";
  };

  "org/gnome/portal/filechooser/org/localsend/localsend_app" = {
    last-folder-path = "/home/davi/Pictures/documentos";
  };

  "org/gnome/portal/filechooser/org/prismlauncher/PrismLauncher" = {
    last-folder-path = "/run/media/davi/diverse";
  };

  "org/gnome/settings-daemon/plugins/color" = {
    night-light-enabled = true;
    night-light-schedule-automatic = false;
    night-light-schedule-from = 18.0;
    night-light-schedule-to = 8.0;
    night-light-temperature = mkUint32 2604;
  };

  "org/gnome/settings-daemon/plugins/media-keys" = {
    custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" ];
    email = [ "<Super>e" ];
    home = [ "<Super>f" ];
    mic-mute = [ "<Control><Super>m" ];
    rotate-video-lock-static = [ ];
    screensaver = [ "<Super>Escape" ];
    terminal = [ "<Super>t" ];
    www = [ "<Super>b" ];
  };

  "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
    binding = "<Super>Return";
    command = "alacritty";
    name = "Terminal";
  };

  "org/gnome/shell" = {
    disable-extension-version-validation = false;
    disable-user-extensions = false;
    disabled-extensions = [ "windowsNavigator@gnome-shell-extensions.gcampax.github.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "another-window-session-manager@gmail.com" "ddterm@amezin.github.com" "noannoyance@daase.net" "openbar@neuromorph" ];
    enabled-extensions = [ "system-monitor@gnome-shell-extensions.gcampax.github.com" "no-overview@fthx" "caffeine@patapon.info" "Vitals@CoreCoding.com" "display-brightness-ddcutil@themightydeity.github.com" "solaar-extension@sidevesh" "blur-my-shell@aunetx" "top-bar-organizer@julian.gse.jsts.xyz" "grand-theft-focus@zalckos.github.com" "rounded-window-corners@fxgn" "native-window-placement@gnome-shell-extensions.gcampax.github.com" "pop-shell@system76.com" "appindicatorsupport@rgcjonas.gmail.com" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "notification-position@drugo.dev" "color-picker@tuberry" ];
    favorite-apps = [ "org.gnome.Nautilus.desktop" "firefox.desktop" ];
    last-selected-power-profile = "performance";
    welcome-dialog-last-shown-version = "46.2";
  };

  "org/gnome/shell/app-switcher" = {
    current-workspace-only = true;
  };

  "org/gnome/shell/extensions/auto-move-windows" = {
    application-list = [ "com.spotify.Client.desktop:10" "com.google.Chrome.desktop:5" "com.discordapp.Discord.desktop:10" "com.github.IsmaelMartinez.teams_for_linux.desktop:5" ];
  };

  "org/gnome/shell/extensions/blur-my-shell" = {
    settings-version = 2;
  };

  "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
    brightness = 0.6;
    sigma = 30;
  };

  "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
    pipeline = "pipeline_default";
  };

  "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
    blur = false;
    brightness = 0.6;
    pipeline = "pipeline_default_rounded";
    sigma = 30;
    static-blur = true;
    style-dash-to-dock = 0;
  };

  "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
    pipeline = "pipeline_default";
  };

  "org/gnome/shell/extensions/blur-my-shell/overview" = {
    pipeline = "pipeline_default";
    style-components = 3;
  };

  "org/gnome/shell/extensions/blur-my-shell/panel" = {
    blur = false;
    brightness = 0.6;
    pipeline = "pipeline_default";
    sigma = 30;
  };

  "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
    pipeline = "pipeline_default";
  };

  "org/gnome/shell/extensions/blur-my-shell/window-list" = {
    brightness = 0.6;
    sigma = 30;
  };

  "org/gnome/shell/extensions/caffeine" = {
    duration-timer = 2;
    indicator-position-max = 3;
    inhibit-apps = [ "com.spotify.Client.desktop" ];
    screen-blank = "never";
    toggle-state = true;
    trigger-apps-mode = "on-focus";
    user-enabled = true;
  };

  "org/gnome/shell/extensions/color-picker" = {
    color-history = [ (mkUint32 15726335) 16317180 17353 15726335 335168 7963283 15857145 3900150 ];
  };

  "org/gnome/shell/extensions/display-brightness-ddcutil" = {
    button-location = 1;
    ddcutil-binary-path = "/usr/bin/ddcutil";
    ddcutil-queue-ms = 130.0;
    ddcutil-sleep-multiplier = 40.0;
    decrease-brightness-shortcut = [ "<Control>XF86MonBrightnessDown" ];
    increase-brightness-shortcut = [ "<Control>XF86MonBrightnessUp" ];
    position-system-menu = 3.0;
    show-display-name = false;
    step-change-keyboard = 2.0;
  };

  "org/gnome/shell/extensions/forge" = {
    auto-split-enabled = true;
    css-last-update = mkUint32 37;
    tabbed-tiling-mode-enabled = false;
    window-gap-size = mkUint32 4;
    workspace-skip-tile = "";
  };

  "org/gnome/shell/extensions/forge/keybindings" = {
    con-split-horizontal = [ "<Super>z" ];
    con-split-layout-toggle = [ "<Super>g" ];
    con-split-vertical = [ "<Super>v" ];
    con-stacked-layout-toggle = [ "<Shift><Super>s" ];
    con-tabbed-layout-toggle = [ "<Shift><Super>t" ];
    con-tabbed-showtab-decoration-toggle = [ "<Control><Alt>y" ];
    focus-border-toggle = [ "<Super>x" ];
    mod-mask-mouse-tile = "None";
    prefs-tiling-toggle = [ "<Super>w" ];
    window-focus-down = [ "<Super>j" ];
    window-focus-left = [ "<Super>h" ];
    window-focus-right = [ "<Super>l" ];
    window-focus-up = [ "<Super>k" ];
    window-gap-size-decrease = [ "<Control><Super>minus" ];
    window-gap-size-increase = [ "<Control><Super>plus" ];
    window-move-down = [ "<Shift><Super>j" ];
    window-move-left = [ "<Shift><Super>h" ];
    window-move-right = [ "<Shift><Super>l" ];
    window-move-up = [ "<Shift><Super>k" ];
    window-resize-bottom-decrease = [ "<Shift><Control><Super>i" ];
    window-resize-bottom-increase = [ "<Control><Super>u" ];
    window-resize-left-decrease = [ "<Shift><Control><Super>o" ];
    window-resize-left-increase = [ "<Control><Super>y" ];
    window-resize-right-decrease = [ "<Shift><Control><Super>y" ];
    window-resize-right-increase = [ "<Control><Super>o" ];
    window-resize-top-decrease = [ "<Shift><Control><Super>u" ];
    window-resize-top-increase = [ "<Control><Super>i" ];
    window-snap-center = [ "<Control><Alt>c" ];
    window-snap-one-third-left = [ "<Control><Alt>d" ];
    window-snap-one-third-right = [ "<Control><Alt>g" ];
    window-snap-two-third-left = [ "<Control><Alt>e" ];
    window-snap-two-third-right = [ "<Control><Alt>t" ];
    window-swap-down = [ "<Control><Super>j" ];
    window-swap-last-active = [ ];
    window-swap-left = [ "<Control><Super>h" ];
    window-swap-right = [ "<Control><Super>l" ];
    window-swap-up = [ "<Control><Super>k" ];
    window-toggle-always-float = [ "<Shift><Super>c" ];
    window-toggle-float = [ "<Super>c" ];
    workspace-active-tile-toggle = [ "<Shift><Super>w" ];
  };

  "org/gnome/shell/extensions/openbar" = {
    accent-override = false;
    apply-accent-shell = false;
    apply-all-shell = false;
    apply-menu-notif = false;
    apply-menu-shell = false;
    auto-bgalpha = false;
    autofg-bar = false;
    autofg-menu = false;
    autohg-bar = true;
    autohg-menu = false;
    autotheme-dark = "Color";
    autotheme-font = true;
    autotheme-light = "Light";
    autotheme-refresh = false;
    balpha = 0.48;
    bartype = "Trilands";
    bcolor = [ "0.784" "0.533" "0.000" ];
    bg-change = false;
    bgalpha = 0.0;
    bgcolor = [ "0.188" "0.188" "0.176" ];
    bgcolor-wmax = [ "0.118" "0.118" "0.118" ];
    bgcolor2 = [ "0.263" "0.243" "0.227" ];
    bgpalette = false;
    bguri = "file:///home/davi/.config/background";
    boxalpha = 0.0;
    boxcolor = [ "0.188" "0.188" "0.176" ];
    bradius = 16.0;
    bwidth = 2.0;
    count1 = 509022;
    count10 = 110;
    count11 = 106;
    count12 = 79;
    count2 = 33209;
    count3 = 7517;
    count4 = 4918;
    count5 = 4885;
    count6 = 1467;
    count7 = 299;
    count8 = 268;
    count9 = 120;
    dark-bcolor = [ "0.784" "0.533" "0.000" ];
    dark-bgcolor = [ "0.188" "0.188" "0.176" ];
    dark-bgcolor-wmax = [ "0.118" "0.118" "0.118" ];
    dark-bgcolor2 = [ "0.263" "0.243" "0.227" ];
    dark-bguri = "file:///home/davi/.config/background";
    dark-boxcolor = [ "0.188" "0.188" "0.176" ];
    dark-hscd-color = [ "0.000" "0.749" "0.749" ];
    dark-iscolor = [ "0.188" "0.188" "0.176" ];
    dark-mbcolor = [ "0.443" "0.604" "0.431" ];
    dark-mbgcolor = [ "0.110" "0.137" "0.137" ];
    dark-mscolor = [ "0.000" "0.749" "0.749" ];
    dark-mshcolor = [ "0.000" "0.000" "0.000" ];
    dark-palette1 = [ "28" "35" "35" ];
    dark-palette10 = [ "87" "136" "142" ];
    dark-palette11 = [ "32" "38" "20" ];
    dark-palette12 = [ "47" "69" "58" ];
    dark-palette2 = [ "48" "48" "45" ];
    dark-palette3 = [ "67" "62" "58" ];
    dark-palette4 = [ "190" "138" "100" ];
    dark-palette5 = [ "113" "95" "80" ];
    dark-palette6 = [ "50" "114" "112" ];
    dark-palette7 = [ "44" "73" "74" ];
    dark-palette8 = [ "68" "105" "79" ];
    dark-palette9 = [ "113" "154" "110" ];
    dark-shcolor = [ "0.000" "0.000" "0.000" ];
    dark-smbgcolor = [ "0.263" "0.243" "0.227" ];
    dark-vw-color = [ "0.000" "0.749" "0.749" ];
    dark-winbcolor = [ "0.000" "0.749" "0.749" ];
    dborder = false;
    default-font = "Sans 12";
    dshadow = false;
    fgalpha = 1.0;
    fitts-widgets = true;
    height = 44.0;
    hscd-color = [ "0.000" "0.749" "0.749" ];
    import-export = false;
    isalpha = 0.95;
    iscolor = [ "0.188" "0.188" "0.176" ];
    light-bcolor = [ "0.745" "0.541" "0.392" ];
    light-bgcolor = [ "0.827" "0.875" "0.824" ];
    light-bgcolor-wmax = [ "0.922" "0.922" "0.922" ];
    light-bgcolor2 = [ "0.725" "0.725" "0.725" ];
    light-bguri = "file:///home/davi/.config/background";
    light-boxcolor = [ "0.827" "0.875" "0.824" ];
    light-hscd-color = [ "0.200" "0.796" "0.796" ];
    light-iscolor = [ "0.827" "0.875" "0.824" ];
    light-mbcolor = [ "0.125" "0.149" "0.078" ];
    light-mbgcolor = [ "0.922" "0.914" "0.906" ];
    light-mscolor = [ "0.200" "0.796" "0.796" ];
    light-mshcolor = [ "0.000" "0.000" "0.000" ];
    light-palette1 = [ "28" "35" "35" ];
    light-palette10 = [ "87" "136" "142" ];
    light-palette11 = [ "32" "38" "20" ];
    light-palette12 = [ "47" "69" "58" ];
    light-palette2 = [ "48" "48" "45" ];
    light-palette3 = [ "67" "62" "58" ];
    light-palette4 = [ "190" "138" "100" ];
    light-palette5 = [ "113" "95" "80" ];
    light-palette6 = [ "50" "114" "112" ];
    light-palette7 = [ "44" "73" "74" ];
    light-palette8 = [ "68" "105" "79" ];
    light-palette9 = [ "113" "154" "110" ];
    light-shcolor = [ "0.000" "0.000" "0.000" ];
    light-smbgcolor = [ "0.725" "0.725" "0.725" ];
    light-vw-color = [ "0.200" "0.796" "0.796" ];
    light-winbcolor = [ "0.200" "0.796" "0.796" ];
    margin = 1.2;
    mbcolor = [ "0.443" "0.604" "0.431" ];
    mbgcolor = [ "0.110" "0.137" "0.137" ];
    menustyle = false;
    mfgalpha = 1.0;
    mscolor = [ "0.000" "0.749" "0.749" ];
    mshcolor = [ "0.000" "0.000" "0.000" ];
    neon = false;
    palette1 = [ "28" "35" "35" ];
    palette10 = [ "87" "136" "142" ];
    palette11 = [ "32" "38" "20" ];
    palette12 = [ "47" "69" "58" ];
    palette2 = [ "48" "48" "45" ];
    palette3 = [ "67" "62" "58" ];
    palette4 = [ "190" "138" "100" ];
    palette5 = [ "113" "95" "80" ];
    palette6 = [ "50" "114" "112" ];
    palette7 = [ "44" "73" "74" ];
    palette8 = [ "68" "105" "79" ];
    palette9 = [ "113" "154" "110" ];
    pause-reload = false;
    reloadstyle = true;
    set-overview = false;
    shadow = false;
    shcolor = [ "0.000" "0.000" "0.000" ];
    smbgcolor = [ "0.263" "0.243" "0.227" ];
    smbgoverride = false;
    trigger-autotheme = true;
    trigger-reload = false;
    vpad = 4.5;
    vw-color = [ "0.000" "0.749" "0.749" ];
    winbcolor = [ "0.000" "0.749" "0.749" ];
    wmaxbar = false;
  };

  "org/gnome/shell/extensions/pop-shell" = {
    activate-launcher = [ "<Super>d" ];
    active-hint = true;
    active-hint-border-radius = mkUint32 2;
    focus-up = [ "<Super>Up" "<Super>KP_Up" "<Super>k" ];
    fullscreen-launcher = false;
    hint-color-rgba = "rgb(53,132,228)";
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
    tile-move-down = [ ];
    tile-move-down-global = [ "<Super><Shift>Down" "<Super><Shift>KP_Down" "<Super><Shift>j" ];
    tile-move-left = [ ];
    tile-move-left-global = [ "<Super><Shift>Left" "<Super><Shift>KP_Left" "<Super><Shift>h" ];
    tile-move-right = [ ];
    tile-move-right-global = [ "<Super><Shift>Right" "<Super><Shift>KP_Right" "<Super><Shift>l" ];
    tile-move-up = [ ];
    tile-move-up-global = [ "<Super><Shift>Up" "<Super><Shift>KP_Up" "<Super><Shift>k" ];
    tile-orientation = [ "<Super>w" ];
    tile-resize-down = [ "Down" "KP_Down" "j" ];
    tile-resize-left = [ "Left" "KP_Left" "h" ];
    tile-resize-right = [ "Right" "KP_Right" "l" ];
    tile-resize-up = [ "Up" "KP_Up" "k" ];
    toggle-floating = [ "<Shift><Super>space" ];
    toggle-stacking-global = [ "<Super>s" ];
    toggle-tiling = [ "<Super>z" ];
  };

  "org/gnome/shell/extensions/system-monitor" = {
    show-download = false;
    show-swap = false;
    show-upload = false;
  };

  "org/gnome/shell/extensions/top-bar-organizer" = {
    center-box-order = [ "appindicator-kstatusnotifieritem-firewall-applet" "screenSharing" "screenRecording" "pop-shell" "appindicator-kstatusnotifieritem-obs" "appindicator-kstatusnotifieritem-chrome_status_icon_1" "vitalsMenu" ];
    left-box-order = [ "activities" ];
    right-box-order = [ "appindicator-kstatusnotifieritem-sgRxJiJ53F" "appindicator-kstatusnotifieritem-BEsaUQqkR8" "appindicator-kstatusnotifieritem-tray-icon tray app" "appindicator-kstatusnotifieritem-Z8dSD3Lvx6" "appindicator-kstatusnotifieritem-5Fjj4g8j-G" "appindicator-kstatusnotifieritem-steam" "appindicator-kstatusnotifieritem-eqjqZUCmyX" "appindicator-kstatusnotifieritem-JdQZMy8Rnm" "appindicator-kstatusnotifieritem-Stremio" "appindicator-kstatusnotifieritem-spotify-client" "dwellClick" "a11y" "keyboard" "dateMenu" "quickSettings" ];
  };

  "org/gnome/shell/extensions/vitals" = {
    alphabetize = true;
    hide-icons = false;
    hot-sensors = [ "_memory_usage_" "_processor_usage_" ];
    icon-style = 1;
    menu-centered = false;
    show-fan = false;
    show-network = false;
    show-system = false;
    show-temperature = false;
    show-voltage = false;
    use-higher-precision = false;
  };

  "org/gnome/shell/keybindings" = {
    focus-active-notification = [ ];
    open-application-menu = [ ];
    show-screenshot-ui = [ "<Shift><Super>s" ];
    toggle-message-tray = [ "<Super>v" ];
    toggle-overview = [ ];
    toggle-quick-settings = [ ];
  };

  "org/gnome/shell/world-clocks" = {
    locations = [ ];
  };

  "org/gnome/software" = {
    check-timestamp = mkInt64 1739448983;
    first-run = false;
    flatpak-purge-timestamp = mkInt64 1739411637;
  };

  "org/gnome/tweaks" = {
    show-extensions-notice = false;
  };

  "org/gtk/gtk4/settings/color-chooser" = {
    custom-colors = [ (mkTuple [ 0.7843137383460999 0.5333333611488342 0.0 1.0 ]) (mkTuple [ 0.7450000047683716 0.5410000085830688 0.3919999897480011 1.0 ]) (mkTuple [ 0.8349999785423279 0.6549999713897705 0.5249999761581421 1.0 ]) (mkTuple [ 0.1294117569923401 0.5647058486938477 0.6431372761726379 1.0 ]) (mkTuple [ 0.5 0.5 0.5 1.0 ]) ];
    selected-color = mkTuple [ true 1.0 1.0 1.0 1.0 ];
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

  "org/gtk/settings/color-chooser" = {
    custom-colors = [ (mkTuple [ 0.20784313725490203 0.5176470588235295 0.8941176470588236 1.0 ]) (mkTuple [ 0.4666666666666667 0.34901960784313724 9.019607843137255e-2 1.0 ]) (mkTuple [ 0.12941176470588237 0.5647058823529412 0.6431372549019608 1.0 ]) (mkTuple [ 0.12941176470588234 0.5647058823529413 0.6431372549019608 1.0 ]) (mkTuple [ 0.22745098039215686 0.5803921568627451 0.2901960784313726 1.0 ]) (mkTuple [ 0.2274509803921568 0.5803921568627451 0.2901960784313726 1.0 ]) (mkTuple [ 0.8352941176470589 0.3803921568627451 0.6 1.0 ]) (mkTuple [ 0.8352941176470589 0.380392156862745 0.5999999999999998 1.0 ]) ];
    selected-color = mkTuple [ true 0.20784313725490203 0.5176470588235295 0.8941176470588236 1.0 ];
  };

  "org/gtk/settings/file-chooser" = {
    date-format = "regular";
    location-mode = "path-bar";
    show-hidden = false;
    show-size-column = true;
    show-type-column = true;
    sidebar-width = 207;
    sort-column = "name";
    sort-directories-first = false;
    sort-order = "ascending";
    type-format = "category";
  };

}
