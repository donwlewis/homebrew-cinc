cask "cinc-workstation" do
  version "21.6.467"
  sha256 "31400af083b21b9258994212db09ed508f8435fa8f117237512fd7397defe537"

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
