# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/cmdr-cli
#

class CmdrCli < Formula
  desc "Project and commands code generation tool for Go CLI apps based on hedzr/cmdr"
  
  homepage "https://github.com/hedzr/cmdr-cli"
  url "https://github.com/hedzr/cmdr-cli/releases/download/v0.0.5/cmdr-cli-darwin-arm64.tgz"
  version "0.0.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedzr/cmdr-cli/releases/download/v0.0.5/cmdr-cli-darwin-arm64.tgz"
      sha256 "28655e764d0136bdcdabfe61302afd33586113d100ad3a2093dcdc754f6aa898"

      def install
        etc.install Dir["etc/*"]
        system "./bin/cmdr", "gen", "sh", "--bash", "-o", "cmdr.bash"
        system "./bin/cmdr", "gen", "sh", "--zsh", "-o", "cmdr.zsh"
        # system "./bin/cmdr", "gen", "man", "-d", "man1"
        zsh_completion.install "./cmdr.zsh" => "_cmdr"
        bash_completion.install "./cmdr.bash" => "cmdr"
        # man1.install "cmdr.1"
        bin.install "./bin/cmdr"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/cmdr-cli/releases/download/v0.5.31/cmdr-cli-darwin-amd64.tgz"
      sha256 "df8ce14ee33ae085345986e60df3b61b4c4ebdb8db88b847bc8f6ced8eb4e6a2"

      def install
        etc.install Dir["etc/*"]
        system "./bin/cmdr", "gen", "sh", "--bash", "-o", "cmdr.bash"
        system "./bin/cmdr", "gen", "sh", "--zsh", "-o", "cmdr.zsh"
        # system "./bin/cmdr", "gen", "man", "-d", "man1"
        zsh_completion.install "./cmdr.zsh" => "_cmdr"
        bash_completion.install "./cmdr.bash" => "cmdr"
        # man1.install "cmdr.1"
        bin.install "./bin/cmdr"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/hedzr/cmdr-cli/releases/download/v0.5.31/cmdr-cli-linux-amd64.tgz"
      sha256 "596d0e2e22e9d15a05f7a434becaae00ac4717d2ad67892f02d3bd4c7640ed4e"

      def install
        etc.install Dir["etc/*"]
        system "./bin/cmdr", "gen", "sh", "--bash", "-o", "cmdr.bash"
        system "./bin/cmdr", "gen", "sh", "--zsh", "-o", "cmdr.zsh"
        # system "./bin/cmdr", "gen", "man", "-d", "man1"
        zsh_completion.install "./cmdr.zsh" => "_cmdr"
        bash_completion.install "./cmdr.bash" => "cmdr"
        # man1.install "cmdr.1"
        bin.install "./bin/cmdr"
      end
    end
  end

  # depends_o n "git"
  # depends_o n "go"

  def caveats
    <<~EOS
      Generate the faked records via interactive console UI by
      using `cmdr init` to create a new golang project.
      Using `cmdr new cmd|flg` to start go building from current directory.
      Using `cmdr [command] --help` to print the help screen.

	  A Short Guide:

	    $ cmdr new --output=/tmp/myapp myapp
	    $ cmdr new cmd --cwd=/tmp/myapp 'server.create.it.here' hr --force
	    $ cmdr new flg --cwd=/tmp/myapp 'server.create.auto-start' 'bool:false' --force
	    $ cmdr run --cwd=/tmp/myapp -- --help
	    $ cmdr run --cwd=/tmp/myapp -- ~~tree
		$ cd /tmp/myapp
		$ go build -o ./bin/ ./...
		$ ./bin/myapp --help

    EOS
  end

  # https://kevin.burke.dev/kevin/install-homebrew-go/
  # https://github.com/create-go-app/homebrew-cli/blob/main/cgapp.rb
  # https://flowerinthenight.com/blog/2019/07/30/homebrew-golang
end
