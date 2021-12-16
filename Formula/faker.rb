# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/faker
#

class Faker < Formula
  desc "`faker` will generate the faked records"
  homepage "https://github.com/hedzr/go-faker"
  version "0.2.6-alpha18"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/go-faker/releases/download/v0.2.6-alpha18/faker-darwin-arm64.tgz"
      sha256 "1041867cefc6ba11cbf0389df907776bd3252006c050e713d9462c1ba05d80b7"

      def install
        bin.install "bin/faker"
        etc.install Dir["etc/*"]
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/go-faker/releases/download/v0.2.6-alpha18/faker-darwin-amd64.tgz"
      sha256 "e6995c945ee5e670a4a38c9f0ceadff25dc89dc9964192da136894156a662d25"

      def install
        bin.install "bin/faker"
        etc.install Dir["etc/*"]
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/go-faker/releases/download/v0.2.6-alpha18/faker-linux-amd64.tgz"
      sha256 "807e7658349c148ca835cf176e5a93d2827ad5c70f8ecaa945b6ea9f4b0461b1"

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
