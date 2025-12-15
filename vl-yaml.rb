class VlYaml < Formula
  desc "Vulnlog with YAML files proof of concepts"
  homepage "https://github.com/vulnlog/vulnlog-poc"
  license "GPL-3.0"

  url "https://github.com/vulnlog/vulnlog-poc/releases/download/v0.6.0/vl-yaml-macos-arm64"
  sha256 "457633ba75e9bf3b569fd4a1acedf2080922f3ef2228bc678b23a70957b0f2dd"
  version "0.6.0"

  def install
    bin.install "vl-yaml-macos-arm64" => "vl-yaml"
  end

  test do
    system "#{bin}/vl-yaml", "--help"
  end
end
