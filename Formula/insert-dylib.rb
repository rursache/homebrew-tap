class InsertDylib < Formula
  desc "Command line utility for inserting a dylib load command into a Mach-O binary"
  homepage "https://github.com/tyilo/insert_dylib"
  url "https://github.com/tyilo/insert_dylib/archive/eb7278162af8fcc372e7f2946a2dee6a386b17d8.tar.gz"
  version "1.0"
  sha256 "016e385412187f18f22fcfb5067b24bbf3176fc9541df44104294c1ed25ad93d"
  license "MIT"

  head "https://github.com/tyilo/insert_dylib.git", branch: "master"

  depends_on :macos

  def install
    system ENV.cc, "-O2", "-o", "build_output", "insert_dylib/main.c"
    bin.install "build_output" => "insert_dylib"
  end

  test do
    system "#{bin}/insert_dylib"
  end
end
