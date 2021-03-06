if(MSVC)
    set(PCH_SUPPORTED TRUE)
else()
    set(PCH_SUPPORTED FALSE)
endif()

if(PCH_SUPPORTED)
    option(PLASMA_USE_PCH "Enable precompiled headers?" ON)
endif(PCH_SUPPORTED)

macro(use_precompiled_header PrecompiledHeader PrecompiledSource)
    if(PLASMA_USE_PCH)
        if(MSVC)
            get_filename_component(PrecompiledBasename ${PrecompiledHeader} NAME_WE)
            set(PrecompiledBinary ${PrecompiledBasename}.pch)

            add_definitions(/Fp"${PrecompiledBinary}")
            add_definitions(/Yu"${PrecompiledHeader}")
            add_definitions(/FI"${PrecompiledHeader}")
            set_source_files_properties(${PrecompiledSource} PROPERTIES COMPILE_FLAGS "/Yc\"${PrecompiledHeader}\"")
        endif(MSVC)
    endif(PLASMA_USE_PCH)
endmacro(use_precompiled_header)