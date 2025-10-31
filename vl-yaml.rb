class VlYaml < Formula
  desc "Vulnlog with YAML files proof of concepts"
  homepage "https://github.com/vulnlog/vulnlog-poc"
  license "GPL-3.0"

  url "https://github.com/vulnlog/vulnlog-poc/releases/download/v0.4.1/vl-yaml-macos-arm64"
  sha256 "be45bacecbed608539987fd4d829ddfb28a1f1bc296d72c1205ebbbd25c42253"
  version "0.4.1"

  def install
    bin.install "vl-yaml-macos-arm64" => "vl-yaml"
  end

  test do
    system "#{bin}/vl-yaml", "--help"
  end
end
