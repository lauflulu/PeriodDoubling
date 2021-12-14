clear all
close all
%% system parameters

a_p28=.005; a_pLtetO1=.005; %nM/s
k_TL = .02; % 1/s
t_m = 12*60; % s
K_s28=20; K_tetR=2; %nM
n_s28=8; n_tetR=8; 

k= [a_p28,a_pLtetO1,k_TL,t_m,K_s28,K_tetR,n_s28,n_tetR];

% control parameters
inPeriod=4*60; % min
inAmplitude=[50];%0:20:200; % nM

t_interval=15; %min
t_min=0:t_interval:500*60;
t_sec= t_min*60; %seconds
t_hour=t_sec/3600;

lambda=0.9:0.005:1.95;
RR=1-exp(-lambda*pi()/inPeriod*t_interval);
delta=-log(1-RR)/(t_interval*60); %1/s, base e

R=127;
lambda(R)
%%
y0=[0;0;0;0;0;0];

semiOut='up'; contOut='up';
if strcmp(semiOut,'up') || strcmp(semiOut,'low')
    t_semi=zeros(length(inPeriod),length(inAmplitude),length(RR),length(t_sec));
    c_semi=zeros(length(inPeriod),length(inAmplitude),length(RR),length(t_sec),length(y0));
else
    t_semi=zeros(length(inPeriod),length(inAmplitude),length(RR),(length(t_sec)-1)*10);
    c_semi=zeros(length(inPeriod),length(inAmplitude),length(RR),(length(t_sec)-1)*10,length(y0));
end

t_cont=zeros(length(inPeriod),length(inAmplitude),length(RR),length(t_sec));
c_cont=zeros(length(inPeriod),length(inAmplitude),length(RR),length(t_sec),length(y0));

tic;
for a=1:length(inAmplitude)
    for p=1:length(inPeriod)
        for r=R%1:length(RR)
           
            [t_semi(p,a,r,:),c_semi(p,a,r,:,:)]=...
                semiContinuousODE(@(t,y)ode_simple_mRNA(t,y,k,0),t_sec,y0,RR(r),generateInput(inPeriod(p)/t_interval,inAmplitude(a),t_sec,y0),semiOut);
        end
    end
end
toc


%%
P=1;A=1;
ts=squeeze(t_semi(P,A,R,:)/3600);
%tc=squeeze(t_cont(P,A,R,:)/3600);

c_semi5=squeeze(c_semi(P,A,R,:,5));
%c_cont5=squeeze(c_cont(P,A,R,:,5));

c_semi6=squeeze(c_semi(P,A,R,:,6));
%c_cont6=squeeze(c_cont(P,A,R,:,6));

[FI,f]=fftPower(c_semi5(200:end),ts(200:end));

% peak finder
[pks,idx,w,amp]=findpeaks(FI,'MinPeakDistance',1,'MinPeakProminence',1);

amplitude=FI(idx(1));
period=1/f(idx(1));

x=c_semi5(200:end,:); y=c_semi6(200:end,:);
rotationNumber(x,y);

figure(1)
    subplot(3,2,1)
        plot(ts,c_semi5)
        xlabel('t (h)');
        ylabel('S28 (nM)')
        box('on')
        
    subplot(3,2,2)
        plot(ts,c_semi6)
        xlabel('t (h)');
        ylabel('TetR (nM)')
        box('on')
        
    subplot(3,2,3)
        hold all
        plot(f,FI,'.-c','LineWidth',2,'MarkerSize',15)
        plot(f(idx),FI(idx),'xr','LineWidth',2)
        xlabel('Frequency (1/h)')
        ylabel('Amp (au)')
        box('on')
        
    subplot(3,2,4)
        color=t_hour'/max(t_hour);
        hold all
        plot(c_semi5(200:end),c_semi6(200:end),'-k','LineWidth',1)
        box('on');ylabel('TetR (nM)');xlabel('S28 (nM)');
        title(lambda(R))
        
    subplot(3,2,5)
        color=t_hour'/max(t_hour);
        hold all
        plot(c_semi5(100:end),diff(c_semi5(99:end)),'.','MarkerSize',15,'Color',[.8,.8,.8])
        patch([c_semi5(100:end); nan],[diff(c_semi5(99:end)); nan],[color(100:end,:); nan],'FaceColor','none','EdgeColor','interp','LineWidth',2)
        for tt=99:length(t_min)
            if ~mod(t_min(tt),inPeriod(P))
                plot(c_semi5(tt),diff(c_semi5(tt-1:tt)),'.','MarkerSize',25,'Color',[0,0,0])
            end
        end
        colormap(hsv)
        colorbar;
        box('on');ylabel('dS28/dt (nM/15min)');xlabel('S28 (nM)');
        
    subplot(3,2,6)
        Tstart=100;
        Tdelay=4;
        color=t_hour'/max(t_hour);
        hold all
        plot(c_semi5(Tstart:end-Tdelay),c_semi5(Tstart+Tdelay:end),'.','MarkerSize',15,'Color',[.8,.8,.8])
        patch([c_semi5(Tstart:end-Tdelay); nan],[c_semi5(Tstart+Tdelay:end); nan],[color(Tstart:end-Tdelay,:); nan],'FaceColor','none','EdgeColor','interp','LineWidth',2)
        colormap(hsv)
        colorbar;
        box('on');xlabel('S28(t) (nM)');ylabel(sprintf('S28(t+%d min) (nM)',Tdelay*15));

    
%% Return Map of Maxima
P=1;A=1;

figure(5)
    hold all
    for r=R
        fi=squeeze(c_semi(P,A,r,:,5));

        [pks,idx,w,amp]=findpeaks(fi(700:end),'MinPeakDistance',1,'MinPeakProminence',0.7);

        n0=pks(2:end-1);
        n1=pks(3:end);

        c0=0*[n0;n0]; c1=c0;
        c0(1:2:end)=n0;
        c0(2:2:end)=n0;
        c1(1:2:end)=n0;
        c1(2:2:end)=n1;
        scatter(n0,n1,200*ones(1,length(pks)-2),'o','filled','MarkerFaceAlpha',1)%,'MarkerFaceColor',[0,.3,1]*r/(length(RR)))

        plot(c0,c1,'-')
    end
    plot(0:max(n0)*1.05,0:max(n0)*1.05,'-r','LineWidth',2)
    xlim([0,inf]);ylim([0,inf]);
    box('on')
    xlabel('max(n)');ylabel('max(n+1)');  
