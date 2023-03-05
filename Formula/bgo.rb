# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "Dead simple way to go build and go run your apps"
  homepage "https://github.com/hedzr/bgo"
  version "0.5.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.5.13/bgo-darwin-arm64.tgz"
      sha256 "082e167900d21c507ace0684e3fbea7753863ab894fe38a1a02eab4d5ea24024"

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
      url "https://github.com/hedzr/bgo/releases/download/v0.5.13/bgo-darwin-amd64.tgz"
      sha256 "ec936ab65b2c5fe62aea494d0fbe8a28ce7076fa63423ef9ce077daee9f068b3"

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
      url "https://github.com/hedzr/bgo/releases/download/v0.5.13/bgo-linux-amd64.tgz"
      sha256 "da6573ca5648faffe27f18f4afe32f47a7456d59a44ec071499d4578444a5c66"

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
