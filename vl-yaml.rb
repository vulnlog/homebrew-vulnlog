class VlYaml < Formula
  desc "Vulnlog with YAML files proof of concepts"
  homepage "https://github.com/vulnlog/vulnlog-poc"
  license "GPL-3.0"

  url "https://github.com/vulnlog/vulnlog-poc/releases/download/v0.4.1/vl-yaml-macos-arm64"
  sha256 "2ec19ae64423aaf564bae6f99e0d6271ee959177f34d87e28db4709de41cdfdf"
  version "0.4.1"

  def install
    bin.install "vl-yaml-macos-arm64" => "vl-yaml"
  end

  test do
    system "#{bin}/vl-yaml", "--help"
  end
end
