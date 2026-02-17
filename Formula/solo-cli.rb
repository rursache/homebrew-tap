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

    # Install AI skill files to share/solo-cli/skill
    pkgshare.install "skill"

    # Install setup script for AI skills
    (bin/"solo-cli-setup-skills").write <<~SH
      #!/bin/bash
      set -e
      SKILL_SRC="#{pkgshare}/skill"
      for parent in .agents .claude; do
        DEST="$HOME/$parent/skills/solo-cli"
        rm -rf "$DEST"
        mkdir -p "$DEST"
        cp -R "$SKILL_SRC"/* "$DEST"/
      done
      echo "AI skills installed to ~/.agents/skills/solo-cli and ~/.claude/skills/solo-cli"
    SH
  end

  def caveats
    <<~EOS
      To install AI skills for Claude Code and other agents, run:
        solo-cli-setup-skills
    EOS
  end

  test do
    system "#{bin}/solo-cli", "-v"
  end
end
