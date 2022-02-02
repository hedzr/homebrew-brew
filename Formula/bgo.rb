# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "`bgo` is a super easy way to build your go apps"
  homepage "https://github.com/hedzr/bgo"
  version "0.3.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.3.3/bgo-darwin-arm64.tgz"
      sha256 "627c4df16cb51a2003852b5be153207d2029602b8a33166485fff0f472809342"

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
      url "https://github.com/hedzr/bgo/releases/download/v0.3.3/bgo-darwin-amd64.tgz"
      sha256 "c35820cf867099b51ab8909090c46e6b4c00fd0775a58beaa44984b50d7ad6a1"

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
      url "https://github.com/hedzr/bgo/releases/download/v0.3.3/bgo-linux-amd64.tgz"
      sha256 "84bd01779dae7b29f6c3d5d48e84d1510b3ff8d988efe9862588e3476c1ca7e3"

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
