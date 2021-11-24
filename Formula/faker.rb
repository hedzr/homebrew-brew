# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/faker
#

class Faker < Formula
  desc "`faker` will generate the faked records"
  homepage "https://github.com/hedzr/go-faker"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/go-faker/releases/download/v0.2.1/faker-darwin-arm64.tgz"
      sha256 "a5c0569cb67708cc34f3e657eba66d0f0974bbbaf4fa7dc79ab60a3dff983f90"

      def install
        bin.install "bin/faker"
        etc.install Dir["etc/*"]
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/go-faker/releases/download/v0.2.1/faker-darwin-amd64.tgz"
      sha256 "5640a298b37f1d4bb540edae608e7816641c4242b4502dda07e548b185a543ad"

      def install
        bin.install "bin/faker"
        etc.install Dir["etc/*"]
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/go-faker/releases/download/v0.2.1/faker-linux-amd64.gz"
      sha256 "216e417bfa7b9a856a5f62e7a826b5e9013bfaf13446baeff064ec8d9b15a05f"

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
