cask "kubehack" do
  version "1.0.7"
  sha256 "e84df746c9bb6a5555f5817cc1c7a874a7347e7bcddf354f5017d4f0fa320d39"

  url "https://github.com/Thadchet/kubehack/releases/download/v#{version}/kubehack-macos.zip"
  name "Kubehack"
  desc "Kubernetes desktop app"
  homepage "https://github.com/Thadchet/kubehack"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "kubehack.app"

  # The app isn't notarized, so macOS would refuse to open it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/kubehack.app"],
        writable_paths: ["{{appdir}}/kubehack.app"]
  end

  zap trash: "~/Library/Application Support/kubehack"
end
