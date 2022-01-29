# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "`bgo` is a super easy way to build your go apps"
  homepage "https://github.com/hedzr/bgo"
  version "0.2.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.7/bgo-darwin-arm64.tgz"
      sha256 "c689e4c798b0255d0478c354f42c3d0f8d51f5f3c4acbdf996e51e9f6c19ec3b"

      def install
        bin.install "bin/bgo"
        # etc.install Dir["etc/*"]
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.7/bgo-darwin-amd64.tgz"
      sha256 "13ecb616a30dffd47eb4a69f7749fea4aaceec85b5d8b34c1bc92d6ee590b355"

      def install
        bin.install "bin/bgo"
        # etc.install Dir["etc/*"]
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.7/bgo-linux-amd64.tgz"
      sha256 "689c1aade8a2cd00495dcf789501bf930aef7afd5bd373b9058a01b65fd00ecf"

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
