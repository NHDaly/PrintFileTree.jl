# PrintFileTree

Exports a single utility function, `printfiletree(path)`.

## printfiletree(path)

Prints a file tree rooted at path, in the same way as the Unix utility, `tree`.

## Example:
```julia
julia> printfiletree("my/files")
my/files
├── a.txt
├── b.png
├── c
│   ├── a
│   │   ├── a
│   │   │   └── subfile
│   │   └── subfiles
│   ├── cats
│   │   └── are
│   │       └── so
│   │           └── cool
│   └── cool
└── d
```

## Installation

`Pkg.clone("https://github.com/NHDaly/PrintFileTree.jl")`


