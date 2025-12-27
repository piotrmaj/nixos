{ settings, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,fr";
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${settings.user.name}";
    };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
