cask "cinc-client" do
  version "17.1.35"
  sha256 "12c5170603c5067e3a48eb13578e76ff2dc67d5e523a71f2ded3dee0a254fbbf"

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
