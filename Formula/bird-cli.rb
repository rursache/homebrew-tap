class BirdCli < Formula
  desc "CLI tool for Twitter/X"
  homepage "https://github.com/rursache/bird-bin"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rursache/bird-bin/releases/download/v0.8.0/bird-v0.8.0-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/rursache/bird-bin/releases/download/v0.8.0/bird-v0.8.0-darwin-x64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rursache/bird-bin/releases/download/v0.8.0/bird-v0.8.0-linux-x64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "bird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bird --version")
  end
end
