class SoloCli < Formula
  desc "Terminal-based user interface for SOLO.ro (Romanian PFA accounting)"
  homepage "https://github.com/rursache/solo-cli"
  url "https://github.com/rursache/solo-cli/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "983f1cd1f099f3c61cd9510c16a3211ac992fffcbe861283d4f813949b294799"
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
