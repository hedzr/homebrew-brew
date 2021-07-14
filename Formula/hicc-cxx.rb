# typed: false
# frozen_string_literal: true

#
# brew install hedzr/brew/hicc-cxx
#

class HiccCxx < Formula
  desc "C++ template class library to provide some basic data structures and algorithms"
  homepage "https://github.com/hedzr/hicc"
  url "https://github.com/hedzr/hicc.git",
      tag:      "v0.2.6",
      revision: "918616b4f76388522e6cc5a4f34c67923d410fd6"
  # sha256 "asdf-asdf-asdf-asdf-asd-918616b4f76388522e6cc5a4f34c67923d410fd6"
  license "MIT"
  version_scheme 1
  head "https://github.com/hedzr/hicc.git"

  #   bottle do
  #     sha256 cellar: :any_skip_relocation, catalina:    "asdf-asdf-asdf-asdf-asd-918616b4f76388522e6cc5a4f34c67923d410fd6"
  #     sha256 cellar: :any_skip_relocation, high_sierra: "asdf-asdf-asdf-asdf-asd-918616b4f76388522e6cc5a4f34c67923d410fd6"
  #     sha256 cellar: :any_skip_relocation, sierra:      "asdf-asdf-asdf-asdf-asd-918616b4f76388522e6cc5a4f34c67923d410fd6"
  #     sha256 cellar: :any_skip_relocation, el_capitan:  "asdf-asdf-asdf-asdf-asd-918616b4f76388522e6cc5a4f34c67923d410fd6"
  #   end

  depends_on "catch2" => [:build, :test]
  depends_on "cmake" => :build
  depends_on xcode: "12.0"
  conflicts_with "cmdr-cxx", because: "cmdr-cxx also ships most experimental codes similar with hicc-cxx"

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
    # bin.install "#{bin}/hicc-cli"
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
    # system "false"
    outputs = shell_output("#{bin}/hicc-cli")
    assert_match(/Hello, World!/m, outputs)
  end
end
