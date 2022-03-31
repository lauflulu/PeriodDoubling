clear all
close all

%%
load('210629_time.mat')
load('210629_intensities.mat')
load('cal_data')

leg={'Ring1: 0x aTc, RR25%','Ring2: 0x aTc, RR25%','Ring3: 0x aTc, RR30%','Ring4: 0x aTc, RR30%',...
    'Ring5: 1x aTc, RR25%','Ring6: 1x aTc, RR25%','Ring7: 1.2x aTc, RR30%','Ring8: 1.2x aTc, RR30%'};

R=size(intensities,1); %numReactors
C=size(intensities,2); %numChannels
T=size(intensities,4); %numTimepoints



% calibrate
intensities(:,1,:,:)=intensities(:,1,:,:)/cal_data(3).norm_int/8*1000;
intensities(:,2,:,:)=intensities(:,2,:,:)/cal_data(2).norm_int/8*1000;
intensities(:,3,:,:)=intensities(:,3,:,:)/cal_data(1).norm_int/8*1000;
    
time=time+0.25;
%% time traces with findpeaks
figure(1)
    for r=6
        subplot(2,2,1)
            fi=squeeze(intensities(r,:,1,:));
          
            hold all
            plot(time,fi(1,:),'.-c','LineWidth',2,'MarkerSize',15)
            plot(time,fi(2,:),'.-','LineWidth',2,'MarkerSize',15,'Color',[1,0.8,0])
            plot(time,fi(3,:),'.-g','LineWidth',2,'MarkerSize',15)

            xlabel('Time (h)')
            ylabel('Reporter (nM)')
            box('on')
            title(leg{1,r});
            xlim([0,24.25]);
            xticks(0:4:24)
            ylim([0,700]);
            yticks([0:200:600])
    end
    
    
    % lambda
    subplot(2,2,3)
        [~,in_idx,~,~]=findpeaks(fi(3,:),'MinPeakDistance',3,'MinPeakProminence',1); % until 48 h

        RR_insta=1-fi(3,2:end)./fi(3,1:end-1);
        RR_insta(RR_insta>1 | RR_insta<0)=nan;
        RR_insta(fi(3,1:end-1)/max(fi(3,1:end-1))<0.3)=nan;
        hold all
        RRi24h=nanmean(RR_insta(1:end));
        lambda=-log(1-RRi24h)*mean(diff(in_idx))/pi();
        plot([0,50],[1,1]*RRi24h,'--r')
        plot(time(2:96),RR_insta,'.')
        title(sprintf('Inst. Refresh Ratio=%.1f, L=%.2f',[RRi24h*100,lambda]))
        ylim([floor(min(RR_insta)*100)/100,ceil(max(RR_insta)*100)/100])
        xlim([0,24.25])
        xticks(0:4:24)
        xlabel('Time (h)')
        box('on')
        
%% return maps
    % return map TetR
    [pks,idx,w,amp]=findpeaks(fi(1,:),'MinPeakDistance',3,'MinPeakProminence',1); 
    [~,in_idx,~,~]=findpeaks(fi(3,:),'MinPeakDistance',3,'MinPeakProminence',1);
    in_idx=in_idx-min(in_idx(3:end))+min(idx(4:end));
    in_idx=in_idx(in_idx>10 & in_idx<193);
    
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
    in_idx=in_idx-min(in_idx(3:end))+min(idx(4:end));
    in_idx=in_idx(in_idx>10 & in_idx<193);
    
    peaks(r,idx)=pks;
    amplitude(r,1)=mean(amp);
    period(r,1)=mean(diff(time(in_idx)));
    
    if length(in_idx)>1
        idx=in_idx;
    end
    m0=fi(2,idx(1:3)); 
    m1=fi(2,idx(2:4));

    d0=0*[m0;m0]; d1=d0;
    d0(1:2:end)=m0;
    d0(2:2:end)=m0;
    d1(1:2:end)=m0;
    d1(2:2:end)=m1;
    
    d0=reshape(d0,1,[]);
    d1=reshape(d1,1,[]);
  


      figure(10)
    
        subplot(3,2,1)
            hold all
            plot(time,fi(1,:),'-c','LineWidth',2,'MarkerSize',15)
            plot(time,fi(2,:),'-','LineWidth',2,'MarkerSize',15,'Color',[1,0.8,0])
            plot(time,fi(3,:),'-r','LineWidth',2,'MarkerSize',15)
            plot(time(idx(1:end)),fi(2,idx(1:end)),'xk','LineWidth',2)

            xlabel('Time (h)')
            ylabel('FI (µM)')
            box('on');
            xlim([0,48])      
            xticks(0:12:48)
            
            subplot(3,2,3)
                %title('Max. Return Map')
                hold all
                scatter(n0,n1,200.*[1:length(n0)]./length(n0),'o','filled','MarkerFaceAlpha',1)
                plot(c0,c1,'-k','LineWidth',2)
                dn=0.05*(max(n0)-min(n0));
                plot([min(n0)-dn/2,max(n0)+dn/2],[min(n0)-dn/2,max(n0)+dn/2],'-r','LineWidth',2)
                %xlim([75,200]);ylim([75,200]);
                box('on')
                xlabel('max(n)'); ylabel('max(n+1)');
                
            subplot(3,2,5)
                %title('Max. Return Map')
                hold all
                scatter(m0,m1,200.*[1:length(m0)]./length(m0),'o','filled','MarkerFaceAlpha',1)

                plot(d0,d1,'-k')

                dm=0.05*(max(m0)-min(m0));
                plot([min(m0)-dm/2,max(m0)+dm/2],[min(m0)-dm/2,max(m0)+dm/2],'-r','LineWidth',2)
                %xlim([60,100]);ylim([60,100]);
                box('on')
                xlabel('max(m)'); ylabel('max(m+1)');
                       
        
   
%%
load('210612_time.mat')
load('210614_intensities.mat')
load('cal_data')

leg={'Ring1: 50 nM TetR, 0 h, RR20%','Ring2: 50 nM TetR, 2 h, RR20%','Ring3: 50 nM TetR, 2.5 h, RR20%','Ring4: 50 nM TetR, 3 h, RR20%',...
    'Ring5: 50 nM TetR, 3.5 h, RR20%','Ring6: 50 nM TetR, 4 h, RR20%','Ring7: 50 nM TetR, 5 h, RR20%','Ring8: 50 nM TetR, 0 h, RR20%'};

R=size(intensities,1); %numReactors
C=size(intensities,2); %numChannels
T=size(intensities,4); %numTimepoints

% calibrate
intensities(:,1,:,:)=intensities(:,1,:,:)/cal_data(3).norm_int*1000;
intensities(:,2,:,:)=intensities(:,2,:,:)/cal_data(2).norm_int*1000;
intensities(:,3,:,:)=intensities(:,3,:,:)/cal_data(1).norm_int*1000;
    
time=time+0.25;
%% time traces with findpeaks
figure(1)
    for r=7
        subplot(2,2,2)
            fi=squeeze(intensities(r,:,1,:));
        
          
            hold all
            plot(time,fi(1,:),'.-c','LineWidth',2,'MarkerSize',15)
            plot(time,fi(2,:),'.-','LineWidth',2,'MarkerSize',15,'Color',[1,0.8,0])
            plot(time,fi(3,:),'.-r','LineWidth',2,'MarkerSize',15)

            xlabel('Time (h)')
            ylabel('Reporter (nM)')
            box('on')
            title(leg{1,r});
            xlim([0,24.25]);
            xticks([0:5:20,24])
            ylim([0,350]);
            yticks([0:100:300])
    end
    %lambda
    subplot(2,2,4)
        [~,in_idx,~,~]=findpeaks(fi(3,:),'MinPeakDistance',3,'MinPeakProminence',1); % until 48 h

        RR_insta=1-fi(3,2:end)./fi(3,1:end-1);
        RR_insta(RR_insta>1 | RR_insta<0)=nan;
        RR_insta(fi(3,1:end-1)/max(fi(3,1:end-1))<0.3)=nan;
        hold all
        RRi24h=nanmean(RR_insta(1:end));
        lambda=-log(1-RRi24h)*mean(diff(in_idx))/pi();
        plot([0,50],[1,1]*RRi24h,'--r')
        plot(time(2:96),RR_insta,'.')
        title(sprintf('Inst. Refresh Ratio=%.1f, L=%.2f',[RRi24h*100,lambda]))
        ylim([floor(min(RR_insta)*100)/100,ceil(max(RR_insta)*100)/100])
        xlim([0,24.25])
        xticks(0:4:24)
        xlabel('Time (h)')
        box('on')

    
%% trajectory
figure(2)
    plot(fi(2,20:end),fi(1,20:end),'-k','LineWidth',2)
    ylabel('mT');xlabel('mV');
    xlim([20,100]);ylim([50,220]);
    
    
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

  


      figure(10)
    
        subplot(3,2,2)
            hold all
            plot(time,fi(1,:),'-c','LineWidth',2,'MarkerSize',15)
            plot(time,fi(2,:),'-','LineWidth',2,'MarkerSize',15,'Color',[1,0.8,0])
            plot(time,fi(3,:),'-r','LineWidth',2,'MarkerSize',15)
            plot(time(idx(1:end)),fi(2,idx(1:end)),'xk','LineWidth',2)

            xlabel('Time (h)')
            ylabel('FI (µM)')
            box('on');
            xlim([0,48])      
            xticks(0:12:48)
            
            subplot(3,2,2*2)
                %title('Max. Return Map')
                hold all
                scatter(n0,n1,200.*[1:length(n0)]./length(n0),'o','filled','MarkerFaceAlpha',1)
                plot(c0,c1,'-k','LineWidth',2)
                dn=0.05*(max(n0)-min(n0));
                plot([min(n0)-dn/2,max(n0)+dn/2],[min(n0)-dn/2,max(n0)+dn/2],'-r','LineWidth',2)
                xlim([75,200]);ylim([75,200]);
                box('on')
                xlabel('max(n)'); ylabel('max(n+1)');
                
            subplot(3,2,3*2)
                %title('Max. Return Map')
                hold all
                scatter(m0,m1,200.*[1:length(m0)]./length(m0),'o','filled','MarkerFaceAlpha',1)

                plot(d0,d1,'-k')

                dm=0.05*(max(m0)-min(m0));
                plot([min(m0)-dm/2,max(m0)+dm/2],[min(m0)-dm/2,max(m0)+dm/2],'-r','LineWidth',2)
                xlim([60,100]);ylim([60,100]);
                box('on')
                xlabel('max(m)'); ylabel('max(m+1)');
                
                
clear all
close all

%%
load('210712_time.mat')
load('210712_intensities.mat')
load('cal_data.mat')

leg={'Ring1: RR20%, no input','Ring2: RR20%, 3.25 h','Ring3: RR20%, 3.5 h','Ring4: RR20%, 3.75 h',...
    'Ring7: RR20%, 4 h','Ring8: RR20%, no input'};

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
Tstarts=[1,23,23,25,1,1];
Tends=[200,100,147,147,200,200];

dt=mean(diff(time));
T=size(intensities,4); %numTimepoints


for r=1:4
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
  

      figure(10)
    
        subplot(5,4,r)
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
        
 
        % trajectories
        subplot(5,4,4+r)
            Ncolor=256;
            red=[219,13,21]/255;
            yellow=[253,196,21]/255;
            green=[113,182,44]/255;
            blue=[14,129,197]/255;

            edgeColors=[red;yellow;green;blue];

            mycolormap=zeros(Ncolor*length(edgeColors),3);
            for edge=1:length(edgeColors)
                edge1=mod(edge,length(edgeColors))+1;
                edge2=mod(edge-1,length(edgeColors))+1;
                for i=1:Ncolor
                    mycolormap(Ncolor*(edge-1)+i,:)=edgeColors(edge1,:)*i/Ncolor+edgeColors(edge2,:)*(1-i/Ncolor);
                end
            end


            fi_mT=fi_trimmed(:,1);
            fi_mV=fi_trimmed(:,2);
            
            dt=idx(6)-idx(2);
            
            

            color=mod(t_trimmed*4-Tstart-8,dt)/dt;

            hold all
            plot(fi_mV,fi_mT,'.-','MarkerSize',15,'Color',[.8,.8,.8])
            patch([fi_mV; nan],[fi_mT; nan],[color; nan],'FaceColor','none','EdgeColor','interp','LineWidth',2)
            dV=0.05*(max(fi_mV)-min(fi_mV)); dT=0.05*(max(fi_mT)-min(fi_mT));
            xlim([min(fi_mV)-dV,max(fi_mV)+dV]); ylim([min(fi_mT)-dT,max(fi_mT)+dT]);
           


            hcb=colorbar;
            ylabel(hcb,'Time (h)','rotation',270,'VerticalAlignment','middle')
            
            ticklocs=linspace(0,0.98,5);
            ticks=linspace(t(idx(1)),t(idx(5)),5);
            ticks2=linspace(t(idx(5)),t(idx(9)),5);
            set(hcb,'YTick',ticklocs,'YTickLabel',ticks)
             xlim([20,100]);ylim([50,220]);


            ylabel('mT~TetR (au)')
            xlabel('mV~s28 (au)')
            box('on')
            %title([leg{1,r},sprintf('\nPeriod %.1f h\nAmplitude: %.1f au',period(r),amplitude(r))]);
            text(40,200,string(ticks2))

            colormap(mycolormap)   
            
            subplot(5,4,2*4+r)
                %title('Max. Return Map')
                hold all
                scatter(n0,n1,200.*[1:length(n0)]./length(n0),'o','filled','MarkerFaceAlpha',1)

                plot(c0,c1,'-k')
                col0=[0:7,0:7,0:7,0:7,0:7]/7;
                patch([c0; nan],[c1; nan],[col0(8:length(c0)+7)'; nan],'FaceColor','none','EdgeColor','interp','LineWidth',2)
                %colormap('spring')
                dn=0.05*(max(n0)-min(n0));
                plot([min(n0)-dn/2,max(n0)+dn/2],[min(n0)-dn/2,max(n0)+dn/2],'-r','LineWidth',2)
                xlim([75,200]);ylim([75,200]);
                box('on')
                xlabel('max(n)'); ylabel('max(n+1)');
                
            subplot(5,4,3*4+r)
                %title('Max. Return Map')
                hold all
                scatter(m0,m1,200.*[1:length(m0)]./length(m0),'o','filled','MarkerFaceAlpha',1)

                plot(d0,d1,'-k')
                col0=[0:7,0:7,0:7,0:7,0:7]/7;
                patch([d0; nan],[d1; nan],[col0(8:length(d0)+7)'; nan],'FaceColor','none','EdgeColor','interp','LineWidth',2)
                %colormap('spring')
                dm=0.05*(max(m0)-min(m0));
                plot([min(m0)-dm/2,max(m0)+dm/2],[min(m0)-dm/2,max(m0)+dm/2],'-r','LineWidth',2)
                xlim([60,100]);ylim([60,100]);
                box('on')
                xlabel('max(m)'); ylabel('max(m+1)');
                
             subplot(5,4,4*4+r)
                 RR_insta=1-fi(2:200,3)./fi(1:200-1,3);
                 RR_insta(RR_insta>1 | RR_insta<0)=nan;
                 RR_insta(fi(1:200-1,3)/max(fi(1:200-1,3))<0.3)=nan;
                 hold all
                 RRi24h=nanmean(RR_insta(1:96));
                 lambda=-log(1-RRi24h)*mean(diff(in_idx))/pi();
                 plot([0,50],[1,1]*RRi24h,'--r')
                 plot(time(2:200),RR_insta,'.')
                 title(sprintf('Inst. Refresh Ratio=%.1f, L=%.2f',[RRi24h*100,lambda]))
                 ylim([floor(min(RR_insta)*100)/100,ceil(max(RR_insta)*100)/100])
                 xlim([0,48])
                 xticks(0:12:48)
                 xlabel('Time (h)')
                 box('on')
                 
                 
end

    
  
%%
figure(2)
    plot3(fi_trimmed(:,1),fi_trimmed(:,2),fi_trimmed(:,3))
    

    

                
