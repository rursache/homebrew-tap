class VidSummaryCli < Formula
  desc "Summarize videos via a yt-dlp -> ffmpeg -> whisper.cpp -> AI pipeline"
  homepage "https://github.com/rursache/vid-summary-cli"
  url "https://github.com/rursache/vid-summary-cli/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "a9f71a4bfb441ae26c1cbb4e9a9ded776034517bd07ea3e66fc982fea0593737"
  license "MIT"

  head "https://github.com/rursache/vid-summary-cli.git", branch: "master"

  depends_on "go" => :build
  depends_on "ffmpeg"
  depends_on "whisper-cpp"
  depends_on "yt-dlp"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}"), "./cmd/vid-summary-cli"
    bin.install_symlink "vid-summary-cli" => "video-summary"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vid-summary-cli version")
  end
end
