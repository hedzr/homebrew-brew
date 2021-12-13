# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/faker
#

class Faker < Formula
  desc "`faker` will generate the faked records"
  homepage "https://github.com/hedzr/go-faker"
  version "0.2.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/go-faker/releases/download/v0.2.4/faker-darwin-arm64.tgz"
      sha256 "e86c064e56cbae7d786fe56982ea81398a32d661eb10685209edebe33a758a55"

      def install
        bin.install "bin/faker"
        etc.install Dir["etc/*"]
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/go-faker/releases/download/v0.2.4/faker-darwin-amd64.tgz"
      sha256 "c1bfb854f738d5e0a3b5736aafe16d0bec7b768346f7ad066931c40a710d51ca"

      def install
        bin.install "bin/faker"
        etc.install Dir["etc/*"]
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/go-faker/releases/download/v0.2.4/faker-linux-amd64.tgz"
      sha256 "7b3fd195fc54ab9addd7448877dffe10c00d7eab46227100f45a22c9d5ec32a1"

      def install
        bin.install "bin/faker"
        etc.install Dir["etc/*"]
      end
    end
  end

  # depends_o n "git"
  # depends_o n "go"

  def caveats
    <<~EOS
      Generate the faked records via interactive console UI by
      using `faker [commands]`.
      Using `faker [command] --help` to print the help screen.
    EOS
  end

  # https://kevin.burke.dev/kevin/install-homebrew-go/
  # https://github.com/create-go-app/homebrew-cli/blob/main/cgapp.rb
  # https://flowerinthenight.com/blog/2019/07/30/homebrew-golang
end
