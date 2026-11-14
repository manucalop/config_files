    ros::Subscriber subscriber_sub;
    void callback(const type::ConstPtr& msg);
  subscriber_sub = n.subscribe<type>("topic", 1, &Class::callback,  this);
void Class::callback(const type::ConstPtr& msg){}
