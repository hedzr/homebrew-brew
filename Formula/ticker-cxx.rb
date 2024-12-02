# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/ticker-cxx
#

class TickerCxx < Formula
  desc "C++17 Library to provide timing and trigger abilities"
  homepage "https://github.com/hedzr/ticker-cxx"
  url "https://github.com/hedzr/ticker-cxx.git",
      tag:      "v0.2.9",
      revision: "cb146f5c3e45f0991815362b3c6288c173f836af"
  license "Apache-2.0"
  version_scheme 1
  head "https://github.com/hedzr/ticker-cxx.git"

  #   bottle do
  #     sha256 cellar: :any_skip_relocation, catalina:    "asdf"
  #     sha256 cellar: :any_skip_relocation, high_sierra: "asdf"
  #     sha256 cellar: :any_skip_relocation, sierra:      "asdf"
  #     sha256 cellar: :any_skip_relocation, el_capitan:  "asdf"
  #   end

  # depends # _on "catch2" => [:build, :test]
  # we need newest cmake bundled with homebrew/core
  depends_on "cmake" => :build
  depends_on xcode: "12.0"
  # conflicts_with "hicc-cxx", because: "hicc-cxx also ships most experimental codes similar with cmdr-cxx"

  def install
    ENV.deparallelize
    # rm "LICENSE"

    # system "make", "PREFIX=#{prefix}", "install"
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    # make a binary installing directly:
    # # system "tar -Jvxf awesome-tool-darwin-0.2.3.tar.zx"
    # bin.install 'awesome-tool' # copy the executable into /usr/local/bin/
    # bin.install "#{bin}/cmdr_cli"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test hicc-cxx-new`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    #
    system "true"
    # outputs = shell_output("#{bin}/cmdr_cli")
    # assert_match(/Hello, World!/m, outputs)
  end
end
