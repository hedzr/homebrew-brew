# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "`bgo` is a super easy way to build your go apps"
  homepage "https://github.com/hedzr/bgo"
  version "0.2.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.5/bgo-darwin-arm64.tgz"
      sha256 "248e60b67c98146bd0e3673b1f96bef82722c5d4330ee3b004caca0c8a2747e4"

      def install
        bin.install "bin/bgo"
        # etc.install Dir["etc/*"]
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.5/bgo-darwin-amd64.tgz"
      sha256 "0a05cb1e6e2d46809b958f73dfde05f2d13529fbc5ad13d499ff667f54d257ef"

      def install
        bin.install "bin/bgo"
        # etc.install Dir["etc/*"]
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.5/bgo-linux-amd64.tgz"
      sha256 "059326ede7560c90c7f564413abeb0d575866e760828bd4618a1878b8e6ce486"

      def install
        bin.install "bin/bgo"
        # etc.install Dir["etc/*"]
      end
    end
  end

  # depends_o n "git"
  # depends_o n "go"

  def caveats
    <<~EOS
      Generate the faked records via interactive console UI by
      using `bgo init` to create a new config file (`.bgo.yml`).
      Using `bgo` to start go building from current directory.
      Using `bgo [command] --help` to print the help screen.
    EOS
  end

  # https://kevin.burke.dev/kevin/install-homebrew-go/
  # https://github.com/create-go-app/homebrew-cli/blob/main/cgapp.rb
  # https://flowerinthenight.com/blog/2019/07/30/homebrew-golang
end
