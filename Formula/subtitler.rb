class Subtitler < Formula
  desc "Cross-platform Java library and CLI utility for working with subtitles"
  homepage "https://github.com/caseyscarborough/subtitler"
  url "https://github.com/caseyscarborough/subtitler/releases/download/v2.0.0/subtitler-cli.zip"
  sha256 "c1d8c69e2384f1b4741a512cd6ff33a0f73b43b639c4a2fdc820d499f7171227"
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
