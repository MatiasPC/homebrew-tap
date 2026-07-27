cask "cadence" do
  version "2.2"
  sha256 "204b41c921f50c21c1df5a943100294da1262b2f023511ba861d6382e654e79b"

  url "https://github.com/MatiasPC/Cadence/releases/download/v#{version}/Cadence.zip"
  name "Cadence"
  desc "Minimal macOS menu-bar monitor for Claude Code usage"
  homepage "https://github.com/MatiasPC/Cadence"

  # Surfaces a stale cask in `brew livecheck`, so this pin can't silently rot
  # again — it sat at 2.1 through two releases.
  livecheck do
    url :url
    strategy :github_latest
  end

  # Cadence targets macOS 26 (Tahoe) for its Liquid Glass UI.
  depends_on macos: :tahoe

  app "Cadence.app"

  # No quarantine workaround here, deliberately. As of 2.2 Cadence is signed
  # with a Developer ID and notarized by Apple, so Gatekeeper clears it on its
  # own. Stripping the flag would only serve to hide a broken signature.

  zap trash: [
    "~/Library/Application Support/Cadence",
    "~/Library/Preferences/com.cadence.app.plist",
  ]

  caveats <<~EOS
    Cadence reads your usage through the `ccusage` CLI. Install it with:
      npm install -g ccusage
  EOS
end
