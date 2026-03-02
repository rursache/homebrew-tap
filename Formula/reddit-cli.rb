class RedditCli < Formula
  desc "Extract content from Reddit posts for AI agents and terminal use"
  homepage "https://github.com/rursache/reddit-cli"
  url "https://github.com/rursache/reddit-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a9cfc4c5e23b0105f8fe1e6723fc714d1de757465803ce5000575bde90665971"
  license "MIT"

  head "https://github.com/rursache/reddit-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
  end

  test do
    system "#{bin}/reddit-cli", "-v"
  end
end
