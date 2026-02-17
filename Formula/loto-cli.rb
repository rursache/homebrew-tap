class LotoCli < Formula
  desc "Terminal-based interface for Loteria Romana (Romanian national lottery)"
  homepage "https://github.com/rursache/loto-cli"
  url "https://github.com/rursache/loto-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "8abfc0004276c59a5fd5d0398b55ddb1c428d50f5fc73c1b13f51fbfa60414ad"
  license "MIT"

  head "https://github.com/rursache/loto-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
  end

  test do
    system "#{bin}/loto-cli", "-v"
  end
end
