### xc - xcode project management for people who hate xcode

currently focused on macOS development. iOS support may come someday.

```
xc v0.1.0
Usage: xc <command> [path] [options]

Commands:
  add <path>           — Add a file or folder to the Xcode project
  remove <path>        — Remove a file or folder from the Xcode project
  rename <old> <new>   — Rename a file or folder in the Xcode project
  build                — Build the first target in the project
  run                  — Build and run the first target
  targets              — List available targets
  list                 — List files by target (includes implicit Swift files)
  open                 — Open the Xcode project in Xcode
  --help, -h           — Show this help message

Options (can be combined with add, remove, rename, build, or run):
  --target NAME        — Operate only on the target with the given NAME
  --all-targets        — Operate on all targets in the project
  --verbose            — Print detailed actions as they happen
  --release            — Build using the Release configuration (default is Debug)
  --derived-data-path PATH — Specify custom derived data path for build (default is .build)

Notes:
  * xc scans for an .xcodeproj in the current or a parent directory to work with.
  * Paths may be absolute or relative. Bundles (.xcassets, .bundle, .app)
    are treated as single files when added or removed.

Examples:
  xc add Source
  xc remove Source/OldFile.swift
  xc rename Old.swift New.swift
  xc list
  xc build --release
  xc add Source --target MyApp --verbose
  xc build --all-targets --derived-data-path /tmp/build
````

# Homebrew Tap

xc is a command line utilty for manipulating xcode projects.

## How do I install this formulae?

`brew install broberson/xc/xc`

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
