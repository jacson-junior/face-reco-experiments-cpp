project "Coruja"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "src/crjpch.h"
	pchsource "src/crjpch.cpp"

	files
	{
		"src/**.h",
		"src/**.cpp",
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
	}

	includedirs
	{
		"%{wks.location}/Coruja/src",
		"%{wks.location}/Coruja/vendor/openpnp-capture/include",
	}

	links
	{
		"openpnp-capture"
	}

	filter "system:macosx"
		systemversion "latest"

		defines
		{
		}

	filter "configurations:Debug"
		defines "CJ_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "CJ_RELEASE"
		runtime "Release"
		optimize "on"