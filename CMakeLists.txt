cmake_minimum_required(VERSION 3.8)
project(awtube_interfaces)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(builtin_interfaces REQUIRED)
find_package(trajectory_msgs REQUIRED)
find_package(moveit_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)

set(THIS_PACKAGE_DEPS
  builtin_interfaces 
  trajectory_msgs 
  moveit_msgs
  geometry_msgs
)

rosidl_generate_interfaces(${PROJECT_NAME}
  "action/JointPoint.action"
  "action/Task.action"
  "action/PalletizerAction.action"
  "srv/MoveToFrame.srv"
  "srv/GetBoxPoses.srv"
  "srv/GetTrajs.srv"
  "srv/SetTrajs.srv"
  "srv/GetAttrAll.srv"
  "srv/SetAttrAll.srv"
  "srv/SetDout.srv"
  DEPENDENCIES ${THIS_PACKAGE_DEPS}
)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
endif()

ament_export_dependencies(rosidl_default_runtime)
ament_package()
