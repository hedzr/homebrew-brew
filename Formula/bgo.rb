# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "`bgo` is a super easy way to build your go apps"
  homepage "https://github.com/hedzr/bgo"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.3.1/bgo-darwin-arm64.tgz"
      sha256 "6d8993ba684c39f4e6aab647adfa97aa7245d7edc8ec147371e267665e1fd183"

      def install
        # etc.install Dir["etc/*"]
        system "./bgo", "gen", "sh", "--bash", "-o", "bgo.bash"
        system "./bgo", "gen", "sh", "--zsh", "-o", "bgo.zsh"
        # system "./bgo", "gen", "man", "-d", "man1"
        zsh_completion.install "./bgo.zsh" => "_bgo"
        bash_completion.install "./bgo.bash" => "bgo"
        # man1.install "bgo.1"
        bin.install "./bgo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.3.1/bgo-darwin-amd64.tgz"
      sha256 "1bdac3f0cf89689dcde77f200014b282ece90211518990861f3aaa6653aa720b"

      def install
        # etc.install Dir["etc/*"]
        system "./bgo", "gen", "sh", "--bash", "-o", "bgo.bash"
        system "./bgo", "gen", "sh", "--zsh", "-o", "bgo.zsh"
        # system "./bgo", "gen", "man", "-d", "man1"
        zsh_completion.install "./bgo.zsh" => "_bgo"
        bash_completion.install "./bgo.bash" => "bgo"
        # man1.install "bgo.1"
        bin.install "./bgo"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.3.1/bgo-linux-amd64.tgz"
      sha256 "ec923b60a26a06105180d4c78ce72d74d5cc4fa0efac7b57c8988c47fb85d040"

      def install
        # etc.install Dir["etc/*"]
        system "./bgo", "gen", "sh", "--bash", "-o", "bgo.bash"
        system "./bgo", "gen", "sh", "--zsh", "-o", "bgo.zsh"
        # system "./bgo", "gen", "man", "-d", "man1"
        zsh_completion.install "./bgo.zsh" => "_bgo"
        bash_completion.install "./bgo.bash" => "bgo"
        # man1.install "bgo.1"
        bin.install "./bgo"
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
