cmake_minimum_required(VERSION 3.12)
project(meshmonk CXX)
set(CMAKE_CXX_STANDARD 14)


if(${CMAKE_SYSTEM_NAME} MATCHES Linux)
    set(CMAKE_CXX_FLAGS "-Wall -fexceptions -O2 -Wall -std=c++14 -g -Wl,-V -fPIC")
endif()
if(${CMAKE_SYSTEM_NAME} MATCHES Darwin)
    set(CMAKE_CXX_FLAGS "-Wall -fexceptions -O2 -Wall -std=c++14 -g -Wl,-V -fPIC")
endif()
include_directories(vendor)
include_directories(eigen)
file(GLOB_RECURSE MESHMONK_HEADERS "src/*.hpp")
file(GLOB_RECURSE MESHMONK_SOURCES "src/*.cpp")

add_library(meshmonk SHARED meshmonk.cpp ${MESHMONK_SOURCES})
target_link_libraries(meshmonk PRIVATE OpenMeshCore OpenMeshTools)
install(TARGETS meshmonk
        LIBRARY DESTINATION lib)
install(FILES ${MESHMONK_HEADERS} DESTINATION include)
