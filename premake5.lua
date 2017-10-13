#!lua

--[[
Usage: 
	windows: premake5.exe --os=windows vs2015
	linux:  premake5.exe --os=linux gmake
]]

require("conanpremake")  -- generated by conan

workspace "GrpcExamplesCpp"
	location (_ACTION)  -- subdir vs2015 (or gmake, ...)
	configurations { "Release", "Debug" }
	platforms { "x64", "x32" }
	language "C++"
	flags {
		"C++11",
	}

	filter "configurations:Debug"
		flags { "Symbols" }
		defines { "DEBUG" }
	filter "configurations:Release"
		defines { "NDEBUG" }
		optimize "On"
	filter {}

	includedirs { conan_includedirs }
	libdirs { conan_libdirs }
	links { conan_libs }

group "helloworld"

project "greeter_client"
	kind "ConsoleApp"
	files { "helloworld/**.h", "helloworld/**.cc" }
project "greeter_server"
	kind "ConsoleApp"
	files { "helloworld/**.h", "helloworld/**.cc" }
project "greeter_async_client"
	kind "ConsoleApp"
	files { "helloworld/**.h", "helloworld/**.cc" }
project "greeter_async_server"
	kind "ConsoleApp"
	files { "helloworld/**.h", "helloworld/**.cc" }
  
group "route_guide"

project "route_guide_client"
	kind "ConsoleApp"
	files { "route_guide/**.h", "route_guide/**.cc" }
project "route_guide_server"
	kind "ConsoleApp"
	files { "route_guide/**.h", "route_guide/**.cc" }

group ""  -- End of group


