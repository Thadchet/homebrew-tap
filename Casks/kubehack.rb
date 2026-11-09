cask "kubehack" do
  version "1.0.5"
  sha256 "abeadabb8ac6e5a56d514295d7477f4986c8b77abac72c7a5224279c92352cef"

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
