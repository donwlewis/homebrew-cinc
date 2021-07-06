cask "cinc-workstation" do
  version "21.6.497"
  sha256 "88647c97b1e720b5f82c833fcc523f3568f7e36d890b52532a665cd93b390b6b"

  url "http://downloads.cinc.sh/files/unstable/cinc-workstation/#{version}/mac_os_x/10.14/cinc-workstation-#{version}-1.x86_64.dmg"
  appcast ""
  name "CINC Workstation"
  desc "Community version of Chef Workstation"
  homepage "https://cinc.sh/start/workstation/"

  depends_on macos: ">= :high_sierra"

  pkg "cinc-workstation-#{version}-1.x86_64.pkg"

  uninstall_postflight do
    system_command "/usr/bin/find",
                   args: ["/usr/local/bin", "-lname", "/opt/cinc-workstation/*", "-delete"],
                   sudo: true
  end

  uninstall pkgutil: "com.cinc-project.pkg.cinc-workstation",
            delete:  "/opt/cinc-workstation/"

  zap trash: "~/.cinc-workstation/"
end
