using PrintFileTree
using Base.Test

tmpdir = mktempdir()
touch(joinpath(tmpdir, "a"))
touch(joinpath(tmpdir, "b"))
mkpath(joinpath(tmpdir, "c","a","a"))
mkpath(joinpath(tmpdir, "c", "wow", "cats", "are", "so", ""))
mkpath(joinpath(tmpdir, "c", "wow", "cats", "are", "weird"))
touch(joinpath(tmpdir, "c", "a", "subfiles"))
touch(joinpath(tmpdir, "c", "a", "a","subfiles"))
mkpath(joinpath(tmpdir, "c","a","a"))
mkpath(joinpath(tmpdir, "c","a","a"))
touch(joinpath(tmpdir, "c", "z"))
touch(joinpath(tmpdir, "d"))
mkpath(joinpath(tmpdir, "e", "the", "end"))

# Run once to make sure it doesn't crash or something.
printfiletree(tmpdir)

# Actually @test the output.
output = readstring(`$JULIA_HOME/julia -e "using PrintFileTree; printfiletree(\"$tmpdir\")"`)
println(output)
@test contains(output,
     """$tmpdir
        ├── a
        ├── b
        ├── c
        │   ├── a
        │   │   ├── a
        │   │   │   └── subfiles
        │   │   └── subfiles
        │   ├── wow
        │   │   └── cats
        │   │       └── are
        │   │           ├── so
        │   │           └── weird
        │   └── z
        ├── d
        └── e
            └── the
                └── end""")
