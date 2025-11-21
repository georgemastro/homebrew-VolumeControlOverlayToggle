cask "volume-control-overlay-toggle" do
  version "1.2.3"
  sha256 "ccff55ef866b9a595448dc0eab7c9d1f577a7a9dbd174fac693b295b90c80322"

  url "https://github.com/georgemastro/VolumeControlOverlayToggle/releases/download/v#{version}/VolumeControlOverlayToggle.zip"
  name "VolumeControlOverlayToggle"
  desc "A simple macOS menu bar app to toggle the volume control overlay"
  homepage "https://github.com/georgemastro/VolumeControlOverlayToggle"

  depends_on macos: ">= :big_sur"

  # Remove quarantine attribute before moving to Applications
  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{staged_path}/VolumeControlOverlayToggle.app"]
  end

  app "VolumeControlOverlayToggle.app"
end
