class Docray < Formula
  desc "X-ray for documents: lossless PDF-to-JSON extraction with bounding boxes"
  homepage "https://f2-ai-inc.github.io/docray/"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  BASE = "https://github.com/F2-AI-Inc/docray/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{BASE}/docray-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "edc0b65064050bdfae9aaac401d3ad5ef7623de5b3b82774f2f842ae7b83d744"
    end
    on_intel do
      url "#{BASE}/docray-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "745d62e7e5484d80650951dd63babc1b50ed801f1840524aa15c4ca5787c3b80"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/docray-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9694c1083a12a0002a123ad48e799edc759cc3a0c1e7d1c8e6b6ca6418d341f3"
    end
    on_intel do
      url "#{BASE}/docray-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9b4fe6e47e6362e25d88e21abc7e59c691688da8982eabad7f81933eabc97cc"
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
