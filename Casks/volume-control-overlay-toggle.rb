cask "volume-control-overlay-toggle" do
  version "1.2.2"
  sha256 "e268a600c98165daf704f712f64bd9f1b1dd3450a6b102d0f14a368eaec3e1c4"

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
