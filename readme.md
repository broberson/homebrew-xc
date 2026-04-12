### xc - xcode project management for people who hate xcode

currently focused on macOS development. iOS support may come someday.

```
xc 0.3.1
Usage: xc <command> [path] [options]

Commands:
    add <path>           — Add a file or folder to the Xcode project
    remove <path>        — Remove a file or folder from the Xcode project
    rename <old> <new>   — Rename a file or folder in the Xcode project
    build                — Build the first target in the project
    run                  — Build and run the first target
    release              — Build release, run package.sh & release.sh if they exist
    version              — Show version and build number of main target
    targets              — List available targets
    list                 — List files by target (includes implicit Swift files)
    open                 — Open the Xcode project in Xcode
    --help, -h           — Show this help message

Options (can be combined with add, remove, rename, build, or run):
    --target NAME          — Operate only on the target with the given NAME
    --all-targets          — Operate on all targets in the project
    --verbose              — Print detailed actions as they happen
    --release              — Build using Release configuration (default is Debug)
    --install              — Build and install Release to /Applications
    --derived-data-path    — Specify custom derived data path (default is .build)
    --console              — Run binary directly instead of using open
    --quick, -q            — Run without building first (assumes already built)
    --bump                 — Increment build number by 1 before building
    --bump-version         — Increment build number + version before building
    --minor                — With --bump-version: bump minor (1.2.3 → 1.3.0)
    --major                — With --bump-version: bump major (1.2.3 → 2.0.0)

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
