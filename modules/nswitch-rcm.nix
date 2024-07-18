{ config, lib, pkgs, ... }:
with lib; let
  cfg = config.services.nswitch-rcm;
in {
  options = {
    services.nswitch-rcm = {
      enable = mkEnableOption "Auto Nintendo Switch payload injector";
      package = mkPackageOption pkgs null { };
    };
  };
  config = mkIf cfg.enable {
    systemd.services.nswitch-rcm = {
      enable = true;
      description = "Nintendo Switch RCM automatic upon-connect payload injector";
      serviceConfig = {
        ExecStart = "${pkgs.jre}/bin/java -jar ${pkgs.ns-usbloader}/share/java/ns-usbloader.jar -r ${cfg.package}";
      };
    };
    services.udev.extraRules = ''
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="0955", ATTRS{idProduct}=="7321", TAG+="systemd", ENV{SYSTEMD_WANTS}="nswitch-rcm.service"
    '';
  };
}
