class AwesomeTool < Formula
  desc "It is a CLI tool to retrieve the stars of all repos in an awesomeness-list"
  homepage "https://github.com/hedzr/awesome-tool"
  url "https://github.com/hedzr/awesome-tool/releases/download/v1.1.5/awesome-tool-v1.1.5-darwin-amd64.tgz"
  version "1.1.5"
  sha256 "6fa71bd688a619869694687e745c8ca596f868604b774f14eb07cb0704276d6c"

  def install
    bin.install "awesome-tool"
  end
end

# https://github.com/hedzr/awesome-tool/releases/download/v1.1.5/awesome-tool-v1.1.5-darwin-amd64.tgz
