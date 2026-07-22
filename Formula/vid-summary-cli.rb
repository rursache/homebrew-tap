class VidSummaryCli < Formula
  desc "Summarize videos via a yt-dlp -> ffmpeg -> whisper.cpp -> AI pipeline"
  homepage "https://github.com/rursache/vid-summary-cli"
  url "https://github.com/rursache/vid-summary-cli/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "4e96be5b9d9755a6804382e27c59a86f277356c8523171002f795e963361acfb"
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
