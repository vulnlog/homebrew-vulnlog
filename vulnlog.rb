class Vulnlog < Formula
  desc "Supply chain security, as code: track SCA vulnerability findings"
  homepage "https://github.com/vulnlog/vulnlog"
  license "Apache-2.0"
  version "0.17.0"

  if Hardware::CPU.arm?
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.17.0/vulnlog-macos-aarch64.zip"
    sha256 "36b401e47e9efec6096f7e84f546c6180e4018c888e5913fd1e696b14eedf21f"
  else
    url "https://github.com/vulnlog/vulnlog/releases/download/v0.17.0/vulnlog-0.17.0.zip"
    sha256 "b73f76d5c93912613632c89276d207840d6f50157d173cc550a94d2fd96e1c05"
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
