{ config, pkgs, ... }:

{

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  networking.hostName = "thinkbook";

}
