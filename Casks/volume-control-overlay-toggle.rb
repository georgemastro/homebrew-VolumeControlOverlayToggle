cask "volume-control-overlay-toggle" do
  version "1.2.6"
  sha256 "ad117ef88ef7a11aced572a0e0788250d5ca72e1f8e17c194f106a983ae2c061"

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
