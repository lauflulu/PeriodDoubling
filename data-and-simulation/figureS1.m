close all
clear all

%% experimental period with autocorrelation/ spline
load('210518_time.mat')
load('210518_intensities.mat')
load('cal_data')

RR=[0.10:0.05:0.3,0.25,0.2,0.15];

R=size(intensities,1); %numReactors
C=size(intensities,2); %numChannels
T=size(intensities,4); %numTimepoints

% calibrate
intensities(:,1,:,:)=intensities(:,1,:,:)/cal_data(3).norm_int*1000;
intensities(:,2,:,:)=intensities(:,2,:,:)/cal_data(2).norm_int*1000;

period=zeros(R,C);

color={'c','y'};

figure(4)
    for r=1:R
        subplot(4,2,r)
        for c=1:C
            % fft
            fi=detrend(squeeze(intensities(r,c,1,:)),2);
            ACF=xcorr(fi-mean(fi),'normalized');
            ACF=ACF(T:end);

            % Fit: 'untitled fit 1'.
            [xData, yData] = prepareCurveData( time, ACF );
            % Set up fittype and options.
            ft = 'splineinterp';
            % Fit model to data.
            [f, ~] = fit( xData, yData, ft, 'Normalize', 'on' );

            t=linspace(0,20,2000);
            y=f(t);
            % peak finder
            [pks,idx,w,amp]=findpeaks(y,'MinPeakDistance',3,'MinPeakProminence',0.02);
            try
                period(r,c)=t(idx(1));
            catch
                period(r,c)=inf;
            end

            hold all
            plot(time,ACF,'.','Color',color{c},'MarkerSize',15)
            plot(t,y,'-','Color',color{c},'LineWidth',1)
            plot(t(idx(1)),y(idx(1)),'xr','LineWidth',2)
        end
        
        xlabel('Time (h)')
        ylabel('ACF (au)')
        box('on')      
    end

% reorder
RRunique=uniquetol(RR,0.01);
U=size(RRunique,2);

Period=ones(U,4)*nan;
for u=1:U
    k=0;
    for r=1:R
        if abs(RRunique(u)-RR(r))<0.01
            for c=1:C
                k=k+1;
                Period(u,k)=period(r,c);
            end
        end
    end
end

mPeriod=nanmean(Period,2);
stdPeriod=nanstd(Period,[],2);
stdPeriod=stdPeriod+4*mPeriod/20;
   
%% experimental period with autocorrelation/ cosine
load('210518_time.mat')
load('210518_intensities.mat')
load('cal_data')

RR=[0.10:0.05:0.3,0.25,0.2,0.15];

R=size(intensities,1); %numReactors
C=size(intensities,2); %numChannels
T=size(intensities,4); %numTimepoints

% calibrate
intensities(:,1,:,:)=intensities(:,1,:,:)/cal_data(3).norm_int*1000;
intensities(:,2,:,:)=intensities(:,2,:,:)/cal_data(2).norm_int*1000;

period=zeros(R,C);

color={'c','y'};

figure(5)
    for r=1:R
        subplot(4,2,r)
        for c=1:C
            % fft
            fi=detrend(squeeze(intensities(r,c,1,:)),2);
            ACF=xcorr(fi-mean(fi),'normalized');
            ACF=ACF(T:end);

           [xData, yData] = prepareCurveData( time, ACF );

            % Set up fittype and options.
            ft = fittype( 'a*exp(-x/t)*cos(2*pi*x/T)', 'independent', 'x', 'dependent', 'y' );
            opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
            opts.Display = 'Off';
            opts.Lower = [1 0 0];
            opts.Upper = [1000 2 1000];
            opts.StartPoint = [2 1 1];
            % Fit model to data.
            [f, ~] = fit( xData, yData, ft, opts );


            t=linspace(0,20,2000);
            y=f(t);
            try
                period(r,c)=f.T;
            catch
                period(r,c)=inf;
            end

            hold all
            plot(time,ACF,'.','Color',color{c},'MarkerSize',15)
            plot(t,y,'-','Color',color{c},'LineWidth',1)
            plot(t(idx(1)),y(idx(1)),'xr','LineWidth',2)
        end
        
        xlabel('Time (h)')
        ylabel('ACF (au)')
        box('on')      
    end

% reorder
RRunique2=uniquetol(RR,0.01);
U=size(RRunique2,2);

Period=ones(U,4)*nan;
for u=1:U
    k=0;
    for r=1:R
        if abs(RRunique(u)-RR(r))<0.01
            for c=1:C
                k=k+1;
                Period(u,k)=period(r,c);
            end
        end
    end
end

mPeriod2=nanmean(Period,2);
stdPeriod2=nanstd(Period,[],2);
stdPeriod2=stdPeriod2+4*mPeriod2/20;


%% experimental period with autocorrelation/ cosine, no transient
load('210518_time.mat')
load('210518_intensities.mat')
load('cal_data')

RR=[0.10:0.05:0.3,0.25,0.2,0.15];

R=size(intensities,1); %numReactors
C=size(intensities,2); %numChannels
T=size(intensities,4); %numTimepoints

% calibrate
intensities(:,1,:,:)=intensities(:,1,:,:)/cal_data(3).norm_int*1000;
intensities(:,2,:,:)=intensities(:,2,:,:)/cal_data(2).norm_int*1000;

period=zeros(R,C);

color={'c','y'};

figure(5)
    for r=1:R
        subplot(4,2,r)
        for c=1:C
            % fft
            if r==5
                fi=detrend(squeeze(intensities(r,c,1,1:70)),2);
                T=70;
            else
                fi=detrend(squeeze(intensities(r,c,1,:)),2);
                T=84;
            end
            [~,idx,~,~]=findpeaks(-fi,'MinPeakDistance',3,'MinPeakProminence',1);
            idx1=idx(1);
            if idx(1)<20
                idx1=idx(2);
            end
            fiWO=fi(idx(1):end);
            ACF=xcorr(fiWO-mean(fiWO),'normalized');
            ACF=ACF(T-idx(1):end);

           [xData, yData] = prepareCurveData( time(1:T-idx(1)+2), ACF );

            % Set up fittype and options.
            ft = fittype( 'a*exp(-x/t)*cos(2*pi*x/T)', 'independent', 'x', 'dependent', 'y' );
            opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
            opts.Display = 'Off';
            opts.Lower = [1 0 0];
            opts.Upper = [1000 2 1000];
            opts.StartPoint = [2 1 1];
            % Fit model to data.
            [f, ~] = fit( xData, yData, ft, opts );


            t=linspace(0,20,2000);
            y=f(t);
            try
                period(r,c)=f.T;
            catch
                period(r,c)=inf;
            end

            hold all
            plot(time(1:T-idx(1)+2),ACF,'.','Color',color{c},'MarkerSize',15)
            plot(t,y,'-','Color',color{c},'LineWidth',1)
            %plot(t(idx(1)),y(idx(1)),'xr','LineWidth',2)
        end
        
        xlabel('Time (h)')
        ylabel('ACF (au)')
        box('on')      
    end

% reorder
RRunique2=uniquetol(RR,0.01);
U=size(RRunique2,2);

Period=ones(U,4)*nan;
for u=1:U
    k=0;
    for r=1:R
        if abs(RRunique(u)-RR(r))<0.01
            for c=1:C
                k=k+1;
                Period(u,k)=period(r,c);
            end
        end
    end
end

mPeriod2=nanmean(Period,2);
stdPeriod2=nanstd(Period,[],2);
stdPeriod2=stdPeriod2+4*mPeriod2/20;

%% ###### plot periods vs. RR
% mRNA degradation rate Niederholtmeyer 2013: 0.5/h in PURE
% Niederholtmeyer 2013 (implementation): 0.2-0.5/h in PURE
% Niederholtmeyer 2015: 5/h in TXTL
% Tayar 2017: 2-4/h in TXTL
% Noireaux, Shin, 2010: 4.6/h in TXTL

uniqueDelta=-log(1-RRunique)/(15/60);
figure(2)
subplot(1,2,1)
hold all    
    errorbar(uniqueDelta,mPeriod,stdPeriod,'o')
    errorbar(uniqueDelta,mPeriod2,stdPeriod2,'o')
    ylim([0,12]);
    xlim([0.4,1.5]);
    box('on')
    legend('ACF + spline + 1st maximum', 'ACF + decaying cosine - transient')
    xlabel('Delta (1/h)')
    ylabel('Period (h)')
subplot(1,2,2)
hold all
plot(mPeriod, mPeriod2,'o')
plot([0,12],[0,12],'-k')
xlabel('Period via ACF + spline + 1st maximum (h)');ylabel('Period via ACF + decaying cosine - transient(h)'); box('on')
