class VidSummaryCli < Formula
  desc "Summarize videos via a yt-dlp -> ffmpeg -> whisper.cpp -> AI pipeline"
  homepage "https://github.com/rursache/vid-summary-cli"
  url "https://github.com/rursache/vid-summary-cli/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "f59e960d8ea0fdc8de233b539ef74e3d1fd62bba71d0c67893de7106c366b941"
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
