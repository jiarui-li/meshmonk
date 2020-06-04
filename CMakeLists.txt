cmake_minimum_required(VERSION 3.12)
project(meshmonk CXX)
set(CMAKE_CXX_STANDARD 14)


if(${CMAKE_SYSTEM_NAME} MATCHES Linux)
    set(CMAKE_CXX_FLAGS "--verbose -Wall -fexceptions -O2 -Wall -std=c++14 -g -Wl,-V -fPIC -c")
endif()
if(${CMAKE_SYSTEM_NAME} MATCHES Darwin)
    set(CMAKE_CXX_FLAGS "--verbose -Wall -fexceptions -O2 -Wall -std=c++14 -g -Wl,-V -fPIC -c")
endif()
add_subdirectory(OpenMesh)
include_directories(vendor)
include_directories(eigen)

add_library(meshmonk SHARED meshmonk.cpp src/BaseCorrespondenceFilter.cpp src/CorrespondenceFilter.cpp src/Downsampler.cpp src/helper_functions.cpp src/InlierDetector.cpp src/NeighbourFinder.cpp src/NonrigidRegistration.cpp src/PyramidNonrigidRegistration.cpp src/RigidRegistration.cpp src/RigidTransformer.cpp src/ScaleShifter.cpp src/SymmetricCorrespondenceFilter.cpp src/ViscoElasticTransformer.cpp)
target_link_libraries(meshmonk PRIVATE OpenMeshCore OpenMeshTools)