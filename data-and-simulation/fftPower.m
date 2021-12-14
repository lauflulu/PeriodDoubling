function [Pw,f] = fftPower(x,t)
%single sided fft power spectrum Fx and frequencies f
% excl. constant term f0
    N=length(x);

    samplingPeriod=mean(diff(t));
    samplingFrequency=1/samplingPeriod;

    % fft
    Fx=fft(x);
    Fx = Fx(1:N/2+1); %single sided

    Pw = samplingPeriod/N*abs(Fx).^2;
    Pw(2:end-1) = 2*Pw(2:end-1);
 
    f = samplingFrequency*(0:(N/2))/N;
    
    % excl. zero frequency
    f = f(2:end);
    Pw=Pw(2:end); 
end

