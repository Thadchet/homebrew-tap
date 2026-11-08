# Homebrew tap

```sh
brew tap thadchet/tap
brew trust thadchet/tap
brew install --cask kubehack
```

Homebrew only loads casks from taps you trust, which is what the second line does.
Upgrade with `brew upgrade --cask kubehack`.

[Kubehack](https://github.com/Thadchet/kubehack) is a Kubernetes desktop app. It
isn't notarized yet, so the cask removes the quarantine flag that would make macOS
refuse to open it.
