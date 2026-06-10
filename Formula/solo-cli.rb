class SoloCli < Formula
  desc "Terminal-based user interface for SOLO.ro (Romanian PFA accounting)"
  homepage "https://github.com/rursache/solo-cli"
  url "https://github.com/rursache/solo-cli/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "9db286956ff71b1da4327c53df478b0e7a0b0aaed6442a60ecc352d996302acc"
  license "MIT"

  head "https://github.com/rursache/solo-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
  end

  test do
    system "#{bin}/solo-cli", "-v"
  end
end
