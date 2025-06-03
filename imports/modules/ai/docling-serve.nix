{
  unify.modules.ai.nixos =
    { pkgs, ... }:
    {
      services.docling-serve.enable = true;
      services.docling-serve.host = "0.0.0.0";
      services.docling-serve.port = 5001;
      services.docling-serve.package = pkgs.docling-serve.override {
        withUI = true;
        withTesserocr = true;
        withCPU = true;
        withRapidocr = true;
      };
      services.docling-serve.environment = {
        DOCLING_SERVE_ENABLE_UI = "True";
      };
      services.docling-serve.openFirewall = true;
      networking.firewall.allowedTCPPorts = [
        5001
      ];
    };
}
