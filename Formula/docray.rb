class Docray < Formula
  desc "X-ray for documents: lossless PDF-to-JSON extraction with bounding boxes"
  homepage "https://f2-ai-inc.github.io/docray/"
  version "0.3.1"
  license any_of: ["MIT", "Apache-2.0"]

  BASE = "https://github.com/F2-AI-Inc/docray/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{BASE}/docray-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d9e5b9ad6871ff9c28d4b8cd89d30ee9dfbfa8c34d20f08b0fb72edcb6beecb0"
    end
    on_intel do
      url "#{BASE}/docray-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a470dc95210c65c20e6f6a83e57c339a4e60bf1c13c7650828dec3ff5adf9a92"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/docray-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "313f26f496b5b4b7fae2d9a9c524747047540e85fbf8c1b2d9ed9e490df12305"
    end
    on_intel do
      url "#{BASE}/docray-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c59f44fd3480271db7c5757ba50e81d8006d5fa4b0b8b19506ecea0d0581a032"
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
