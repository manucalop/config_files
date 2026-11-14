  if(!ros::param::get("sample_time"  , sample_time)){
    ROS_ERROR("Failed to load sample_time from rosparam");
    ros::shutdown();
  }
