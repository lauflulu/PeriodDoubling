clear all
close all

%%
load('210611_time.mat')
load('210611_intensities.mat')
load('cal_data.mat')

R=size(intensities,1); %numReactors
C=size(intensities,2); %numChannels
T=size(intensities,4); %numTimepoints

peaks=zeros(R,T)*nan;
amplitude=zeros(R,1);
period=zeros(R,1);


%% calibrate
intensities(:,1,:,:)=intensities(:,1,:,:)/cal_data(3).norm_int*1000;
intensities(:,2,:,:)=intensities(:,2,:,:)/cal_data(2).norm_int*1000;
intensities(:,3,:,:)=intensities(:,3,:,:)/cal_data(1).norm_int*100;
    
%% fig3 

samplingPeriod=mean(diff(time));
samplingFrequency=1/samplingPeriod;
Tstarts=[1,1,1,1,1,1,1,1];
Tends=[96,96,96,96,96,96,96,96];

dt=mean(diff(time));
T=size(intensities,4); %numTimepoints

k=0;
for r=[5,6]
    k=k+1;
    Tstart=Tstarts(r);
    Tend=Tends(r);
    
    fi=squeeze(intensities(r,:,1,:))';
    fi_trimmed=squeeze(intensities(r,:,1,Tstart:Tend))';

    
    T=size(fi_trimmed,1);
    t=time(:);
    t_trimmed=time(Tstart:Tend);
    
    
    % return map TetR
    [pks,idx,w,amp]=findpeaks(fi(:,1),'MinPeakDistance',3,'MinPeakProminence',.1); % until 48 h
    [~,in_idx,~,~]=findpeaks(fi(:,3),'MinPeakDistance',3,'MinPeakProminence',.1); % until 48 h
    in_idx=in_idx-min(in_idx(3:end))+min(idx(4:end));
    in_idx=in_idx(in_idx>0 & in_idx<96);
    
    peaks(r,idx)=pks;
    amplitude(r,1)=mean(amp);
    period(r,1)=mean(diff(t(in_idx)));
    
    if length(in_idx)>1
        idx=in_idx;
    end
    idx1=idx;
    n0=fi(idx(1:end-1),1); 
    n1=fi(idx(2:end),1);

    c0=0*[n0;n0]; c1=c0;
    c0(1:2:end)=n0;
    c0(2:2:end)=n0;
    c1(1:2:end)=n0;
    c1(2:2:end)=n1;
    
    % return map s28
    [pks,idx,w,amp]=findpeaks(fi(:,2),'MinPeakDistance',3,'MinPeakProminence',.1); 
    [~,in_idx,~,~]=findpeaks(fi(:,3),'MinPeakDistance',3,'MinPeakProminence',.1);
    in_idx=in_idx-min(in_idx(3:end))+min(idx(4:end));
    in_idx=in_idx(in_idx>0 & in_idx<96);
    
    peaks(r,idx)=pks;
    amplitude(r,1)=mean(amp);
    period(r,1)=mean(diff(t(in_idx)));
    
    if length(in_idx)>1
        idx=in_idx;
    end
    m0=fi(idx(1:end-1),2); 
    m1=fi(idx(2:end),2);

    d0=0*[m0;m0]; d1=d0;
    d0(1:2:end)=m0;
    d0(2:2:end)=m0;
    d1(1:2:end)=m0;
    d1(2:2:end)=m1;
  

      figure(10)
    
        subplot(5,2,k)
            hold all
            plot(t,fi(:,1),'-c','LineWidth',2,'MarkerSize',15)
            plot(t,fi(:,2),'-','LineWidth',2,'MarkerSize',15,'Color',[1,0.8,0])
            plot(t,fi(:,3),'-r','LineWidth',2,'MarkerSize',15)
            plot(t(idx(1:end)),fi(idx(1:end),2),'xk','LineWidth',2)
            plot(t(idx1(1:end)),fi(idx1(1:end),1),'xk','LineWidth',2)

            xlabel('Time (h)')
            ylabel('FI (µM)')
            box('on');
            xlim([0,24])      
            xticks(0:6:24)
        
 
        % trajectories
        subplot(5,2,2+k)
            Ncolor=256;
            red=[219,13,21]/255;
            yellow=[253,196,21]/255;
            green=[113,182,44]/255;
            blue=[14,129,197]/255;

            fi_mT=fi_trimmed(20:end,1);
            fi_mV=fi_trimmed(20:end,2);
                  
            hold all
            plot(fi_mV,fi_mT,'.-','MarkerSize',15,'Color',[.8,.8,.8])
            
            dV=0.05*(max(fi_mV)-min(fi_mV)); dT=0.05*(max(fi_mT)-min(fi_mT));
            xlim([min(fi_mV)-dV,max(fi_mV)+dV]); ylim([min(fi_mT)-dT,max(fi_mT)+dT]);
            
            xlim([25,85]);ylim([20,120]);

            ylabel('mT~TetR (au)')
            xlabel('mV~s28 (au)')
            box('on')


            subplot(5,2,2*2+k)
                %title('Max. Return Map')
                hold all
                scatter(n0,n1,200.*[1:length(n0)]./length(n0),'o','filled','MarkerFaceAlpha',1)
                plot(c0,c1,'-k')                     
                dn=0.05*(max(n0)-min(n0));
                plot([min(n0)-dn/2,max(n0)+dn/2],[min(n0)-dn/2,max(n0)+dn/2],'-r','LineWidth',2)
                xlim([30,120]);ylim([30,120]);
                box('on')
                xlabel('max(n)'); ylabel('max(n+1)');
                
            subplot(5,2,3*2+k)
                %title('Max. Return Map')
                hold all
                scatter(m0,m1,200.*[1:length(m0)]./length(m0),'o','filled','MarkerFaceAlpha',1)

                plot(d0,d1,'-k')
                dm=0.05*(max(m0)-min(m0));
                plot([min(m0)-dm/2,max(m0)+dm/2],[min(m0)-dm/2,max(m0)+dm/2],'-r','LineWidth',2)
                xlim([50,90]);ylim([50,90]);
                box('on')
                xlabel('max(m)'); ylabel('max(m+1)');
                
             subplot(5,2,4*2+k)
                 RR_insta=1-fi(2:end,3)./fi(1:end-1,3);
                 RR_insta(RR_insta>1 | RR_insta<0)=nan;
                 RR_insta(fi(1:end-1,3)/max(fi(1:end-1,3))<0.3)=nan;
                 hold all
                 RRi24h=nanmean(RR_insta(1:end));
                 lambda=-log(1-RRi24h)*mean(diff(in_idx))/pi();
                 plot([0,50],[1,1]*RRi24h,'--r')
                 plot(time(2:end),RR_insta,'.')
                 title(sprintf('Inst. Refresh Ratio=%.1f, L=%.2f',[RRi24h*100,lambda]))
                 ylim([floor(min(RR_insta)*100)/100,ceil(max(RR_insta)*100)/100])
                 xlim([0,24])
                 xticks(0:6:24)
                 xlabel('Time (h)')
                 box('on')
                 
                 
end

    
  
%%
figure(2)
    plot3(fi_trimmed(:,1),fi_trimmed(:,2),fi_trimmed(:,3))
    

    
