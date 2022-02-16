# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "`bgo` is a super easy way to build your go apps"
  homepage "https://github.com/hedzr/bgo"
  version "0.3.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.3.13/bgo-darwin-arm64.tgz"
      sha256 "014c7f41321310b103d1e80e61bcac338053d2c70d390e029ef8c5a12eef2cd4"

      def install
        etc.install Dir["etc/*"]
        system "./bin/bgo", "gen", "sh", "--bash", "-o", "bgo.bash"
        system "./bin/bgo", "gen", "sh", "--zsh", "-o", "bgo.zsh"
        # system "./bin/bgo", "gen", "man", "-d", "man1"
        zsh_completion.install "./bgo.zsh" => "_bgo"
        bash_completion.install "./bgo.bash" => "bgo"
        # man1.install "bgo.1"
        bin.install "./bin/bgo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.3.13/bgo-darwin-amd64.tgz"
      sha256 "7e900c478679a78ff0c9d1682090d2635b4728fcde6e15b43d2901e7295d2c72"

      def install
        etc.install Dir["etc/*"]
        system "./bin/bgo", "gen", "sh", "--bash", "-o", "bgo.bash"
        system "./bin/bgo", "gen", "sh", "--zsh", "-o", "bgo.zsh"
        # system "./bin/bgo", "gen", "man", "-d", "man1"
        zsh_completion.install "./bgo.zsh" => "_bgo"
        bash_completion.install "./bgo.bash" => "bgo"
        # man1.install "bgo.1"
        bin.install "./bin/bgo"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.3.13/bgo-linux-amd64.tgz"
      sha256 "36c12fd6f12b011cd5e185a2b7843ba09e97c0bd8ae62643081c1f25d86f0c36"

      def install
        etc.install Dir["etc/*"]
        system "./bin/bgo", "gen", "sh", "--bash", "-o", "bgo.bash"
        system "./bin/bgo", "gen", "sh", "--zsh", "-o", "bgo.zsh"
        # system "./bin/bgo", "gen", "man", "-d", "man1"
        zsh_completion.install "./bgo.zsh" => "_bgo"
        bash_completion.install "./bgo.bash" => "bgo"
        # man1.install "bgo.1"
        bin.install "./bin/bgo"
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
