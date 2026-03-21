class WatchwiseCli < Formula
  desc "Smart movie & TV show recommender powered by your IMDB ratings"
  homepage "https://github.com/rursache/watchwise-cli"
  url "https://github.com/rursache/watchwise-cli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "a5dfa87bfa3e6e7386d9df954f2f51f838544411eab18e619912a09805dfe8a1"
  license "MIT"

  head "https://github.com/rursache/watchwise-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/watchwise-cli -v")
  end
end
