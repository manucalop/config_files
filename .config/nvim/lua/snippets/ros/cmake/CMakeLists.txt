cmake_minimum_required(VERSION 2.8.3)
project(your_project_name)

add_compile_options(-std=c++11)

set(${PROJECT_NAME}_DEPENDS
  #Package dependencies
  roscpp
  std_msgs
)
    
set(${PROJECT_NAME}_INCLUDE_DIRS
  #Include folders
  include
)

find_package(catkin REQUIRED COMPONENTS
  ${${PROJECT_NAME}_DEPENDS}
)

#What to export (include dirs, libraries, etc)
catkin_package(
  INCLUDE_DIRS ${catkin_INCLUDE_DIRS} ${${PROJECT_NAME}_INCLUDE_DIRS}
  LIBRARIES ${PROJECT_NAME}_lib
  CATKIN_DEPENDS ${${PROJECT_NAME}_DEPENDS}
)

include_directories( ${catkin_INCLUDE_DIRS} ${${PROJECT_NAME}_INCLUDE_DIRS} )

## Create library
add_library(${PROJECT_NAME}_lib src/${PROJECT_NAME}.cpp)
add_dependencies(${PROJECT_NAME}_lib ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(${PROJECT_NAME}_lib ${catkin_LIBRARIES})

# Create executable (node)
add_executable(${PROJECT_NAME}_node src/${PROJECT_NAME}_node.cpp)
add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(${PROJECT_NAME}_node ${PROJECT_NAME}_lib ${catkin_LIBRARIES})

## Tests
#if (CATKIN_ENABLE_TESTING)
#  catkin_add_gtest(${PROJECT_NAME}_test src/tests/${PROJECT_NAME}_test.cpp)
#  target_link_libraries(${PROJECT_NAME}_test ${catkin_LIBRARIES})
#endif()
