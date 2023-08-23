class Subtitler < Formula
  desc "Cross-platform Java library and CLI utility for working with subtitles"
  homepage "https://github.com/caseyscarborough/subtitler"
  url "https://github.com/caseyscarborough/subtitler/releases/download/2.0.0/subtitler-cli.zip"
  sha256 "4945f5edac9401ee4b7f69da9d91853c56d333eb6a6a118cc07ac577272360b6"
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
