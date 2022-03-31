close all
clear all

%% experimental period with autocorrelation
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

%% reorder
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
    
%% ##### simulate period
rr=0.1:0.01:0.3;
a_p28=.1; a_pLtetO1=.1; %nM/s
alphas=0.005;

k_TL = .02; % 1/s
t_m = 12*60; % 1/s
K_s28=20; K_tetR=2; %nM
n_s28=3; n_tetR=3; 

k= [a_p28,a_pLtetO1,k_TL,t_m,K_s28,K_tetR,n_s28,n_tetR];

t_interval=15; %min
t_min=0:t_interval:24*60*7;
t_sec= t_min*60; %seconds
t_hour=t_sec/3600;

delta=-log(1-rr)/(t_interval*60); %1/s, base e

y0=[0;0;0;0;0;0];

semiOut='up'; contOut='up';
if strcmp(semiOut,'up') || strcmp(semiOut,'low')
    t_semi=zeros(length(alphas),length(rr),length(t_sec));
    c_semi=zeros(length(alphas),length(rr),length(t_sec),length(y0));
else
    t_semi=zeros(length(alphas),length(rr),(length(t_sec)-1)*10);
    c_semi=zeros(length(alphas),length(rr),(length(t_sec)-1)*10,length(y0));
end


tic;
for a=1:length(alphas)
        for r=1:length(rr)
            k(1,1)=alphas(a); k(1,2)=alphas(a);
            [t_semi(a,r,:),c_semi(a,r,:,:)]=...
                semiContinuousODE(@(t,y)ode_simple_mRNA(t,y,k,0),t_sec,y0,rr(r),generateInput(0,0,t_sec,y0),semiOut);
            
            %[t_cont(a,r,:),c_cont(a,r,:,:)]=ode23s(@(t,y)ode_simple_mRNA(t,y,k,delta(r)),t_sec,y0);%not input implemented

        end
end
toc

simPeriod=zeros(1,length(rr));
i=5;

for r=1:length(rr)
    [pk,locs,w,amp]=findpeaks(squeeze(c_semi(1,r,:,i)),'MinPeakProminence',.1); %find first minimum
    simPeriod(1,r)=mean(diff(t_hour(locs)));
end
          
    
%% ###### plot periods vs. RR
% mRNA degradation rate Niederholtmeyer 2013: 0.5/h in PURE
% Niederholtmeyer 2013 (implementation): 0.2-0.5/h in PURE
% Niederholtmeyer 2015: 5/h in TXTL
% Tayar 2017: 2-4/h in TXTL
% Noireaux, Shin, 2010: 4.6/h in TXTL

delta=-log(1-rr)/(15/60); %1/h, base e
Delta=-log(1-RR)/(15/60);
uniqueDelta=-log(1-RRunique)/(15/60);
dRNA=1/t_m*3600; 
tau=.00005;
Q = 2*(1./delta*1./(dRNA+delta)).^0.5./(1./delta+1./(dRNA+delta));

for d=1:length(delta)
    D=delta(d);
    q = 2*(1./D*1/(dRNA+D)).^0.5./(1./D+1/(dRNA+D));
    Panalytical(d)=fzero(@(t) t- pi.*((cot(pi/2-2*pi*tau/t).^2+q.^2).^0.5 + cot(pi/2-2*pi*tau/t))*(1./D+1/(dRNA+D)), 5);
end

PIriod=pi./delta;

figure(2)
hold all
    errorbar(uniqueDelta,mPeriod,stdPeriod,'o')
    plot(delta,PIriod)
    plot(delta,simPeriod)
    plot(delta,Panalytical)
    ylim([0,12]);
    xlim([0.4,1.5]);
    box('on')
    legend('CFP','pi/delta','simulation','analytical','analytical wo mRNA decay')
    xlabel('Delta (1/h)')
    ylabel('Period (h)')

    
%% sensitivity analysis
% ##### simulate period
rr0=0.25;
alphas=0.005;
k_TL = .02; % 1/s
t_m = 12*60; % 1/s
K_s28=20; K_tetR=2; %nM
n_s28=3; n_tetR=3; 

k= [alphas,alphas,k_TL,t_m,K_s28,K_tetR,n_s28,n_tetR];

t_interval=15; %min
t_min=0:t_interval:24*60*7;
t_sec= t_min*60; %seconds
t_hour=t_sec/3600;

delta=-log(1-rr0)/(t_interval*60); %1/s, base e

y0=[0;0;0;0;0;0];

var_factor=[0.7,1,1.3];

semiOut='up'; contOut='up';
if strcmp(semiOut,'up') || strcmp(semiOut,'low')
    t_semi=zeros(length(k)+1,length(var_factor),length(t_sec));
    c_semi=zeros(length(k)+1,length(var_factor),length(t_sec),length(y0));
else
    t_semi=zeros(length(k)+1,length(var_factor),(length(t_sec)-1)*10);
    c_semi=zeros(length(k)+1,length(var_factor),(length(t_sec)-1)*10,length(y0));
end

tic;
for ki=1:length(k)+1
        for v=1:length(var_factor)
            vk=k;
            RR=rr0;
            if ki==length(k)+1
                RR=RR*var_factor(v);
            else
                vk(ki)=k(ki)*var_factor(v);
            end
            [t_semi(ki,v,:),c_semi(ki,v,:,:)]=...
                semiContinuousODE(@(t,y)ode_simple_mRNA(t,y,vk,0),t_sec,y0,RR,generateInput(0,0,t_sec,y0),semiOut);
        end
end
toc

contPeriod=zeros(length(var_factor),length(k)+1);
simPeriod=zeros(length(var_factor),length(k)+1);

i=5;

for ki=1:length(k)+1
        for v=1:length(var_factor)
            [pk,locs,w,amp]=findpeaks(squeeze(c_semi(ki,v,:,i)),'MinPeakProminence',.1); %find first minimum
            simPeriod(v,ki)=mean(diff(t_hour(locs)));
        end
end

figure(9)
    bar([0:8]+0.2,simPeriod(1,:)-simPeriod(2,:))
    hold all
    bar([0:8]-0.2,simPeriod(3,:)-simPeriod(2,:))
    xticks(0:8)
    xticklabels({'a_{p28}','a_{ptet}','k_{TL}','\tau_m','K_{s28}','K_{tetR}','n_{s28}','n_{tetR}','\delta'})
    legend('20% decrease','20% increase')
    xlabel('Changed Parameter')
    ylabel('\Delta T (h)')
    
    
    
    
    
    
    