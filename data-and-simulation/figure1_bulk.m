%% 200114
close all
clear all
clc

%% Initialize data
load('210722_bulk_data.mat')

time=data(1).time;

a={data.FI};  a=cat(3, a{:}); 

pTet=squeeze(a(:,1,1:12)); 
bg_tet=median(squeeze(a(:,1,13:end)-a(1,1,13:end)),2);
pTet=pTet-bg_tet; 
pTet=pTet-pTet(1,:);
p28=squeeze(a(:,3,13:end)); 
bg_28=median(squeeze(a(:,3,1:12)-a(1,3,1:12)),2);
p28=p28-bg_28;
p28=p28-p28(1,:);

refTet=squeeze(a(:,2,1:12)); refTet=refTet-squeeze(a(:,2,12)); refTet=mean(refTet(100:end,:),1);
refS28=squeeze(a(:,2,13:end)); refS28=refS28-squeeze(a(:,2,24)); refS28=mean(refS28(100:end,:),1);

leg={data.tag};

%% all channels
set(groot,'defaultAxesColorOrder','factory')
figure(1);
for j=1:24
    subplot(4,6,j)
        hold all
        for c=1:3
            plot(time, a(:,c,j),'-');
            xlabel('Time (h)'); ylabel('fi (au)'); box('on');
        end
       
end

%%
figure(2)
    subplot(1,3,1)
        hold all
        for i=1:12
            plot(time, pTet(:,i),'-', 'Color', [1,0,0]*i/12)
        end
        plot(time,bg_tet,'--g')
        

        
    subplot(1,3,2)
        hold all
        for i=1:12
            plot(time, p28(:,i),'-', 'Color', [0,0,1]*i/12)
        end
         plot(time,bg_28,'--g')

    subplot(1,3,3)
        hold all
        plot(refTet)
        plot(refS28)
        set(gca,'YScale','log')

%%
pTet_end=pTet(end,:); 
pTet_end=pTet_end'/max(pTet_end); % so a does not need to be a fitting parameter

pS28_end=p28(end,:); 
pS28_end=pS28_end'/max(pS28_end); % so a does not need to be a fitting parameter

c_s28=zeros(12,1);
c_tet=zeros(12,1);
for i=1:11
    c_s28(i,1)=4000/2^(i-1);
    c_tet(i,1)=400/2^(i-1);
end


%%
fo = fitoptions('Method','NonlinearLeastSquares',...
               'Lower',[0,0,-10,-0.1],...
               'Upper',[1,Inf,10,1],...
               'StartPoint',[1, 100,1,0]);
           
ft = fittype(@(a,K,n,c,x) a./(1+(x/K).^n)+c,...
    'independent', {'x'},...
    'dependent', {'z'},...
    'coefficient', {'a', 'K', 'n','c'},...
    'options',fo);

f1=@(a,K,n,c,x) a./(1+(x./K).^n)+c;
[fit_28,gof_28] = fit(c_s28,pS28_end,ft);
[fit_tet,gof_tet] = fit(c_tet,pTet_end,ft);
ci_28=confint(fit_28,0.68);
ci_tet=confint(fit_tet,0.68);

x_s28=linspace(0,4000,1000);
x_tet=linspace(0,400,1000);

figure(9)
    subplot(1,2,1)
        hold all
        plot(x_s28,f1(fit_28.a,fit_28.K,fit_28.n,fit_28.c,x_s28),'-r','LineWidth',2) 
        plot(c_s28,pS28_end,'.-k','MarkerSize',15)
        text(1000,0.6,sprintf('K=%2.1f ± %2.1f \nn=%2.2f ± %2.2f \nR^2=%0.3f',fit_28.K,ci_28(2,2)-fit_28.K,...
            fit_28.n,ci_28(2,3)-fit_28.n,gof_28.rsquare))
        box('on'); %grid('on');
        set(gca,'XScale','log');
        xticks([4,40,400,4000])
        yticks(0:0.2:1)
        xlim([0.7*4,1.3*4000])
        ylim([-0.05,1.05])
        xlabel('s28 (nM)'); ylabel('dmTq2 (au)');
    subplot(1,2,2)
        hold all
        plot(x_tet,f1(fit_tet.a,fit_tet.K,fit_tet.n,fit_tet.c,x_tet),'-r','LineWidth',2) 
        plot(c_tet,pTet_end,'.-k','MarkerSize',15)
        text(100,0.8,sprintf('K=%2.1f ± %2.1f \nn=%2.2f ± %2.2f \nR^2=%0.3f',fit_tet.K,ci_tet(2,2)-fit_tet.K,...
            fit_tet.n,ci_tet(2,3)-fit_tet.n,gof_tet.rsquare))
        box('on'); %grid('on');
        set(gca,'XScale','log');
        xticks([0.4,4,40,400])
        yticks(0:0.2:1)
        xlim([0.7*0.4,1.3*400])
        ylim([-0.05,1.05])
        xlabel('tetR (nM)'); ylabel('mV (au)');
        
%%
alpha=0.03
figure(8)
    hold all
    plot(f1(fit_28.a,fit_28.K,fit_28.n,fit_28.c,x_s28),x_s28/200*alpha,'-b')
     plot(pS28_end,c_s28/200*alpha,'.c','MarkerSize',15)
    plot(x_tet/5*alpha,f1(fit_tet.a,fit_tet.K,fit_tet.n,fit_tet.c,x_tet),'-y');
    plot(c_tet/5*alpha,pTet_end,'.k','MarkerSize',15)
    xlim([-0.1,1.3]);
    ylim([-0.1,1.3]);
    box('on'); xlabel('TetR (au)'); ylabel('S28 (au)');
%     set(gca,'XScale','log');
%     set(gca,'YScale','log');
