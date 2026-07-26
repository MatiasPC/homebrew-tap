# MatiasPC's Homebrew Tap

Homebrew casks for my apps.

## Cadence

A minimal macOS menu-bar monitor for your Claude Code usage — [source & docs](https://github.com/MatiasPC/Cadence).

```bash
# One-time: trust this third-party tap (required by Homebrew 6+)
brew tap matiaspc/tap
brew trust --cask matiaspc/tap/cadence

# Install
brew install --cask matiaspc/tap/cadence
```

Then run **Cadence** — it lives in your menu bar (no Dock icon).

**Requirements:** macOS 26 (Tahoe)+, and the [`ccusage`](https://github.com/ryoppippi/ccusage) CLI (`npm install -g ccusage`).

> Cadence isn't notarized by Apple (that needs a paid Developer ID), so the cask
> removes the macOS quarantine flag automatically on install — no manual
> `xattr` step needed.

### Upgrade / uninstall

```bash
brew upgrade --cask matiaspc/tap/cadence
brew uninstall --cask cadence
```
