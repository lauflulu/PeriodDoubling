function Nrot = rotationNumber(x,y)
%ROTATIONNUMBER Summary of this function goes here

rot=rotationTotal(x,y);
mPer=maxPeriod(x,1:length(x));
Nrot=rot/length(x)*mPer;

end

