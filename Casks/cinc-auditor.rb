cask "cinc-auditor" do
  version "4.28.0"
  sha256 "a2e7c550c6d631030ad032283fd1153c134eafcf74539011bc3b7f95a3021338"

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
