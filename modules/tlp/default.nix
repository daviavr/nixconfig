{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.tlp;
in
{

  options = { modules.tlp.enable = mkEnableOption "tlp"; };
  config = mkIf cfg.enable {

    services.power-profiles-daemon.enable = false;
    services.tlp = {
      enable = true;
      settings = {
        SOUND_POWER_SAVE_ON_AC = 0;
        SOUND_POWER_SAVE_ON_BAT = 10;

        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";

        CPU_DRIVER_OPMODE_ON_AC = "active";
        CPU_DRIVER_OPMODE_ON_BAT = "active";

        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        CPU_MIN_PERF_ON_AC = 12;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 2;
        CPU_MAX_PERF_ON_BAT = 50;

        #CPU_SCALING_MIN_FREQ_ON_BAT = 0;
        #CPU_SCALING_MAX_FREQ_ON_BAT = 2100000;

        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;

        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;

        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";

        MEM_SLEEP_ON_AC = "s2idle";
        MEM_SLEEP_ON_BAT = "s2idle";

        INTEL_GPU_MIN_FREQ_ON_AC = 300;
        INTEL_GPU_MIN_FREQ_ON_BAT = 100;
        INTEL_GPU_MAX_FREQ_ON_AC = 1100;
        INTEL_GPU_MAX_FREQ_ON_BAT = 600;
        INTEL_GPU_BOOST_FREQ_ON_AC = 1100;
        INTEL_GPU_BOOST_FREQ_ON_BAT = 700;

        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "default";

        DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth nfc wwan";
        DEVICES_TO_ENABLE_ON_STARTUP = "wifi";

        DEVICES_TO_ENABLE_ON_AC = "nfc wwan";
        DEVICES_TO_DISABLE_ON_BAT = "nfc wwan";
        DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE = "bluetooth nfc wwan";

        USB_AUTOSUSPEND = 0;
        #        USB_DENYLIST = "0001:0001 04f3:3140 04f3:04f3 1d6b:0002";

        RESTORE_THRESHOLDS_ON_BAT = 0;
      };
    };
  };
}
