cask "cinc-auditor" do
  version "4.26.4"
  sha256 "5682c503931141a14e7b7922d1ce7308d1934b48f5795323ab7ec2e89280a358"

  url "http://downloads.cinc.sh/files/stable/cinc-auditor/#{version}/mac_os_x/10.14/cinc-auditor-#{version}-1.dmg"
  appcast ""
  name "CINC Auditor"
  homepage "https://cinc.sh/start/auditor/"

  depends_on macos: ">= :high_sierra"

  pkg "cinc-auditor-#{version}-1.pkg"

  uninstall_postflight do
    system_command "/usr/bin/find",
      args: ["/usr/local/bin", "-lname", "/opt/cinc-auditor/*", "-delete"],
      sudo: true
  end

  uninstall pkgutil: "com.cinc-project.pkg.cinc-auditor",
            delete:  "/opt/cinc-auditor/"

  zap trash: "~/.cinc-auditor/"
end