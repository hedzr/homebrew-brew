# Utilities (via HomeBrew) from Hedzr

## How do I install these formulae?

`brew install hedzr/brew/<formula>`

Or `brew tap hedzr/brew` and then `brew install <formula>`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

### build a golang app

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

## Software/Library Lists

- [awesome-tool](https://github.com/hedzr/awesome-tool), cli
- [consul-tags](https://github.com/hedzr/consul-tags), cli
- [hicc-cxx](https://github.com/hedzr/hicc), a cxx lib, experimental codes
- [cmdr-cxx](https://github.com/hedzr/cmdr-cxx), a cxx lib

