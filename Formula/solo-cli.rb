class SoloCli < Formula
  desc "Terminal-based user interface for SOLO.ro (Romanian PFA accounting)"
  homepage "https://github.com/rursache/solo-cli"
  url "https://github.com/rursache/solo-cli/archive/refs/tags/v1.7.1.tar.gz"
  sha256 "7f764f613a64f87aed9b60e6b7d87754b0ec1496eb829d79f890e8257ced5640"
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
