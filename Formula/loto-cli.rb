class LotoCli < Formula
  desc "Terminal-based interface for Loteria Romana (Romanian national lottery)"
  homepage "https://github.com/rursache/loto-cli"
  url "https://github.com/rursache/loto-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6ef90c07d6c18a5669f06d8c716ffb72355aec66f944bbba4eb89c3e177cfe10"
  license "MIT"

  head "https://github.com/rursache/loto-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/".loto-cli-bin", ldflags: "-s -w -X main.version=#{version}"), "."

    # Install AI skill files
    pkgshare.install "skill"

    # Wrapper script: installs skills on first run, then execs the real binary
    (bin/"loto-cli").write <<~SH
      #!/bin/bash
      SKILL_SRC="#{pkgshare}/skill"
      if [ ! -f "$HOME/.claude/skills/loto-cli/SKILL.md" ] || [ "$SKILL_SRC/SKILL.md" -nt "$HOME/.claude/skills/loto-cli/SKILL.md" ]; then
        for parent in .agents .claude; do
          DEST="$HOME/$parent/skills/loto-cli"
          rm -rf "$DEST"
          mkdir -p "$DEST"
          cp -R "$SKILL_SRC"/* "$DEST"/
        done
      fi
      exec "#{bin}/.loto-cli-bin" "$@"
    SH
  end

  test do
    system "#{bin}/loto-cli", "-v"
  end
end
