{pkgs, ...}:
{
  services.kanata = {
    enable = true;
    keyboard.mykeyboards.configFile = builtins.readfile ./cfg-linux.kbd 
  };
}
