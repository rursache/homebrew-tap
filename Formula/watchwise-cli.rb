class WatchwiseCli < Formula
  desc "Smart movie & TV show recommender powered by your IMDB ratings"
  homepage "https://github.com/rursache/watchwise-cli"
  url "https://github.com/rursache/watchwise-cli/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "6fad2ccff1d408529d1265f37c26cda2f26d6c74514c6b39c6ef2401e8dd5c0d"
  license "MIT"

  head "https://github.com/rursache/watchwise-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}", output: bin/"watchwise"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/watchwise -v")
  end
end
