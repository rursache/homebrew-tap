class VidSummaryCli < Formula
  desc "Summarize videos via a yt-dlp -> ffmpeg -> whisper.cpp -> AI pipeline"
  homepage "https://github.com/rursache/vid-summary-cli"
  url "https://github.com/rursache/vid-summary-cli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "76a6d93b19a91bea2d8580f2352645b93cf586c4bebebc0f52f28acf74a042c9"
  license "MIT"

  head "https://github.com/rursache/vid-summary-cli.git", branch: "master"

  depends_on "go" => :build
  depends_on "ffmpeg"
  depends_on "whisper-cpp"
  depends_on "yt-dlp"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}"), "./cmd/vid-summary-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vid-summary-cli version")
  end
end
