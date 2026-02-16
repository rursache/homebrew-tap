class LotoCli < Formula
  desc "Terminal-based interface for Loteria Romana (Romanian national lottery)"
  homepage "https://github.com/rursache/loto-cli"
  url "https://github.com/rursache/loto-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6ef90c07d6c18a5669f06d8c716ffb72355aec66f944bbba4eb89c3e177cfe10"
  license "MIT"

  head "https://github.com/rursache/loto-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
  end

  test do
    system "#{bin}/loto-cli", "-v"
  end
end
