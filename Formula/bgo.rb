# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/bgo
#

class Bgo < Formula
  desc "`bgo` is a super easy way to build your go apps"
  homepage "https://github.com/hedzr/bgo"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/bgo/releases/download/v0.3.0/bgo-darwin-arm64.tgz"
      sha256 "8c56f507619f3435fb76bbf9ae8efc7929adab9df6b55d59dda7eb4ea77fc068"

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
      url "https://github.com/hedzr/bgo/releases/download/v0.3.0/bgo-darwin-amd64.tgz"
      sha256 "a9db160f0effece742e1de3990a11664e1107ce740f83a70c9f4b51f654f26fa"

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
      url "https://github.com/hedzr/bgo/releases/download/v0.3.0/bgo-linux-amd64.tgz"
      sha256 "8d898d6eda727b79e94619e70b52aa79c128296c1da467fdeec56bd0faa4069c"

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
