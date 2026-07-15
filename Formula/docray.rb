class Docray < Formula
  desc "X-ray for documents: lossless PDF-to-JSON extraction with bounding boxes"
  homepage "https://f2-ai-inc.github.io/docray/"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  BASE = "https://github.com/F2-AI-Inc/docray/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{BASE}/docray-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e6417851702d4e89c793a8fde7ed947348d048d0abab488ad4a40b5ad2eadf64"
    end
    on_intel do
      url "#{BASE}/docray-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "57407812b67f9a7b6e897f543fa55806fb143601c99611d3f731a24ff03aee6c"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/docray-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83da44fc163cb7167044efce1afea1e6b160c81b498ba8838a6379d999c286f4"
    end
    on_intel do
      url "#{BASE}/docray-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18f2b642633517f5dcff153c804ea76bc93451c9e2793b1d80b9e2bf3420e6dd"
    end
  end

  def install
    bin.install "bin/docray", "bin/docray-server"
    # The binaries locate libpdfium relative to their own path (../lib).
    lib.install Dir["lib/*"]
  end

  test do
    assert_match "docray", shell_output("#{bin}/docray extract --help")
  end
end
