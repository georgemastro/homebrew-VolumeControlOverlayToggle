cask "volume-control-overlay-toggle" do
  version "1.0.5"
  sha256 "402f6a48cf6c41dd53f8b767e1dfebce122dceb0966ac5d605e4d0a73262433f"

  url "https://github.com/georgemastro/VolumeControlOverlayToggle/releases/download/v#{version}/VolumeControlOverlayToggle.zip"
  name "VolumeControlOverlayToggle"
  desc "A simple macOS menu bar app to toggle the volume control overlay"
  homepage "https://github.com/georgemastro/VolumeControlOverlayToggle"

  depends_on macos: ">= :big_sur"

  app "VolumeControlOverlayToggle.app"

  # Disable quarantine for unnotarized apps
  postflight do
    system_command "/usr/bin/xattr",
                  args: ["-d", "com.apple.quarantine", "#{appdir}/VolumeControlOverlayToggle.app"],
                  sudo: true
  end
end
