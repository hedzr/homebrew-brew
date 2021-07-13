# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class AwesomeTool < Formula
  desc "A command-line tool to retrieve the stars of all repos in an awesome-list"
  # desc "It is a CLI tool to retrieve the stars of all repos in an awesomeness-list"
  homepage "https://github.com/hedzr/awesome-tool"
  version "1.1.10"
  url "https://github.com/hedzr/awesome-tool/releases/download/v1.1.11/awesome-tool-v1.1.11-darwin-amd64.tgz"
  sha256 "027594a8e005ea6b893a544a18e5c98c8c152e80c52a17182d00a20057d99ad7"
  # url "https://github.com/hedzr/awesome-tool/releases/download/v1.1.10/awesome-tool-v1.1.10-darwin-amd64.tgz"
  # sha256 "2ea92b0a13ebaacfa3908447e0cf706ccfc96e7efe3d353c08e76ed54e6b3734"
  license "MIT"

  # depends_on "go" => :build
  #
  # def install
  #   # ENV.deparallelize  # if your formula fails when building in parallel
  # 
  #   # ENV["GOPROXY"] = "https://goproxy.io"
  #   # system "make"
  #
  #   system "go", "build", *std_go_args
  # end

  def install
    bin.install "bin/awesome-tool"
    etc.install Dir["etc/*"]
  end
end

