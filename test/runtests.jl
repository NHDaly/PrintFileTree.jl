using PrintFileTree
using Base.Test

tmpdir = mktempdir()
touch(joinpath(tmpdir, "a"))
touch(joinpath(tmpdir, "b"))
mkpath(joinpath(tmpdir, "c","a","a"))
touch(joinpath(tmpdir, "c", "cool"))
mkpath(joinpath(tmpdir, "c", "cats", "yeah", "so", "cool"))
touch(joinpath(tmpdir, "c", "a", "subfiles"))
touch(joinpath(tmpdir, "c", "a", "a","subfiles"))
mkpath(joinpath(tmpdir, "c","a","a"))
mkpath(joinpath(tmpdir, "c","a","a"))
touch(joinpath(tmpdir, "d"))

# Expect the following output:
"""$tmpdir
├-- a
├-- b
├-- c
│   ├-- a
│   │   ├-- a
│   │   │   └-- subfiles
│   │   └-- subfiles
│   ├-- cats
│   │   └-- yeah
│   │       └-- so
│   │           └-- cool
│   └-- cool
└-- d
"""
printfiletree(tmpdir)
