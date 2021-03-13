project "Watchmen"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp"
	}

	includedirs
	{
		"%{wks.location}/Coruja/src",
		"%{wks.location}/Coruja/vendor"
	}

	links
	{
		"Coruja"
	}

	filter "system:macosx"
		systemversion "latest"
		
	filter "configurations:Debug"
		defines "CJ_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "CJ_RELEASE"
		runtime "Release"
		optimize "on"