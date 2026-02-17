class SoloCli < Formula
  desc "Terminal-based user interface for SOLO.ro (Romanian PFA accounting)"
  homepage "https://github.com/rursache/solo-cli"
  url "https://github.com/rursache/solo-cli/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "983f1cd1f099f3c61cd9510c16a3211ac992fffcbe861283d4f813949b294799"
  license "MIT"

  head "https://github.com/rursache/solo-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/".solo-cli-bin", ldflags: "-s -w -X main.version=#{version}"), "."

    # Install AI skill files
    pkgshare.install "skill"

    # Wrapper script: installs skills on first run, then execs the real binary
    (bin/"solo-cli").write <<~SH
      #!/bin/bash
      SKILL_SRC="#{pkgshare}/skill"
      if [ ! -f "$HOME/.claude/skills/solo-cli/SKILL.md" ] || [ "$SKILL_SRC/SKILL.md" -nt "$HOME/.claude/skills/solo-cli/SKILL.md" ]; then
        for parent in .agents .claude; do
          DEST="$HOME/$parent/skills/solo-cli"
          rm -rf "$DEST"
          mkdir -p "$DEST"
          cp -R "$SKILL_SRC"/* "$DEST"/
        done
      fi
      exec "#{bin}/.solo-cli-bin" "$@"
    SH
  end

  test do
    system "#{bin}/solo-cli", "-v"
  end
end
