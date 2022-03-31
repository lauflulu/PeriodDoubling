clear all
close all

%%
load('210611_time.mat')
load('210611_intensities.mat')
load('cal_data')

R=size(intensities,1); %numReactors
C=size(intensities,2); %numChannels
T=size(intensities,4); %numTimepoints

% calibrate
intensities(:,1,:,:)=intensities(:,1,:,:)/cal_data(3).norm_int*1000;
intensities(:,2,:,:)=intensities(:,2,:,:)/cal_data(2).norm_int*1000;
intensities(:,3,:,:)=intensities(:,3,:,:)/cal_data(1).norm_int*1000;

time=time+0.25;
%% time traces with findpeaks
r=7;
fi=squeeze(intensities(r,:,1,:));

%% return maps
% return map TetR
[pks,idx,w,amp]=findpeaks(fi(1,:),'MinPeakDistance',3,'MinPeakProminence',1); % until 48 h
[~,in_idx,~,~]=findpeaks(fi(3,:),'MinPeakDistance',3,'MinPeakProminence',1); % until 48 h
in_idx=in_idx-min(in_idx(3:end))+min(idx(1:end));
in_idx=in_idx(in_idx>20 & in_idx<193);

peaks(r,idx)=pks;
amplitude(r,1)=mean(amp);
period(r,1)=mean(diff(time(in_idx)));

if length(in_idx)>1
idx=in_idx;
end
n0=fi(1,idx(1:3)); 
n1=fi(1,idx(2:4));

c0=0*[n0;n0]; c1=c0;
c0(1:2:end)=n0;
c0(2:2:end)=n0;
c1(1:2:end)=n0;
c1(2:2:end)=n1;

c0=reshape(c0,1,[]);
c1=reshape(c1,1,[]);

% return map s28
[pks,idx,w,amp]=findpeaks(fi(2,:),'MinPeakDistance',3,'MinPeakProminence',1); % until 48 h
[~,in_idx,~,~]=findpeaks(fi(3,:),'MinPeakDistance',3,'MinPeakProminence',1); % until 48 h
in_idx=in_idx-min(in_idx(3:end))+min(idx(1:end));
in_idx=in_idx(in_idx>20 & in_idx<193);

peaks(r,idx)=pks;
amplitude(r,1)=mean(amp);
period(r,1)=mean(diff(time(in_idx)));

if length(in_idx)>1
idx=in_idx;
end
m0=fi(2,idx(1:4)); 
m1=fi(2,idx(2:5));

d0=0*[m0;m0]; d1=d0;
d0(1:2:end)=m0;
d0(2:2:end)=m0;
d1(1:2:end)=m0;
d1(2:2:end)=m1;
d0=reshape(d0,1,[]);
d1=reshape(d1,1,[]);

figure(1)
    subplot(3,3,1)
        hold all
        plot(time,fi(1,:),'-c','LineWidth',2,'MarkerSize',15)
        plot(time,fi(2,:),'-','LineWidth',2,'MarkerSize',15,'Color',[1,0.8,0])
        plot(time,fi(3,:),'-r','LineWidth',2,'MarkerSize',15)
        plot(time(idx(1:end)),fi(2,idx(1:end)),'xk','LineWidth',2)
        xlabel('Time (h)')
        ylabel('FI (µM)')
        box('on');
        xlim([0,24])      
        xticks(0:6:24)

    subplot(3,3,4)
        hold all
        scatter(n0,n1,200.*[1:length(n0)]./length(n0),'o','filled','MarkerFaceAlpha',1)
        plot(c0,c1,'-k','LineWidth',2)
        dn=0.05*(max(n0)-min(n0));
        plot([min(n0)-dn/2,max(n0)+dn/2],[min(n0)-dn/2,max(n0)+dn/2],'-r','LineWidth',2)
        xlim([75,200]);ylim([75,200]);
        box('on')
        xlabel('max(n)'); ylabel('max(n+1)');

    subplot(3,3,7)
        hold all
        scatter(m0,m1,200.*[1:length(m0)]./length(m0),'o','filled','MarkerFaceAlpha',1)
        plot(d0,d1,'-k')
        dm=0.05*(max(m0)-min(m0));
        plot([min(m0)-dm/2,max(m0)+dm/2],[min(m0)-dm/2,max(m0)+dm/2],'-r','LineWidth',2)
        xlim([60,100]);ylim([60,100]);
        box('on')
        xlabel('max(m)'); ylabel('max(m+1)');


%%
load('210709_time.mat')
load('210709_intensities.mat')
load('cal_data.mat')

R=size(intensities,1); %numReactors
C=size(intensities,2); %numChannels
T=size(intensities,4); %numTimepoints

peaks=zeros(R,T)*nan;
amplitude=zeros(R,1);
period=zeros(R,1);

% calibrate
intensities(:,1,:,:)=intensities(:,1,:,:)/cal_data(3).norm_int*1000;
intensities(:,2,:,:)=intensities(:,2,:,:)/cal_data(2).norm_int*1000;
intensities(:,3,:,:)=intensities(:,3,:,:)/cal_data(1).norm_int*100;
    
%% fig
samplingPeriod=mean(diff(time));
samplingFrequency=1/samplingPeriod;
Tstarts=[1,23,23,25,1,1];
Tends=[200,100,147,147,200,200];
dt=mean(diff(time));
T=size(intensities,4); %numTimepoints

for r=3:4
    Tstart=Tstarts(r);
    Tend=Tends(r);
    fi=squeeze(intensities(r,:,1,:))';
    fi_trimmed=squeeze(intensities(r,:,1,Tstart:Tend))';
    T=size(fi_trimmed,1);
    t=time(:);
    t_trimmed=time(Tstart:Tend);
    
    % return map TetR
    [pks,idx,w,amp]=findpeaks(fi(1:193,1),'MinPeakDistance',3,'MinPeakProminence',1); % until 48 h
    [~,in_idx,~,~]=findpeaks(fi(:,3),'MinPeakDistance',3,'MinPeakProminence',1); % until 48 h
    in_idx=in_idx-min(in_idx(6:end))+min(idx(4:end));
    in_idx=in_idx(in_idx>20 & in_idx<193);
    peaks(r,idx)=pks;
    amplitude(r,1)=mean(amp);
    period(r,1)=mean(diff(t(in_idx)));
    if length(in_idx)>1
        idx=in_idx;
    end
    n0=fi(idx(1:8),1); 
    n1=fi(idx(2:9),1);
    c0=0*[n0;n0]; c1=c0;
    c0(1:2:end)=n0;
    c0(2:2:end)=n0;
    c1(1:2:end)=n0;
    c1(2:2:end)=n1;
    
    % return map s28
    [pks,idx,w,amp]=findpeaks(fi(1:193,2),'MinPeakDistance',3,'MinPeakProminence',1); % until 48 h
    [~,in_idx,~,~]=findpeaks(fi(:,3),'MinPeakDistance',3,'MinPeakProminence',1); % until 48 h
    in_idx=in_idx-min(in_idx(6:end))+min(idx(4:end));
    in_idx=in_idx(in_idx>20 & in_idx<193);
    peaks(r,idx)=pks;
    amplitude(r,1)=mean(amp);
    period(r,1)=mean(diff(t(in_idx)));
    if length(in_idx)>1
        idx=in_idx;
    end
    m0=fi(idx(1:8),2); 
    m1=fi(idx(2:9),2);
    d0=0*[m0;m0]; d1=d0;
    d0(1:2:end)=m0;
    d0(2:2:end)=m0;
    d1(1:2:end)=m0;
    d1(2:2:end)=m1;
  
    figure(1)
        subplot(3,3,r-1)
            hold all
            plot(t,fi(:,1),'-c','LineWidth',2,'MarkerSize',15)
            plot(t,fi(:,2),'-','LineWidth',2,'MarkerSize',15,'Color',[1,0.8,0])
            plot(t,fi(:,3),'-r','LineWidth',2,'MarkerSize',15)
            plot(t(idx(1:end)),fi(idx(1:end),2),'xk','LineWidth',2)
            xlabel('Time (h)')
            ylabel('FI (µM)')
            box('on');
            xlim([0,48])      
            xticks(0:12:48)
    
        subplot(3,3,3+r-1)
            hold all
            scatter(n0,n1,200.*[1:length(n0)]./length(n0),'o','filled','MarkerFaceAlpha',1)
            plot(c0,c1,'-k')            
            dn=0.05*(max(n0)-min(n0));
            plot([min(n0)-dn/2,max(n0)+dn/2],[min(n0)-dn/2,max(n0)+dn/2],'-r','LineWidth',2)
            xlim([75,200]);ylim([75,200]);
            box('on')
            xlabel('max(n)'); ylabel('max(n+1)');

        subplot(3,3,6+r-1)
            hold all
            scatter(m0,m1,200.*[1:length(m0)]./length(m0),'o','filled','MarkerFaceAlpha',1)
            plot(d0,d1,'-k')
            col0=[0:7,0:7,0:7,0:7,0:7]/7;
            dm=0.05*(max(m0)-min(m0));
            plot([min(m0)-dm/2,max(m0)+dm/2],[min(m0)-dm/2,max(m0)+dm/2],'-r','LineWidth',2)
            xlim([60,100]);ylim([60,100]);
            box('on')
            xlabel('max(m)'); ylabel('max(m+1)');               
end

    

    

                
