clear all
close all

%%
load('210628_time.mat')
load('210628_intensities.mat')
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
   
%%
load('210611_time.mat')
load('210611_intensities.mat')
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

    
%% trajectory for figure 6
figure(2)
    plot(fi(2,20:end),fi(1,20:end),'-k','LineWidth',2)
    ylabel('mT');xlabel('mV');
    xlim([20,100]);ylim([50,220]);
