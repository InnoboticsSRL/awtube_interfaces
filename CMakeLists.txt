cmake_minimum_required(VERSION 2.8.3)

project(awtube_interfaces)

find_package(catkin REQUIRED COMPONENTS
  message_generation  # Needed to generate custom message types
  geometry_msgs
  std_msgs
  actionlib_msgs
)

add_message_files(  # Tell catkin which custom message files to include
  FILES
  GripperStatus.msg
  RobotState.msg
  StringArray.msg
)

add_action_files(
  FILES
  PickAndPlaceSequence.action
)

add_service_files(  # Tell catkin which custom message files to include
FILES
GetBool.srv
GetUint16.srv
Integer.srv
RobotStateService.srv
SetUint8.srv
ReadInputBeckhoffAWM.srv
SetOutputBeckhoffAWM.srv
ReadOutputBeckhoffAWM.srv
GetFdbkGripperAWM.srv
SetCmdGripperAWM.srv
)

generate_messages(
  DEPENDENCIES
  geometry_msgs
  std_msgs
  actionlib_msgs
)

catkin_package(
  CATKIN_DEPENDS message_runtime actionlib_msgs std_msgs # Needed to generate custom messages
)
include_directories(
  # include
  ${catkin_INCLUDE_DIRS}
  ${roscpp_INCLUDE_DIRS}
  ${rospy_INCLUDE_DIRS}
)
