# typed: false
# frozen_string_literal: true

class AwesomeTool < Formula
  desc "Command-line tool to retrieve the stars of all repos in an awesome-list"
  # desc "It is a CLI tool to retrieve the stars of all repos in an awesomeness-list"
  homepage "https://github.com/hedzr/awesome-tool"
  url "https://github.com/hedzr/awesome-tool/releases/download/v1.1.11/awesome-tool-v1.1.11-darwin-amd64.tgz"
  version "v1.1.11"
  sha256 "027594a8e005ea6b893a544a18e5c98c8c152e80c52a17182d00a20057d99ad7"
  license "MIT"

  def install
    bin.install "bin/awesome-tool"
    etc.install Dir["etc/*"]
  end
end
