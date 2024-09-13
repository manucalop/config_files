function pose_out = getPoseStamped(bag, topic)
    msgs_current_pose = readMessages(select(bag, 'Time', [bag.StartTime bag.EndTime], 'Topic', topic));
    pose=[];
    pose.stamp=[];
    pose.position=[];
    pose.orientation_quat=[];

    for(i=1:size(msgs_current_pose,1))
        msg_current_pose = msgs_current_pose{i,1};
        if(exist('msg_current_pose'))
            new_stamp=msg_current_pose.Header.Stamp.Sec+1e-9*msg_current_pose.Header.Stamp.Nsec;
            new_position=[msg_current_pose.Pose.Position.X; msg_current_pose.Pose.Position.Y; msg_current_pose.Pose.Position.Z];
            new_orientation=[msg_current_pose.Pose.Orientation.W; msg_current_pose.Pose.Orientation.X; msg_current_pose.Pose.Orientation.Y; msg_current_pose.Pose.Orientation.Z];
            pose.stamp=[pose.stamp, new_stamp];
            pose.position=[pose.position, new_position];
            pose.orientation_quat=[pose.orientation_quat, new_orientation];
        end
    end

    pose.orientation_euler=quat2eul(pose.orientation_quat');
    pose.orientation_euler=pose.orientation_euler';
    pose.num_msgs=size(pose.stamp,2);
    pose.stamp = pose.stamp - pose.stamp(1);

    pose_out = pose;
end
