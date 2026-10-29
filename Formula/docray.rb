class Docray < Formula
  desc "X-ray for documents: lossless PDF-to-JSON extraction with bounding boxes"
  homepage "https://f2-ai-inc.github.io/docray/"
  version "0.5.6"
  license any_of: ["MIT", "Apache-2.0"]

  BASE = "https://github.com/F2-AI-Inc/docray/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{BASE}/docray-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "5dfbbfeb352e1bab76932461bfefe069fdcb5dd37b516fda1a66416dea258f14"
    end
    on_intel do
      url "#{BASE}/docray-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "37d2eafcc039f2c65cc6b0b7556f026bf011bcdece58393e02a006db32480f84"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/docray-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ad24536cdce580829696cf8a96331b5d701df8ecfb7976dfff07e9d304ea837"
    end
    on_intel do
      url "#{BASE}/docray-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9577e4d670e37ab5bab66cdc7b71b24b5e74f29e16f40e94ad02eb9821a2b67d"
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
