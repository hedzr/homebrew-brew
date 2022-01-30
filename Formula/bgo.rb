# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "`bgo` is a super easy way to build your go apps"
  homepage "https://github.com/hedzr/bgo"
  version "0.2.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.13/bgo-darwin-arm64.tgz"
      sha256 "902bd9f562122cf43c64f5f7ccc34c1804b0c44e9cc3aee82d0605146c9059e8"

      def install
        bin.install "./bgo"
        # etc.install Dir["etc/*"]
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.13/bgo-darwin-amd64.tgz"
      sha256 "1ba119a421c9e8ce3c499d5adbbc0ddbd617e0afbd8e61a2e87e1066633e4f35"

      def install
        bin.install "./bgo"
        # etc.install Dir["etc/*"]
        system "./bgo", "gen", "sh", "--bash", "-o", "bgo.bash"
        system "./bgo", "gen", "sh", "--zsh", "-o", "bgo.zsh"
        #system "./bgo", "gen", "man", "-d", "man1"
        zsh_completion.install "./bgo.zsh" => "_bgo"
        bash_completion.install "./bgo.bash" => "bgo"
        #man1.install "bgo.1"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.13/bgo-linux-amd64.tgz"
      sha256 "7b72dd3d7126a0439ee052f98438a44b0425a212695cb084482f156c23de3019"

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
