cask "kubehack" do
  version "1.0.3"
  sha256 "7655a9fd031f9a13a651aaf32b7e9309472dd17da72b7d582cc352b7ad99ba34"

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
