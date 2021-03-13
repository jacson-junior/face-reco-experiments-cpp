workspace "Coruja"
    architecture "x86_64"
    startproject "Watchmen"

    configurations
    {
        "Debug",
        "Release"
    }

    flags
    {
        "MultiProcessorCompile"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}

group "Dependencies"
	include "Coruja/vendor/openpnp-capture"
group ""

include "Coruja"
include "Watchmen"