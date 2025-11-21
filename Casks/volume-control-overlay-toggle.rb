cask "volume-control-overlay-toggle" do
  version "1.2.1"
  sha256 "d160eb9a9e00fb67c1f2111b9c54996a908f0a9440b1fe3830efc23c6dc99d48"

  url "https://github.com/georgemastro/VolumeControlOverlayToggle/releases/download/v#{version}/VolumeControlOverlayToggle.zip"
  name "VolumeControlOverlayToggle"
  desc "A simple macOS menu bar app to toggle the volume control overlay"
  homepage "https://github.com/georgemastro/VolumeControlOverlayToggle"

  depends_on macos: ">= :big_sur"

  app "VolumeControlOverlayToggle.app"

  # Handle quarantine more gracefully
  postflight do
    set_permissions "#{appdir}/VolumeControlOverlayToggle.app", "0755"

    quarantine_attribute = `xattr -l "#{appdir}/VolumeControlOverlayToggle.app" | grep com.apple.quarantine`

    if quarantine_attribute.strip.length > 0
      system_command "/usr/bin/xattr",
                    args: ["-d", "com.apple.quarantine", "#{appdir}/VolumeControlOverlayToggle.app"],
                    sudo: true
    end
  end
end
