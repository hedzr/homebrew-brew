class ConsulTags < Formula
  desc "It is a CLI tool to update, add, remove the service tags at consul store"
  homepage "https://github.com/hedzr/consul-tags"
  url "https://github.com/hedzr/consul-tags/releases/download/v0.5.6/consul-tags-v0.5.6-darwin-amd64.tgz"
  version "0.5.6"
  sha256 "b6aa3f3105063bbbfe600096486daadca9530ba351839c8252a01881337240e9"
  license "MIT"

  def install
    bin.install "bin/consul-tags"
    etc.install Dir["etc/*"]
  end
end
