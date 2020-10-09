class AwesomeTool < Formula
  desc "It is a CLI tool to retrieve the stars of all repos in an awesomeness-list"
  homepage "https://github.com/hedzr/awesome-tool"
  url "https://github.com/hedzr/awesome-tool/releases/download/v1.1.8/awesome-tool-v1.1.8-darwin-amd64.tgz"
  version "1.1.8"
  sha256 "b6aa3f3105063bbbfe600096486daadca9530ba351839c8252a01881337240e9"
  license "MIT"

  def install
    bin.install "awesome-tool"
  end
end

# https://github.com/hedzr/awesome-tool/releases/download/v1.1.8/awesome-tool-v1.1.8-darwin-amd64.tgz
