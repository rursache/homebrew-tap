class WatchwiseCli < Formula
  desc "Smart movie & TV show recommender powered by your IMDB ratings"
  homepage "https://github.com/rursache/watchwise-cli"
  url "https://github.com/rursache/watchwise-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "5f3d1bb955dc190289d0002af65aa1338a8c7db3df844f35d66eb1830529442c"
  license "MIT"

  head "https://github.com/rursache/watchwise-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match "WATCHWISE", shell_output("echo  | #{bin}/watchwise-cli 2>&1", 1)
  end
end
