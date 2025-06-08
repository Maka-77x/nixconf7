{
  flake.modules = {
    nixos.guacamole = {
      services.guacamole-server.enable = true;
      services.guacamole-server.host = "127.0.0.1";
      services.guacamole-server.userMappingXml = ./user-mapping.xml;

      services.guacamole-client.enable = true;
      services.guacamole-client.settings.guacd-port = 4822;
      services.guacamole-client.settings.guacd-hostname = "localhost";

      services.caddy.enable = true;
      services.caddy.virtualHosts."0.0.0.0:80".extraConfig = ''
        handle_path /* {
          rewrite * /guacamole{path}
          reverse_proxy 127.0.0.1:8080 {
            flush_interval -1
          }
        }
      '';

      services.xrdp.enable = true;
      services.xrdp.defaultWindowManager = "startplasma-x11";
      services.xrdp.openFirewall = true;

      networking.firewall.allowedTCPPorts = [
        80
        443
      ];
    };
  };
}
