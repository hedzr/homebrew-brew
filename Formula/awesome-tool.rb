class AwesomeTool < Formula
  desc "It is a CLI tool to retrieve the stars of all repos in an awesomeness-list"
  homepage "https://github.com/hedzr/awesome-tool"
  url "https://github.com/hedzr/awesome-tool/releases/download/v1.1.9/awesome-tool-v1.1.9-darwin-amd64.tgz"
  version "1.1.9"
  sha256 "7ddcc928cbdbb0924e7b93aed9ee749be79f32ec6bcdae4a71ea797665f5e83f"
  license "MIT"

  def install
    bin.install "bin/awesome-tool"
    etc.install Dir["etc/*"]
  end
end

# https://github.com/hedzr/awesome-tool/releases/download/v1.1.9/awesome-tool-v1.1.9-darwin-amd64.tgz
