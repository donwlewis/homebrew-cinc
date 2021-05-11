cask "cinc-auditor" do
  version "4.37.0"
  sha256 "3f6d02affeba36bb94e603dd7d2918a0d10bd8d7578dc74fbf8a01f95ab50727"

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
