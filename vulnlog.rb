class Vulnlog < Formula
  desc "Supply chain security, as code: track SCA vulnerability findings"
  homepage "https://github.com/vulnlog/vulnlog"
  license "Apache-2.0"
  version "0.15.1"

  if Hardware::CPU.arm?
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.15.1/vulnlog-macos-aarch64.zip"
    sha256 "1de342856a46a2404905f06ac51e2a309c4f95d9574ae93bc983191227814570"
  else
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.15.1/vulnlog-0.15.1.zip"
    sha256 "685219f11949bf16c3f9c0a07ce3daef024478022dab8a8be98620130c43cbbb"
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
