# typed: false
# frozen_string_literal: true

class ConsulTags < Formula
  desc "It is a CLI tool to update, add, remove the service tags at consul store"
  homepage "https://github.com/hedzr/consul-tags"
  url "https://github.com/hedzr/consul-tags/releases/download/v0.6.1/consul-tags-v0.6.1-darwin-amd64.tgz"
  version "0.6.1"
  sha256 "8a2ba08f649a23b38417d978346f2a0dff7a394257ca15685053730963260a26"
  license "MIT"

  def install
    bin.install "bin/consul-tags"
    etc.install Dir["etc/*"]
  end
end
