# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/cmdr-cxx
#

class CmdrCxx < Formula
  desc "C++17/20 Library to provide command-line argument parser and framework"
  homepage "https://github.com/hedzr/cmdr-cxx"
  url "https://github.com/hedzr/cmdr-cxx.git",
      tag:      "v0.5.11",
      revision: "73ca3525e18220d659c7271732f48753ba921f65"
  license "Apache 2.0"
  version_scheme 1
  head "https://github.com/hedzr/cmdr-cxx.git"

  #   bottle do
  #     sha256 cellar: :any_skip_relocation, catalina:    "asdf"
  #     sha256 cellar: :any_skip_relocation, high_sierra: "asdf"
  #     sha256 cellar: :any_skip_relocation, sierra:      "asdf"
  #     sha256 cellar: :any_skip_relocation, el_capitan:  "asdf"
  #   end

  # depends # _on "catch2" => [:build, :test]
  depends_on "cmake" => :build  # we need newest cmake bundled with homebrew/core
  depends_on xcode: "12.0"
  conflicts_with "hicc-cxx", because: "hicc-cxx also ships most experimental codes similar with cmdr-cxx"

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
