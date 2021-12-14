clear all
close all

%% example time traces
load('210518_time.mat')
load('210518_intensities.mat')
load('cal_data')

RR=[0.10:0.05:0.3,0.25,0.2,0.15];

% calibrate
intensities(:,1,:,:)=intensities(:,1,:,:)/cal_data(3).norm_int*1000;
intensities(:,2,:,:)=intensities(:,2,:,:)/cal_data(2).norm_int*1000;

% time traces
k=0;
figure(1)
    for r=[1,8,3,4,5]
        k=k+1;
        subplot(4,2,k)
        
            fi=squeeze(intensities(r,:,1,:));
            
            hold all
            plot(time,fi(1,:),'-c','LineWidth',2,'MarkerSize',15)
            plot(time,fi(2,:),'-','LineWidth',2,'MarkerSize',15,'Color',[1,0.8,0])

            xlabel('Time (h)')
            ylabel('FI (au)')
            box('on')
            xlim([0,20]);
            ylim([0,max(fi,[],'all')*1.1])
            title([sprintf('RR = %.1f %%',RR(r)*100),', DNA = 1 nM']);
    end
%%
load('210705_time.mat')
load('210705_intensities.mat')

% calibrate
intensities(:,1,:,:)=intensities(:,1,:,:)/cal_data(3).norm_int*1000;
intensities(:,2,:,:)=intensities(:,2,:,:)/cal_data(2).norm_int*1000;

alphas=[0,0.5,1,2,5,10,5,0.5]/5; % DNA in nM

% time traces
figure(1)
    for r=[3:5]
        k=k+1;
        subplot(4,2,k)
        
            fi=squeeze(intensities(r,:,1,:));
            
            hold all
            plot(time,fi(1,:),'-c','LineWidth',2,'MarkerSize',15)
            plot(time,fi(2,:),'-','LineWidth',2,'MarkerSize',15,'Color',[1,0.8,0])
            title(['RR = 25 %, ',sprintf('DNA = %.1f nM',alphas(r))])

            xlabel('Time (h)')
            ylabel('FI (au)')
            box('on')
            xlim([0,20]);
            ylim([0,max(fi(1:2,:),[],'all')*1.1])

    end



    
