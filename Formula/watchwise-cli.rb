class WatchwiseCli < Formula
  desc "Smart movie & TV show recommender powered by your IMDB ratings"
  homepage "https://github.com/rursache/watchwise-cli"
  url "https://github.com/rursache/watchwise-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e4c03c7d2d3261de46011b76ea4b72e596cff2c93ac0ab552addb7d2364ce798"
  license "MIT"

  head "https://github.com/rursache/watchwise-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/watchwise-cli -v")
  end
end
