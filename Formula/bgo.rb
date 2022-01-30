# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "`bgo` is a super easy way to build your go apps"
  homepage "https://github.com/hedzr/bgo"
  version "0.2.17"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.17/bgo-darwin-arm64.tgz"
      sha256 "f6559ca19fce958aae708ba926bc2e993b1756db6b6540ce815daef86cbc6c31"

      def install
        bin.install "./bgo"
        # etc.install Dir["etc/*"]
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.17/bgo-darwin-amd64.tgz"
      sha256 "ea3e93d7357a1e0e96ed643925b3fb4a6f2474d1f9b474f713b3c56fb81c179b"

      def install
        # etc.install Dir["etc/*"]
        system "./bgo", "gen", "sh", "--bash", "-o", "bgo.bash"
        system "./bgo", "gen", "sh", "--zsh", "-o", "bgo.zsh"
        # system "./bgo", "gen", "man", "-d", "man1"
        zsh_completion.install "./bgo.zsh" => "_bgo"
        bash_completion.install "./bgo.bash" => "bgo"
        #man1.install "bgo.1"
        bin.install "./bgo"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.17/bgo-linux-amd64.tgz"
      sha256 "20112f1eb046a427680e49a2cbacc54a233e797751725251b143270c10364705"

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
