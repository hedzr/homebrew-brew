class ConsulTags < Formula
  desc "It is a CLI tool to update, add, remove the service tags at consul store"
  homepage "https://github.com/hedzr/consul-tags"
  url "https://github.com/hedzr/consul-tags/releases/download/v0.5.9/consul-tags-v0.5.9-darwin-amd64.tgz"
  version "0.5.9"
  sha256 "0bfe06134b58ba031fd321564aebb71ac8dc0e0258881c6b906810b675c7c790"
  license "MIT"

  def install
    bin.install "bin/consul-tags"
    etc.install Dir["etc/*"]
  end
end
