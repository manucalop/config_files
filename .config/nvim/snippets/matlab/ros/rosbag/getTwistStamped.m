function twist_out = getTwistStamped(bag, topic)
    msgs_current_twist = readMessages(select(bag, 'Time', [bag.StartTime bag.EndTime], 'Topic', topic));
    twist=[];
    twist.stamp=[];
    twist.linear=[];
    twist.angular=[];

    for(i=1:size(msgs_current_twist,1))
        msg_current_twist = msgs_current_twist{i,1};
        if(exist('msg_current_twist'))
            new_stamp=msg_current_twist.Header.Stamp.Sec+1e-9*msg_current_twist.Header.Stamp.Nsec;
            new_linear=[msg_current_twist.Twist.Linear.X; msg_current_twist.Twist.Linear.Y; msg_current_twist.Twist.Linear.Z];
            new_angular=[msg_current_twist.Twist.Angular.X; msg_current_twist.Twist.Angular.Y; msg_current_twist.Twist.Angular.Z];
            twist.stamp=[twist.stamp, new_stamp];
            twist.linear=[twist.linear, new_linear];
            twist.angular=[twist.angular, new_angular];
        end
    end

    twist.num_msgs=size(twist.stamp,2);
    twist.stamp = twist.stamp - twist.stamp(1);

    twist_out = twist;
end
