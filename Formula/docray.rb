class Docray < Formula
  desc "X-ray for documents: lossless PDF-to-JSON extraction with bounding boxes"
  homepage "https://f2-ai-inc.github.io/docray/"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  BASE = "https://github.com/F2-AI-Inc/docray/releases/download/v#{version}"

  on_macos do
    on_arm do
      url "#{BASE}/docray-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "600bf1d2eed7d187b7f3cfb21c6dbe48cb055bf413345a1c637b575f89040228"
    end
    on_intel do
      url "#{BASE}/docray-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "875aa993b12d088ca607511b3b1b2c77e737edc0da20334a07d6745769e3ad6a"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE}/docray-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a9445b93a4b0eb395c1101a5e50740ed8826c283c4323d28017a2aec5cddca3"
    end
    on_intel do
      url "#{BASE}/docray-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb49f77d216f7d11639d4500699df69decf52954ea1dd6255611b53e47bd4d2b"
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
