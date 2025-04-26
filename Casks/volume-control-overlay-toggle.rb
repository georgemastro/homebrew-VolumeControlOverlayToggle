cask "volume-control-overlay-toggle" do
  version "1.0.7"
  sha256 "b212e8254daedd92b4f78397749fa19cb28f2f6417fc9012dfbc39f28ac8a078"

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
