cask "cinc-client" do
  version "16.10.17"
  sha256 "60d1139fc438272f370b2fe323b5cd1420645a5b3f927eecfbc826dc79897431"

  url "http://downloads.cinc.sh/files/stable/cinc/#{version}/mac_os_x/10.14/cinc-#{version}-1.dmg"
  appcast ""
  name "CINC Auditor"
  homepage "https://cinc.sh/start/client/"

  depends_on macos: ">= :high_sierra"

  pkg "cinc-#{version}-1.pkg"

  uninstall_postflight do
    system_command "/usr/bin/find",
      args: ["/usr/local/bin", "-lname", "/opt/cinc/*", "-delete"],
      sudo: true
  end

  uninstall pkgutil: "com.cinc-project.pkg.cinc",
            delete:  "/opt/cinc/"

  zap trash: "~/.cinc/"
end