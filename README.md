<p align="center">
  <img src="https://gist.githubusercontent.com/adamrdavid/c5d4e0faab7801c828962487f3e5b924/raw/2ab968922aa658e37b458fd07c67591ca98b77a9/vrt.svg" />
</p>
<p align="center">
  <a href="https://rubygems.org/gems/vrt-cli"><img alt="Gem version" src="https://img.shields.io/gem/v/vrt-cli"></a>
  <a href="https://github.com/noraj/vrt-cli/tags"><img alt="GitHub tag (latest SemVer)" src="https://img.shields.io/github/v/tag/noraj/vrt-cli"></a>
  <a href="https://github.com/noraj/vrt-cli/blob/master/LICENSE"><img alt="License" src="https://img.shields.io/github/license/noraj/vrt-cli"></a>
  <a href="https://noraj.github.io/vrt-cli/"><img alt="Doc (Github)" src="https://img.shields.io/badge/doc-github-blueviolet"></a>
  <a href="https://www.rubydoc.info/gems/vrt-cli/"><img alt="Doc (rubydoc)" src="https://img.shields.io/badge/doc-rubydoc-blueviolet"></a>
</p>

# vrt-cli

A simple tool to visualize [VRT][vrt-bc] (Vulnerability Rating Taxonomy) from the CLI. This gem is unofficial and is maintained by [noraj][boraj-gh] not by Bugcrowd.

<p align="center">
  <a href="https://github.com/bugcrowd/vrt-ruby"><img alt="vrt-ruby" src="https://img.shields.io/badge/github-vrt--ruby-red" /></a>
  <a href="https://github.com/bugcrowd/vulnerability-rating-taxonomy"><img alt=vulnerability-rating-taxonomy" src="https://img.shields.io/badge/github-vulnerability--rating--taxonomy-red" /></a>
  <a href="https://bugcrowd.com/vulnerability-rating-taxonomy"><img alt="vrt" src="https://img.shields.io/badge/bugcrowd-vrt-orange" /></a>
</p>

## Install

```bash
gem install vrt-cli
```

## Usage

### CLI

```
$ vrt-cli -h
vrt-cli by noraj

Usage:
  vrt-cli tree [--no-color --debug]
  vrt-cli table [--sortby <col> --order <dir>] [--no-color --debug]
  vrt-cli -h | --help
  vrt-cli --version

Table options: can be used with list and search commands
  -s <col>, --sortby <col>  Column to sort by: priority, category, subcategory, variant [default: nil]
  -o <dir>, --order <dir>   Displayed in ascendant (asc) order or descendant order (dsc) [default: asc]

Other options:
  --no-color  Disable colorized output
  --debug     Display arguments
  -h, --help  Show this screen
  --version   Show version
```

### Library

```ruby
require 'vrt_cli'

vc = VrtCli::App.new

vc.sort(:priority)
vc.vulnerabilities
```

## Screenshots

**tree** view:

![](https://i.imgur.com/8rkBIBQ.png)

**table** view:

![](https://i.imgur.com/aU2OYt1.png)

![](https://i.imgur.com/dwQuV15.png)

[vrt-bc]:https://bugcrowd.com/vulnerability-rating-taxonomy
[boraj-gh]:https://github.com/noraj
