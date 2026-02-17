class SoloCli < Formula
  desc "Terminal-based user interface for SOLO.ro (Romanian PFA accounting)"
  homepage "https://github.com/rursache/solo-cli"
  url "https://github.com/rursache/solo-cli/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "983f1cd1f099f3c61cd9510c16a3211ac992fffcbe861283d4f813949b294799"
  license "MIT"

  head "https://github.com/rursache/solo-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."

    # Install AI skill files
    pkgshare.install "skill"
  end

  def post_install
    %w[.agents .claude].each do |parent|
      skill_dir = Pathname.new(Dir.home)/parent/"skills"/"solo-cli"
      rm_rf skill_dir
      mkdir_p skill_dir
      cp_r (pkgshare/"skill").children, skill_dir
    end
  end

  test do
    system "#{bin}/solo-cli", "-v"
  end
end
