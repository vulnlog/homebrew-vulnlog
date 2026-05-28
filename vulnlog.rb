class Vulnlog < Formula
  desc "Supply chain security, as code: track SCA vulnerability findings"
  homepage "https://github.com/vulnlog/vulnlog"
  license "Apache-2.0"
  version "0.14.0"

  if Hardware::CPU.arm?
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.14.0/vulnlog-macos-aarch64.zip"
    sha256 "b6dac2db14e64625a5273f23d4128f449247b504e27c2bbb81686225c500b1be"
  else
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.14.0/vulnlog-0.14.0.zip"
    sha256 "66a6ddf076ff6e66302cc925420398c2d8b764ce38ff21d9caaa5cb9cb585eb8"
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
