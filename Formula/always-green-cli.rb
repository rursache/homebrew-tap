class AlwaysGreenCli < Formula
  desc "Keep your Slack status green from a laptop or VPS you leave on"
  homepage "https://github.com/rursache/always-green-cli"
  url "https://github.com/rursache/always-green-cli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "eb31d8f42f328fcf9ebfc180a56a2a9d79282909667ffdcfb0dec1dd22cff19c"
  license "MIT"

  head "https://github.com/rursache/always-green-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/rursache/always-green-cli/internal/cli.version=#{version}"), "./cmd/always-green-cli"
    bin.install_symlink bin/"always-green-cli" => "always-green"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/always-green-cli --version")
    assert_match version.to_s, shell_output("#{bin}/always-green --version")
  end
end
