cask "cadence" do
  version "2.1"
  sha256 "32df5b97c3ddf9e73070485dbb6d697b115a6d3491ce495cfbdf7ed20d636074"

  url "https://github.com/MatiasPC/Cadence/releases/download/v#{version}/Cadence.zip"
  name "Cadence"
  desc "Minimal macOS menu-bar monitor for Claude Code usage"
  homepage "https://github.com/MatiasPC/Cadence"

  # Cadence targets macOS 26 (Tahoe) for its Liquid Glass UI.
  depends_on macos: :tahoe

  app "Cadence.app"

  # Cadence is not notarized (that needs a paid Apple Developer ID). Homebrew 6
  # removed --no-quarantine, so strip the quarantine flag here instead — the same
  # `xattr` step a manual installer would run, done automatically so the app
  # opens without a Gatekeeper block.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Cadence.app"]
  end

  zap trash: "~/Library/Preferences/com.cadence.app.plist"

  caveats <<~EOS
    Cadence reads your usage through the `ccusage` CLI. Install it with:
      npm install -g ccusage
  EOS
end
