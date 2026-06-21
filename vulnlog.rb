class Vulnlog < Formula
  desc "Supply chain security, as code: track SCA vulnerability findings"
  homepage "https://github.com/vulnlog/vulnlog"
  license "Apache-2.0"
  version "0.15.0"

  if Hardware::CPU.arm?
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.15.0/vulnlog-macos-aarch64.zip"
    sha256 "11a8cf5edea9600e7e21db7bd715b2c24e8eac6047bd3a3e970c715ec0f262c1"
  else
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.15.0/vulnlog-0.15.0.zip"
    sha256 "b1a4aa69986566603c7a642e828ca3e2ec0bc3cd400b3d750727294e97fed38e"
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
