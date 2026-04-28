cask "volume-control-overlay-toggle" do
  version "1.2.5"
  sha256 "61190cca42789ee41905dbfb1b7362c9a52d5b538e4bb3bbeadde1a9b4ba6731"

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
