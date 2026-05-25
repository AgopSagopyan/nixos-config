let
  youtubeShortsBlockId = "{34daeb50-c2d2-4f14-886a-7160b24d66a4}";
in
{
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      ExtensionSettings = {

        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };

        "${youtubeShortsBlockId}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-shorts-block/latest.xpi";
        };

        "@testpilot-containers" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi";
        };

        "extension@one-tab.com" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/onetab/latest.xpi";
        };

      };
    };
  };
}
