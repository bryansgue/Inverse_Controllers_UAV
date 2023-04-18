function [data] = odometryRC(RCSub)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

psi = Angulo(-pi/2);
      
R = [cos(psi) -sin(psi) 0 0 0 0;
  sin(psi) cos(psi) 0 0 0 0;
    0 0 -1 0 0 0;
    0 0 0 1 0 0;
    0 0 0 0 1 0;
    0 0 0 0 0 1];
% Read odometry values from ros
odomdata = receive(RCSub,0.5);  %(the second argument is a time-out in seconds).
%pose = odomdata.Pose.Pose;
%vel = odomdata.Twist.Twist;
%quat = pose.Orientation;
%angles = quat2eul([quat.W quat.X quat.Y quat.Z]);

data = R*odomdata.Axes;


end

