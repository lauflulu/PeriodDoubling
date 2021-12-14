clear all
close all

%%
load('210709_time.mat')
load('210709_intensities.mat')
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
    
%% fig4 
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
    
    
    % return map
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
  

      figure(10)
    
        subplot(4,4,r)
            hold all
            plot(t,fi(:,1),'-c','LineWidth',2,'MarkerSize',15)
            plot(t,fi(:,2),'-','LineWidth',2,'MarkerSize',15,'Color',[1,0.8,0])
            plot(t,fi(:,3),'-r','LineWidth',2,'MarkerSize',15)
            plot(t(idx(1:end)),fi(idx(1:end),1),'xk','LineWidth',2)

            xlabel('Time (h)')
            ylabel('FI (µM)')
            box('on');
            xlim([0,48])      
            xticks(0:12:48)
        
 
        % trajectories
        subplot(4,4,4+r)
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
            
            subplot(4,4,2*4+r)
                %title('Max. Return Map')
                hold all
                scatter(n0,n1,200.*[1:length(n0)]./length(n0),'o','filled','MarkerFaceAlpha',1)

                plot(c0,c1,'-k')
                col0=[0:7,0:7,0:7,0:7,0:7]/7;
                patch([c0; nan],[c1; nan],[col0(8:length(c0)+7)'; nan],'FaceColor','none','EdgeColor','interp','LineWidth',2)
                %colormap('spring')
                dn=0.05*(max(n0)-min(n0));
                plot([min(n0)-dn/2,max(n0)+dn/2],[min(n0)-dn/2,max(n0)+dn/2],'-r','LineWidth',2)
                xlim([min(n0)-dn,max(n0)+dn]);ylim([min(n0)-dn,max(n0)+dn]);
                box('on')
                xlabel('max(n)'); ylabel('max(n+1)');
                
             subplot(4,4,3*4+r)
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
    

    
