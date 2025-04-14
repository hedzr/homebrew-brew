# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "Dead simple way to go build and go run your apps"
  homepage "https://github.com/hedzr/bgo"
  url "https://github.com/hedzr/bgo/releases/download/v0.5.31/bgo-darwin-arm64.tgz"
  version "0.5.25"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.5.31/bgo-darwin-arm64.tgz"
      sha256 "28655e764d0136bdcdabfe61302afd33586113d100ad3a2093dcdc754f6aa898"

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
      url "https://github.com/hedzr/bgo/releases/download/v0.5.31/bgo-darwin-amd64.tgz"
      sha256 "df8ce14ee33ae085345986e60df3b61b4c4ebdb8db88b847bc8f6ced8eb4e6a2"

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
      url "https://github.com/hedzr/bgo/releases/download/v0.5.31/bgo-linux-amd64.tgz"
      sha256 "596d0e2e22e9d15a05f7a434becaae00ac4717d2ad67892f02d3bd4c7640ed4e"

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
