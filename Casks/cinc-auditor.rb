cask "cinc-auditor" do
  version "4.28.0"
  sha256 "d2f1d0ca8d6f258d134c0d545d8f55f8d96f2baeae74ce65ce8abb4a8d6ffe83"

  url "http://downloads.cinc.sh/files/stable/cinc-auditor/#{version}/mac_os_x/10.14/cinc-auditor-#{version}-1.x86_64.dmg"
  appcast ""
  name "CINC Auditor"
  desc "Community version of Chef Inspec"
  homepage "https://cinc.sh/start/auditor/"

  depends_on macos: ">= :high_sierra"

  pkg "cinc-auditor-#{version}-1.x86_64.pkg"

  uninstall_postflight do
    system_command "/usr/bin/find",
                   args: ["/usr/local/bin", "-lname", "/opt/cinc-auditor/*", "-delete"],
                   sudo: true
  end

  uninstall pkgutil: "com.cinc-project.pkg.cinc-auditor",
            delete:  "/opt/cinc-auditor/"

  zap trash: "~/.cinc-auditor/"
end
