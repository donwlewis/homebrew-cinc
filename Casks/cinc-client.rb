cask "cinc-client" do
  version "17.0.242"
  sha256 "b42210546796d0e8866a7e2eb4b3aefbedac37789dd64dea577d1c6d0fb8265a"

  url "http://downloads.cinc.sh/files/stable/cinc/#{version}/mac_os_x/10.14/cinc-#{version}-1.x86_64.dmg"
  appcast ""
  name "CINC Client"
  desc "Community version of Chef Inspec"
  homepage "https://cinc.sh/start/client/"

  depends_on macos: ">= :high_sierra"

  pkg "cinc-#{version}-1.x86_64.pkg"

  uninstall_postflight do
    system_command "/usr/bin/find",
                   args: ["/usr/local/bin", "-lname", "/opt/cinc/*", "-delete"],
                   sudo: true
  end

  uninstall pkgutil: "com.cinc-project.pkg.cinc",
            delete:  "/opt/cinc/"

  zap trash: "~/.cinc/"
end
