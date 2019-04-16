module PrintFileTree

export printfiletree

"""
    printfiletree()
    printfiletree(root)

Like the unix utility `tree` (https://linux.die.net/man/1/tree).

Prints complete recursive directory structure of root and all its contents.
"""
function printfiletree(root=".")
    println(root);
    printfiletree_helper(root)
end
function printfiletree_helper(root, depth=0, opendirs=[true])
    files = readdir(root)
    for (i,f) in enumerate(files)
        startswith(f, ".") && continue
        lastitem = (i == length(files))
        lastitem && (opendirs[end] = false)
        for p in opendirs[1:end-1]
            print(p ? "│   " : "    ")
        end
        println("$(lastitem ? "└" : "├")── " * f) # path
        path = joinpath(root, f)

        if isdir(path)
            push!(opendirs, true)
            printfiletree_helper(path, depth+1, opendirs)
            pop!(opendirs)
        end
    end
    nothing
end

end # module
