# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "A dead simple way to go build, run your apps"
  homepage "https://github.com/hedzr/bgo"
  version "0.5.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.5.11/bgo-darwin-arm64.tgz"
      sha256 "03545bf8869cdfeca4179f175524aad8ade6197606b3830142e20813f84bd3b6"

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
      url "https://github.com/hedzr/bgo/releases/download/v0.5.11/bgo-darwin-amd64.tgz"
      sha256 "0412b16f16a597bb21b5ad0c83b0735edd3bca6377883416d5f367d7fdda6c70"

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
      url "https://github.com/hedzr/bgo/releases/download/v0.5.11/bgo-linux-amd64.tgz"
      sha256 "7b9792d64b171d8535adaefc2f1b003d5a2964d6e435c99877b528f188422582"

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
