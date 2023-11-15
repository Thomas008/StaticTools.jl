using StaticTools
using Test
using ManualMemory: MemoryBuffer
using LinearAlgebra

const GROUP = get(ENV, "GROUP", "All")

@static if GROUP == "Core" || GROUP == "All"
    @testset "IO" begin include("testllvmio.jl") end
    @testset "libc" begin include("testllvmlibc.jl") end
    @testset "interop" begin include("testllvminterop.jl") end
    @testset "Parsing" begin include("testparse.jl") end
    @testset "MallocSlabBuffer" begin include("testslab.jl") end
    @testset "StaticString" begin include("teststaticstring.jl") end
    @testset "MallocString" begin include("testmallocstring.jl") end
    @testset "MallocArray" begin include("testmallocarray.jl") end
    @testset "StackArray" begin include("teststackarray.jl") end
    @testset "StaticLinearAlgebra" begin include("teststaticlinearalgebra.jl") end
    @testset "StaticRNG" begin include("teststaticrng.jl") end
end

using LoopVectorization
@static if GROUP == "Integration" || GROUP == "All"
    @testset "StaticCompiler" begin include("teststaticcompiler.jl") end
end

@static if GROUP == "Utilities" || GROUP == "All"
    @testset "static_type" begin include("teststatic_type.jl") end
end

