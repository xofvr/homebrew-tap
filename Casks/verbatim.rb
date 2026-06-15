cask "verbatim" do
  version "1.1.0"
  sha256 "ae59f78621c3e4af4298fc871b3eccb7be21721650140931072a0fba03fcde9c"

  url "https://github.com/xofvr/Verbatim/releases/download/v#{version}/Verbatim-#{version}.dmg",
      verified: "github.com/xofvr/Verbatim/"
  name "Verbatim"
  desc "Real-time on-device speech-to-text for macOS"
  homepage "https://github.com/xofvr/Verbatim"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"
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
