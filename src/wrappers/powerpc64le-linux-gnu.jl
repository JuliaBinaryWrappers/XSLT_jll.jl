# Autogenerated wrapper script for XSLT_jll for powerpc64le-linux-gnu
export libexslt, libxslt

using Libgcrypt_jll
using XML2_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libexslt`
const libexslt_splitpath = ["lib", "libexslt.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libexslt_path = ""

# libexslt-specific global declaration
# This will be filled out by __init__()
libexslt_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libexslt = "libexslt.so.0"


# Relative path to `libxslt`
const libxslt_splitpath = ["lib", "libxslt.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libxslt_path = ""

# libxslt-specific global declaration
# This will be filled out by __init__()
libxslt_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libxslt = "libxslt.so.1"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"XSLT")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Libgcrypt_jll.PATH_list, XML2_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Libgcrypt_jll.LIBPATH_list, XML2_jll.LIBPATH_list,))

    global libexslt_path = normpath(joinpath(artifact_dir, libexslt_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libexslt_handle = dlopen(libexslt_path)
    push!(LIBPATH_list, dirname(libexslt_path))

    global libxslt_path = normpath(joinpath(artifact_dir, libxslt_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libxslt_handle = dlopen(libxslt_path)
    push!(LIBPATH_list, dirname(libxslt_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

