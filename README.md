# Vulnlog for Homebrew

Homebrew tap for the [Vulnlog CLI](https://github.com/vulnlog/vulnlog).

## Install

One-shot:

```shell
brew install vulnlog/vulnlog/vulnlog
```

Or tap once, then install (and upgrade) with the bare name:

```shell
brew tap vulnlog/vulnlog
brew install vulnlog
```

On Apple Silicon Macs the formula installs the native binary. On Intel Macs it
installs the JVM distribution and pulls in `openjdk@21` automatically.

## Releases

The formula tracks releases of
[`vulnlog/vulnlog`](https://github.com/vulnlog/vulnlog/releases). When a new
release is cut upstream, a pull request is opened here to bump `vulnlog.rb`.

## Deprecated formulae

- `vl-yaml` — proof of concept, superseded by `vulnlog`. Use
  `brew install vulnlog/vulnlog/vulnlog` instead.
