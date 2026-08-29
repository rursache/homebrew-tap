class AlwaysGreen < Formula
  desc "Keep your Slack status green from a laptop or VPS you leave on"
  homepage "https://github.com/rursache/always-green-cli"
  url "https://github.com/rursache/always-green-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "834128cc746f5aaecdcb311aff66e54268834edf33dc620d4f80511b3182b093"
  license "MIT"

  head "https://github.com/rursache/always-green-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/rursache/always-green/internal/cli.version=#{version}"), "./cmd/always-green"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/always-green --version")
  end
end
