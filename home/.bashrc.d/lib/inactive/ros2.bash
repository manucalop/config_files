#!/usr/bin/bash
export ROS_DISTRO="galactic"
export ROS_DOMAIN_ID=0
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export ROS_WS="${HOME}/catkin_ws"

source "/opt/ros/${ROS_DISTRO}/setup.bash"
source $ROS_WS/devel/setup.bash
