clear all
close all
%% system parameters
a_p28=.005; a_pLtetO1=.005; %nM/s
k_TL = .02; % 1/s
t_m = 12*60; % s
K_s28=20; K_tetR=2; %nM
n_s28=8; n_tetR=8; 
nHill=2:6/105:8;

k= [a_p28,a_pLtetO1,k_TL,t_m,K_s28,K_tetR,n_s28,n_tetR];

% control parameters
inPeriod=4*60; % min
inAmplitude=[10];%0:20:200; % nM

t_interval=15; %min
t_min=0:t_interval:500*60;
t_sec= t_min*60; %seconds
t_hour=t_sec/3600;

% RR=0.1:0.001:0.35;
% delta=-log(1-RR)/(t_interval*60); %1/s, base e
% lambda=-log(1-RR)*inPeriod/t_interval/pi();

lambda=0.9:0.005:1.95;
RR=1-exp(-lambda*pi()/inPeriod*t_interval);
delta=-log(1-RR)/(t_interval*60); %1/s, base e

%%
y0=[0;0;0;0;0;0;0;0];

semiOut='up'; contOut='up';
if strcmp(semiOut,'up') || strcmp(semiOut,'low')
    t_semi=zeros(length(RR),length(nHill),length(t_sec));
    c_semi=zeros(length(RR),length(nHill),length(t_sec),length(y0));
else
    t_semi=zeros(length(RR),length(nHill),(length(t_sec)-1)*10);
    c_semi=zeros(length(RR),length(nHill),(length(t_sec)-1)*10,length(y0));
end

tic;
for n=1:length(nHill)
    k(7)=nHill(n); k(8)=nHill(n);
    for r=1:length(RR)
        [t_semi(r,n,:),c_semi(r,n,:,:)]=...
            semiContinuousODEatc(@(t,y)ode_simple_mRNA_atc(t,y,k,0),t_sec,y0,RR(r),generateInputAtc(inPeriod/t_interval,inAmplitude,t_sec,y0),semiOut);
    end
    sprintf('%d/%d',n,length(nHill))
    toc
end

%% rotation alternative

rotation=zeros(length(RR),length(nHill));
for n=1:length(nHill)
    for r=1:length(RR)
        fi=real(squeeze(c_semi(r,n,:,5)));
        [pks,idx,w,amp]=findpeaks(fi(500:end),'MinPeakDistance',1);

        %interpolate idx of degenerate maxima
        didx=diff(idx);
        Idx=idx(1);
        I=1;
        for i=1:length(idx)-1
            if didx(i)<20
                Idx(I+1,1)=Idx(I,1)+didx(i);
                I=I+1;
            else
                Idx(I+1,1)=Idx(I,1)+floor(didx(i)/2);
                Idx(I+2,1)=Idx(I,1)+didx(i);
                I=I+2;
            end
        end
        fieq=fi(500:end);
        Pks=fieq(Idx);

        n0=Pks(2:end-1);
        N=floor(length(n0)/2);

        b=zeros(N,1);
        c=1:N;
        for a=c
            b(a,1)=mean(abs(n0(a:a+N,1)-n0(1:N+1,1)));
        end

        c=c(b<0.1);
        if diff(c)
            plot(r,diff(c),'.')
            rotation(r,n)=mean(diff(c));
        else
            rotation(r,n)=42; % chaos
        end
    end
end



%%
rotation(rotation>42)=42;
rotation=floor(rotation);
figure(1)
    imagesc(rotation')
    xlabel('lambda')
    xticks(1:20:length(lambda))
    xticklabels(lambda(1:20:end))
    ylabel('Hill coefficient n')
    yticks(1:35:length(nHill))
    yticklabels(nHill(1:35:end))
    colorbar
    
mycolormap=zeros(42,3)+0.5;

    
mycolormap(1,:)=[1,1,1];
mycolormap(2,:)=[14/255,129/255,197/255];
mycolormap(3,:)=[253/255,196/255,21/255];
mycolormap(4,:)=[219/255,13/255,21/255];
mycolormap(5:32,:)=ones(28,1)*[113/255,182/255,44/255];
mycolormap(33:42,:)= zeros(10,1)*[0,0,0];

colormap(mycolormap);

%%
save('220317_rotVSn_atc.mat','c_semi','delta','RR','nHill','RR','lambda','t_hour','t_semi','rotation','-v7.3');
