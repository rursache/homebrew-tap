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

    # Install AI skill files to share/loto-cli/skill
    pkgshare.install "skill"

    # Install setup script for AI skills
    (bin/"loto-cli-setup-skills").write <<~SH
      #!/bin/bash
      set -e
      SKILL_SRC="#{pkgshare}/skill"
      for parent in .agents .claude; do
        DEST="$HOME/$parent/skills/loto-cli"
        rm -rf "$DEST"
        mkdir -p "$DEST"
        cp -R "$SKILL_SRC"/* "$DEST"/
      done
      echo "AI skills installed to ~/.agents/skills/loto-cli and ~/.claude/skills/loto-cli"
    SH
  end

  def caveats
    <<~EOS
      To install AI skills for Claude Code and other agents, run:
        loto-cli-setup-skills
    EOS
  end

  test do
    system "#{bin}/loto-cli", "-v"
  end
end
