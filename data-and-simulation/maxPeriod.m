function T = maxPeriod(x,t)
%computes lowest fourier frequency

    [Fx,f]=fftPower(x,t);

    % peak finder
    [pks,idx,w,amp]=findpeaks(Fx,'MinPeakDistance',3,'MinPeakProminence',0.01);
    try
        T=1/f(idx(1));
    catch
        T=nan;
    end
end

