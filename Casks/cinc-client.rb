cask "cinc-client" do
  version "16.10.17"
  sha256 "b41b31098eaefdefc0bcdd26f6c7da1b1d9314c2cf0b9a68ef23895c67bcb76c"

  url "http://downloads.cinc.sh/files/stable/cinc/#{version}/mac_os_x/10.14/cinc-#{version}-1.x86_64.dmg"
  appcast ""
  name "CINC Auditor"
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