# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "`bgo` is a super easy way to build your go apps"
  homepage "https://github.com/hedzr/bgo"
  version "0.2.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.6/bgo-darwin-arm64.tgz"
      sha256 "48ae236dda011b893a9a8a66ea4bab98deee77cbccdeebff5760dac31a59e51c"

      def install
        bin.install "bin/bgo"
        #etc.install Dir["etc/*"]
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.6/bgo-darwin-amd64.tgz"
      sha256 "8b490a7b44d8fb09c881ea6713b44c5ec34be18943a0d9ab434de4b89ca3bf02"

      def install
        bin.install "bin/bgo"
        #etc.install Dir["etc/*"]
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/bgo/releases/download/v0.2.6/bgo-linux-amd64.tgz"
      sha256 "d2b4f756d1f22bba689b563a5ddea7f915c5fe4eefbba2ac01ca7a322b843511"

      def install
        bin.install "bin/bgo"
        #etc.install Dir["etc/*"]
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
