function rot = rotationTotal(x,y)
% computes the total number of rotations along a trajectory in rad/2/pi

    Theta=zeros(length(x)-2,1);
    for i=1:length(x)-2
        v_1 = [x(i+2),y(i+2),0] - [x(i+1),y(i+1),0];
        v_2 = [x(i+1),y(i+1),0] - [x(i),y(i),0];
        Theta(i,1) = atan2(sign(dot(cross(v_1, v_2), [0,0,1]))*norm(cross(v_1, v_2)), dot(v_1, v_2));
    end
    rot=sum(Theta)/2/pi();
end


