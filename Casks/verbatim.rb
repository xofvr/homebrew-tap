cask "verbatim" do
  version "1.1.1"
  sha256 "a95c938bfecd5c1b2fd4f77e9832857feefc6eb397dbdfcc1333f572caf39118"

  url "https://github.com/xofvr/Verbatim/releases/download/v#{version}/Verbatim-#{version}.dmg"
  name "Verbatim"
  desc "Real-time on-device speech-to-text"
  homepage "https://github.com/xofvr/Verbatim"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Verbatim.app"

  # Verbatim is ad-hoc signed but not notarized (no paid Apple Developer
  # account), so macOS quarantines the download. Strip the quarantine flag so
  # it opens without a Gatekeeper prompt. (Homebrew deprecated --no-quarantine
  # in 5.0.0, so a tap-side postflight is the supported approach.)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/Verbatim.app"],
                   sudo: false
  end

  uninstall quit: "farhan.verbatim"

  zap trash: [
    "~/Library/Application Support/Verbatim",
    "~/Library/Caches/farhan.verbatim",
    "~/Library/HTTPStorages/farhan.verbatim",
    "~/Library/Preferences/farhan.verbatim.plist",
    "~/Library/Saved Application State/farhan.verbatim.savedState",
  ]
end
