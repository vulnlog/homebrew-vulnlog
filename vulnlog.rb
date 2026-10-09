class Vulnlog < Formula
  desc "Supply chain security, as code: track SCA vulnerability findings"
  homepage "https://github.com/vulnlog/vulnlog"
  license "Apache-2.0"
  version "0.18.0"

  if Hardware::CPU.arm?
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.18.0/vulnlog-macos-aarch64.zip"
    sha256 "16775732ad0ea2722d4f22279f2a93457209614953416ae0a53753e372eb06ec"
  else
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.18.0/vulnlog-0.18.0.zip"
    sha256 "776b18a9f130e019954770739666d2c8c4c6c513d5e972dd75f479ea9181823c"
    depends_on "openjdk@21"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "vulnlog"
    else
      libexec.install Dir["vulnlog-#{version}/*"]
      (bin/"vulnlog").write_env_script libexec/"bin/vulnlog",
        JAVA_HOME: Language::Java.java_home("21")
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vulnlog --version")
  end
end
