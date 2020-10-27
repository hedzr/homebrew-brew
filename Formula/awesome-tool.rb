class AwesomeTool < Formula
  desc "It is a CLI tool to retrieve the stars of all repos in an awesomeness-list"
  homepage "https://github.com/hedzr/awesome-tool"
  url "https://github.com/hedzr/awesome-tool/releases/download/v1.1.10/awesome-tool-v1.1.10-darwin-amd64.tgz"
  version "1.1.10"
  sha256 "2ea92b0a13ebaacfa3908447e0cf706ccfc96e7efe3d353c08e76ed54e6b3734"
  license "MIT"

  def install
    bin.install "bin/awesome-tool"
    etc.install Dir["etc/*"]
  end
end

# https://github.com/hedzr/awesome-tool/releases/download/v1.1.10/awesome-tool-v1.1.10-darwin-amd64.tgz
