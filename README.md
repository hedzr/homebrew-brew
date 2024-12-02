# Utilities (via HomeBrew) from Hedzr

[![livecheck-and-update-tap](https://github.com/hedzr/homebrew-brew/actions/workflows/livecheck-tap.yml/badge.svg)](https://github.com/hedzr/homebrew-brew/actions/workflows/livecheck-tap.yml)

## How do I install these formulae?

`brew install hedzr/brew/<formula>`

Or `brew tap hedzr/brew` and then `brew install <formula>`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

### howto build a golang app

```ruby

# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

depends_on "go" => :build

def install
  # ENV.deparallelize  # if your formula fails when building in parallel

  # ENV["GOPROXY"] = "https://goproxy.io"
  # system "make"

  system "go", "build", *std_go_args
end

```

### other refs

kind: <https://github.com/kubernetes-sigs/kind>

## Software/Library Lists

### golang CLI apps

- [awesome-tool](https://github.com/hedzr/awesome-tool), cli
- [consul-tags](https://github.com/hedzr/consul-tags), cli
- [go-faker](https://github.com/hedzr/go-faker), cli

### cxx libraries

- [hicc-cxx](https://github.com/hedzr/hicc), a cxx lib, experimental codes
- [cmdr-cxx](https://github.com/hedzr/cmdr-cxx), a cxx lib

.
