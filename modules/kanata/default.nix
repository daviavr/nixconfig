{pkgs, ...}:
{
  services.kanata = {
    enable = true;
    keyboards.mykeyboards.configFile = ./cfg-linux.kbd;
  };
}
