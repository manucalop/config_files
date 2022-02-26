#!/usr/bin/bash
export ROS_DISTRO="noetic"
export ROS_WS="${HOME}/temp_ws/catkin_ws"

source "/opt/ros/${ROS_DISTRO}/setup.bash"
source $ROS_WS/devel/setup.bash

# export FLIGHTMARE_PATH="${ROS_WS}/src/flightmare"
