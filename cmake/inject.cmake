# add following to inject.cmake file somewhere in your home directory, such as: ~/.config/cmake/inject.cmake
# Can use the following alias to have cmake always including the following config below: alias cmake "cmake -DCMAKE_PROJECT_INCLUDE=~/.config/cmake/inject.cmake"

if (NOT CUSTOMIZATION_INJECTED)
  message(STATUS "Injecting cmake config")

  set(CMAKE_CXX_COMPILER_LAUNCHER "/usr/bin/ccache")
  set(CMAKE_CXX_LINKER_LAUNCHER "/usr/bin/ccache")

  set(CMAKE_CXX_FLAGS "-fdiagnostics-color=always")

  set(CUSTOMIZATION_INJECTED TRUE)
endif()

