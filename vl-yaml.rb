class VlYaml < Formula
  desc "Vulnlog with YAML files proof of concepts"
  homepage "https://github.com/vulnlog/vulnlog-poc"
  license "GPL-3.0"

  url "https://github.com/vulnlog/vulnlog-poc/releases/download/v0.5.0/vl-yaml-macos-arm64"
  sha256 "1228953e64858d54372cb63ccb628daf5f122f712da500eb079c41d466a5804a"
  version "0.5.0"

  def install
    bin.install "vl-yaml-macos-arm64" => "vl-yaml"
  end

  test do
    system "#{bin}/vl-yaml", "--help"
  end
end
