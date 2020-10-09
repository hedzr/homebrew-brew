class AwesomeTool < Formula
  desc "It is a CLI tool to retrieve the stars of all repos in an awesomeness-list"
  homepage "https://github.com/hedzr/awesome-tool"
  url "https://github.com/hedzr/awesome-tool/releases/download/v#{version}/awesome-tool-v#{version}-darwin-amd64.gz"
  version "1.1.1"
  sha256 "2b715af5a5a1d10d920fbdb5fa0c47925a9047e292b11dee891d2bc14371f943"

  def install
    bin.install "awesome-tool"
  end
end
