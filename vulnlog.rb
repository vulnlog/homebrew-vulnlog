class Vulnlog < Formula
  desc "Supply chain security, as code: track SCA vulnerability findings"
  homepage "https://github.com/vulnlog/vulnlog"
  license "Apache-2.0"
  version "0.19.0"

  if Hardware::CPU.arm?
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.19.0/vulnlog-macos-aarch64.zip"
    sha256 "af844ec0915ba3681ab602e67e356f289d2cc80e2cac8604e2db0d33f928ae52"
  else
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.19.0/vulnlog-0.19.0.zip"
    sha256 "ad7d3ec255b98486b3f3fd0716acd1af8ddaeb8b88b45cd74e2fc2f358c91ac8"
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
