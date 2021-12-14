clear all
close all
%% system parameters
a_p28=.005; a_pLtetO1=.005; %nM/s
k_TL = .02; % 1/s
t_m = 12*60; % s
K_s28=20; K_tetR=2; %nM
n_s28=4; n_tetR=4; 

k= [a_p28,a_pLtetO1,k_TL,t_m,K_s28,K_tetR,n_s28,n_tetR];

% control parameters
inPeriod=4*60; % min
inAmplitude=[50];%0:20:200; % nM
RR=0.1:0.001:0.35;

t_interval=15; %min
t_min=0:t_interval:500*60;
t_sec= t_min*60; %seconds
t_hour=t_sec/3600;

delta=-log(1-RR)/(t_interval*60); %1/s, base e
lambda=-log(1-RR)*inPeriod/t_interval/pi();

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
        for r=1:length(RR)
           
            [t_semi(p,a,r,:),c_semi(p,a,r,:,:)]=...
                semiContinuousODE(@(t,y)ode_simple_mRNA(t,y,k,delta(r)),t_sec,y0,0,generateInput(inPeriod/t_interval,inAmplitude(a),t_sec,y0),contOut);
        end
    end
end
toc


%%
P=1;A=1;R=1;
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
        hold all
        [~,locs,~,~]=findpeaks(c_semi5);
        locs=locs(5)-32:16:500;
        plot(ts,c_semi5)
        plot(ts(locs),c_semi5(locs),'v')
        %plot(tc,c_cont5)
        xlabel('t (h)');
        ylabel('S28 (nM)')
        box('on')
    subplot(3,2,2)
        hold all
        plot(ts,c_semi6)
        %plot(tc,c_cont6)
        xlabel('t (h)');
        ylabel('TetR (nM)')
        box('on')
        
    subplot(3,2,3)
        hold all
        plot(f,FI,'.-c','LineWidth',2,'MarkerSize',15)
        plot(f(idx),FI(idx),'xr','LineWidth',2)
        %set(gca,'YScale','log')
        xlabel('Frequency (1/h)')
        ylabel('Amp (au)')
        box('on')
        
    subplot(3,2,4)
        color=t_hour'/max(t_hour);
        hold all
        plot(c_semi5(200:end),c_semi6(200:end),'-k','LineWidth',1)
        %patch([c_semi5; nan],[c_semi6; nan],[color; nan],'FaceColor','none','EdgeColor','interp','LineWidth',2)
        %colormap(hsv)
        %colorbar;
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

%%
outPeriod=zeros(length(inPeriod),length(inAmplitude),length(RR));
outAmplitude=zeros(length(inPeriod),length(inAmplitude),length(RR));
peaks=cell(length(inPeriod),length(inAmplitude),length(RR));

for p=1:length(inPeriod)
    for a=1:length(inAmplitude)
        for r=1:length(RR)
            [pks,locs,w,A]=findpeaks(squeeze(c_semi(p,a,r,200:end,5)));
            peaks{p,a,r}=pks;
            outPeriod(p,a,r)=mean(diff(locs))*15/60;
            outAmplitude(p,a,r)=mean(A);
        end
    end
end

leg=cell(size(RR));
for r=1:length(RR)
    leg{1,r}=[sprintf('RR %.1f',RR(r)*100),'%'];
end

%% bifurcation diagram
P=1;A=1; R=1;
figure(4)
    hold all
    if length(RR)==1
         for p=1:length(inPeriod)
            scatter(inPeriod(p)/60*ones(1,length(peaks{p,A,R})),peaks{p,A,R},100*ones(1,length(peaks{p,A,R})),'ok','filled','MarkerFaceAlpha',1)
    
         end
        xlabel('In Period (h)');%xlim([.15,0.35]);
        ylabel('max(mT~s28) (au)')
    elseif length(inPeriod)==1
        for r=1:length(RR)
            scatter(lambda(r)*ones(1,length(peaks{P,A,r})),peaks{P,A,r},20*ones(1,length(peaks{P,A,r})),'ok','filled','MarkerFaceAlpha',.1)
        end
        xlabel('lambda');%xlim([.15,0.35]);
        ylabel('max(mT~s28) (au)')
    else
        for r=1:length(RR)
            for p=1:length(inPeriod)
                
                M1=ones(1,length(peaks{p,A,r}));
                scatter3(RR(r)*M1,inPeriod(p)*M1/60,peaks{p,A,r},'ok','filled','MarkerFaceAlpha',0.1)
            end
        end
        xlabel('RR (%)')
        ylabel('In Period (h)')
        zlabel('max(mT~s28) (au)')
    end
    
    box('on');grid('on')
    
%% Return Map of Maxima

P=1;A=1; R=164;

figure(5)
    hold all
    for r=R%1:length(RR)
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
    
%% rotation number

figure(6)
    for r=1:length(RR)
        hold all
        x=squeeze(c_semi(P,A,r,200:end,5));Y=diff(squeeze(c_semi(P,A,r,199:end,5)));
        plot(RR(r),rotationNumber(x,Y),'ok')
    end
    box('on')
    
%% rotation alternative
b=zeros(10,1);
c=1:17;
for a=c
    b(a,1)=mean(abs(n0(a:a+12,1)-n0(1:13,1)));
end

c=c(b<0.1)
diff(c)

figure(11)
    plot(b,'-o')

    
%% Arnol'd tongues
Nrot=zeros(length(RR),length(inAmplitude),length(inPeriod));

for r=1:length(RR)
    for a=1:length(inAmplitude)
        for p=1:length(inPeriod)
            x=squeeze(c_semi(p,a,r,200:end,5));Y=diff(squeeze(c_semi(p,a,r,199:end,5)));
            Nrot(r,a,p)=rotationNumber(x,Y);
        end
    end
end

Nrot=squeeze(Nrot);
Nrot(Nrot>8)=12;
 figure(7)   
    imagesc(flip(Nrot'))
    colorbar
    box('on')
    
    xticks(1:5:length(RR))
    xticklabels(RR(1:5:end)*100)
    xlabel('Refresh Ratio (%)')
    yticks(1:length(inAmplitude))
    yticklabels(flip(inAmplitude(1:end)))
    ylabel('In Amplitude (nM)')
    hcb=colorbar;
    ylabel(hcb,'Rotation Number')
    set(get(hcb,'YLabel'),'Rotation',270,'VerticalAlignment','bottom')
    
    
% mycolormap=[[0,0,0];...
%     [14/255,129/255,197/255];...
%     [253/255,196/255,21/255];...
%     [219/255,13/255,21/255]];
% colormap(mycolormap);
colormap('spring');