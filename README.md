haxe-neko-crc32
===============

> **Note**: This is a historical repository from 2012, preserved for archival purposes only.

Minimal reproduction case for a Haxe Neko CRC32 macro problem.

## The Problem

This project demonstrates an issue where `neko.zip.CRC32.encode()` produces different results when called:
- At runtime (in a regular function)
- During compile-time (inside a macro)

## Building and Running

```bash
# Compile
haxe compile.hxml

# Run
neko TestCrc32.n
```

## Historical Context

Created in July 2012 to reproduce and report a bug in the Haxe compiler's macro system when targeting the Neko VM. This repository is kept for historical reference.