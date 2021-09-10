project "yaml-cpp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    warnings "off"

    configureProjectProperties("%{prj.name}")

    files
    {
        "src/**.h",
        "src/**.cpp",

        "include/**.h",
    }

    includedirs
    {
        "include"
    }


    filter { "action:xcode*" }
        XCodeBuildSettings =
        {
        }
        merge(XCodeBuildSettings, OS.XCodeBuildSettings)
        xcodebuildsettings (XCodeBuildSettings)

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"

    filter "system:linux"
        pic "On"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
