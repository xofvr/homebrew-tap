# xofvr/homebrew-tap

Homebrew tap for [Verbatim](https://github.com/xofvr/Verbatim) — real-time
on-device speech-to-text for macOS.

## Install

```bash
brew install --cask xofvr/tap/verbatim
```

Homebrew downloads Verbatim, installs it to `/Applications`, and clears the
macOS quarantine flag so it opens without a Gatekeeper prompt.

Update with `brew upgrade --cask verbatim`, remove with
`brew uninstall --cask verbatim` (add `--zap` to also delete app data).
