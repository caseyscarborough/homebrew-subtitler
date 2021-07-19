class Subtitler < Formula
  desc "Cross-platform Java library and CLI utility for working with subtitles"
  homepage "https://github.com/caseyscarborough/subtitler"
  url "https://github.com/caseyscarborough/subtitler/releases/download/1.1.1/subtitler.zip"
  sha256 "58a937941e20cc28fdad9777c3e4384ef8f8278c268f0084be36993124ee47f0"
  license "MIT"

  depends_on "openjdk@11"

  def install
    rm "bin/subtitler.bat"
    chmod 0755, "bin/subtitler"
    bin.install "bin/subtitler"
    (libexec/"lib").install Dir["lib/*"]

    bin.env_script_all_files(libexec/"bin", JAVA_HOME: Formula["openjdk@11"].opt_prefix)
  end

  test do
    assert_match "Subtitler", shell_output("#{bin}/subtitler -v")
  end
end
