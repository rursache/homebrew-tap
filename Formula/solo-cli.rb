class SoloCli < Formula
  desc "Terminal-based user interface for SOLO.ro (Romanian PFA accounting)"
  homepage "https://github.com/rursache/solo-cli"
  url "https://github.com/rursache/solo-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "31edc206a1045cf955ec90645a06d4d61fd4ec0c60ac478b59657e8886a17312"
  license "MIT"

  head "https://github.com/rursache/solo-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    system "#{bin}/solo-cli", "-v"
  end
end
