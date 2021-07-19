class Subtitler < Formula
  desc "Cross-platform Java library and CLI utility for working with subtitles"
  homepage "https://github.com/caseyscarborough/subtitler"
  url "https://github.com/caseyscarborough/subtitler/releases/download/#{version}/subtitler.zip"
  version "1.0.3"
  sha256 "052a3f9fc59e586ddd3bf1b532d7f7cf5d05b8c3bc7a66c6479abccdddd65daa"
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
    assert_match "Subtitler v#{version}", shell_output("#{bin}/subtitler -v")
  end
end
