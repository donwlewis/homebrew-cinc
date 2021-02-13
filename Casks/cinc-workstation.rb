cask "cinc-workstation" do
  version "21.2.259"
  sha256 "88f24382273e4eb3c57e3e8cbc74221ae05a068437aad3604fcc5a317f153cb5"

  url "http://downloads.cinc.sh/files/unstable/cinc-workstation/#{version}/mac_os_x/10.14/cinc-workstation-#{version}-1.dmg"
  appcast ""
  name "CINC Workstation"
  homepage "https://cinc.sh/start/workstation/"

  depends_on macos: ">= :high_sierra"

  pkg "cinc-workstation-#{version}-1.pkg"

  uninstall_postflight do
    system_command "/usr/bin/find",
      args: ["/usr/local/bin", "-lname", "/opt/cinc-workstation/*", "-delete"],
      sudo: true
  end

  uninstall pkgutil: "com.cinc-project.pkg.cinc-workstation",
            delete:  "/opt/cinc-workstation/"

  zap trash: "~/.cinc-workstation/"
end