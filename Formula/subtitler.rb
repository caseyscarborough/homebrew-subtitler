class Subtitler < Formula
  desc "A cross-platform, full-featured Java library and CLI utility for working with subtitles."
  homepage "https://github.com/caseyscarborough/subtitler"
  url "https://github.com/caseyscarborough/subtitler/releases/download/1.0.2/subtitler.zip"
  sha256 "23bf671ca253d4f0bb99e0954c71473a7c391fb2253ecf0adc72ad7e798475a9"
  version "1.0.2"
  depends_on "openjdk@11"

  def install
  	rm Dir["bin/subtitler.bat"]
  	chmod 0755, "bin/subtitler"
    libexec.install Dir["*"]
    bin.install libexec/"bin/subtitler"
  end
end