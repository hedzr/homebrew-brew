# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "`bgo` is a super easy way to build your go apps"
  homepage "https://github.com/hedzr/bgo"
  version "0.2.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.11/bgo-darwin-arm64.tgz"
      sha256 "8e05a52b884c4c93f7113949cbe562c34045593a2e01213883f63a0ef17fc238"

      def install
        bin.install "./bgo"
        # etc.install Dir["etc/*"]
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.11/bgo-darwin-amd64.tgz"
      sha256 "bc1de8ec444e93c1cf200b9721343418c3d9b6605df326835d085a17086ebf4f"

      def install
        bin.install "./bgo"
        # etc.install Dir["etc/*"]
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.11/bgo-linux-amd64.tgz"
      sha256 "b98ae2f0c51b9e16a4e7c3f3c5a2091d07996a35944ac33958dc6649b179be6d"

      def install
        bin.install "./bgo"
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
