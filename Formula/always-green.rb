class AlwaysGreen < Formula
  desc "Keep your Slack status green from a laptop or VPS you leave on"
  homepage "https://github.com/rursache/always-green"
  url "https://github.com/rursache/always-green/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7f986b1da1fa9125b43fb5edd740fd29bad75513fce8ef4aa80ceaa5b1aa43c6"
  license "MIT"

  head "https://github.com/rursache/always-green.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/rursache/always-green/internal/cli.version=#{version}"), "./cmd/always-green"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/always-green --version")
  end
end
