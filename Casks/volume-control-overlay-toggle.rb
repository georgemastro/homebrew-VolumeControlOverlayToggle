cask "volume-control-overlay-toggle" do
  version "1.0.8"
  sha256 "07b4bcf58fdd991d9d844f58975a5b4256e5db4ac7b6e708b70bad6cce10d559"

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
