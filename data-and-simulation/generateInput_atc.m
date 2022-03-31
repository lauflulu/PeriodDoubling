function yIN=generateInputAtc(inPeriod,inAmplitude,t,y0)
    yIN=zeros(length(t),length(y0));
    for i=1:length(t)
        if ~mod(i,inPeriod)
            yIN(i,7)=inAmplitude;
        end
    end
end
