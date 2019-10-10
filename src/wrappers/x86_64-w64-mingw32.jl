# Autogenerated wrapper script for XSLT_jll for x86_64-w64-mingw32
export libxslt, libexslt

using Libgcrypt_jll
using XML2_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"

# Relative path to `libxslt`
const libxslt_splitpath = ["bin", "libxslt-1.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libxslt_path = ""

# libxslt-specific global declaration
# This will be filled out by __init__()
libxslt_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libxslt = "libxslt-1.dll"


# Relative path to `libexslt`
const libexslt_splitpath = ["bin", "libexslt-0.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libexslt_path = ""

# libexslt-specific global declaration
# This will be filled out by __init__()
libexslt_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libexslt = "libexslt-0.dll"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (Libgcrypt_jll.PATH_list, XML2_jll.PATH_list,))
    append!.(Ref(LIBPATH_list), (Libgcrypt_jll.LIBPATH_list, XML2_jll.LIBPATH_list,))

    global libxslt_path = abspath(joinpath(artifact"XSLT", libxslt_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libxslt_handle = dlopen(libxslt_path)
    push!(LIBPATH_list, dirname(libxslt_path))

    global libexslt_path = abspath(joinpath(artifact"XSLT", libexslt_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libexslt_handle = dlopen(libexslt_path)
    push!(LIBPATH_list, dirname(libexslt_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

