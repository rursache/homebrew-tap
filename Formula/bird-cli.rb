class BirdCli < Formula
  desc "CLI tool for Twitter/X"
  homepage "https://github.com/rursache/bird-bin"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rursache/bird-bin/releases/download/v0.8.1/bird-v0.8.1-darwin-arm64.tar.gz"
      sha256 "86228d5425b300bd9bb146fb35596a77f8d5b5338ac16e8e024044c677457967"
    end
    on_intel do
      url "https://github.com/rursache/bird-bin/releases/download/v0.8.1/bird-v0.8.1-darwin-x64.tar.gz"
      sha256 "ee0d1d6bf2653745b04460fac01a4060b04faad9f19950e65d63c078ba7f621c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rursache/bird-bin/releases/download/v0.8.1/bird-v0.8.1-linux-x64.tar.gz"
      sha256 "1e34c3eef3fd80f94aa77740e7295b2490d4f90b84a5d8228fe764ed26cb1436"
    end
  end

  def install
    bin.install "bird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bird --version")
  end
end
