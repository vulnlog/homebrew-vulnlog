class Vulnlog < Formula
  desc "Supply chain security, as code: track SCA vulnerability findings"
  homepage "https://github.com/vulnlog/vulnlog"
  license "Apache-2.0"
  version "0.16.0"

  if Hardware::CPU.arm?
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.16.0/vulnlog-macos-aarch64.zip"
    sha256 "682f926e8260fe8fe86ac35e144ac9ff1d89b5dd6b2c6ddeb3c5ee3325aee55d"
  else
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.16.0/vulnlog-0.16.0.zip"
    sha256 "ff8ae21a0493266a73f9a4995122b9f686517b1960425a5634e60ce083f871e2"
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
