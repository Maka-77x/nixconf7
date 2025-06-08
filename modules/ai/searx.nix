{
  flake.modules = {
    nixos.ai = {
      services.searx.enable = true;
      services.searx.settings.use_default_settings = true;
      services.searx.settings.general = {
        privacypolicy_url = false;
        enable_metrics = true;
        debug = false;
      };
      services.searx.settings.default_doi_resolver = "sci-hub.se";
      services.searx.settings.server = {
        port = 3002;
        bind_address = "127.0.0.1";
        secret_key = "spotting-gumminess-chamomile-unsuited-purple";
        image_proxy = true;
        base_url = "/searx";
        limiter = false;
        public_instance = false;
      };
      services.searx.settings.enabled_plugins = [
        "Hash plugin"
        "Search on category select"
        "Tracker URL remover"
        "Hostname replace"
        "Unit converter plugin"
        "Basic Calculator"
        "Open Access DOI rewrite"
      ];
      services.searx.settings.search = {
        safe_search = 0; # 0 = None, 1 = Moderate, 2 = Strict
        formats = [
          "html"
          "json"
          "rss"
        ];
        autocomplete = "google";
        default_lang = "en";
      };
      services.caddy.enable = true;
      services.caddy.virtualHosts."http://192.168.2.164".extraConfig = ''
        handle_path /searx/* {
          reverse_proxy 127.0.0.1:3002
          }
      '';
      services.caddy.virtualHosts."192.168.2.164".extraConfig = ''
        handle_path /searx/* {
          reverse_proxy 127.0.0.1:3002
        }
      '';
      networking.firewall.allowedTCPPorts = [
        80
        443
      ];
    };
  };
}
