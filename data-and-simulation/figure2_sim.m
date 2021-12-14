clear all
close all
%% system parameters
a_p28=.1; a_pLtetO1=.1; %nM/s
%alphas=logspace(-4,-2,21); % fine
alphas=logspace(-4,-2,7); % coarse

k_TL = .02; % 1/s
t_m = 12*60; % 1/s
K_s28=20; K_tetR=2; %nM
n_s28=3; n_tetR=3; 

k= [a_p28,a_pLtetO1,k_TL,t_m,K_s28,K_tetR,n_s28,n_tetR];

%%
%RR=0.1:0.02:0.50; %fine
RR=0.1:0.05:0.30; %coarse

t_interval=15; %min
t_min=0:t_interval:24*60*7;
t_sec= t_min*60; %seconds
t_hour=t_sec/3600;

delta=-log(1-RR)/(t_interval*60); %1/s, base e

y0=[0;0;0;0;0;0];

semiOut='up'; contOut='up';
if strcmp(semiOut,'up') || strcmp(semiOut,'low')
    t_semi=zeros(length(alphas),length(RR),length(t_sec));
    c_semi=zeros(length(alphas),length(RR),length(t_sec),length(y0));
else
    t_semi=zeros(length(alphas),length(RR),(length(t_sec)-1)*10);
    c_semi=zeros(length(alphas),length(RR),(length(t_sec)-1)*10,length(y0));
end

tic;
for a=1:length(alphas)
        for r=1:length(RR)
            k(1,1)=alphas(a); k(1,2)=alphas(a);
            [t_semi(a,r,:),c_semi(a,r,:,:)]=...
                semiContinuousODE(@(t,y)ode_simple_mRNA(t,y,k,0),t_sec,y0,RR(r),generateInput(0,0,t_sec,y0),semiOut);
        end
end
toc

%%
c_cont=c_semi;
t_cont=t_semi;
%%
A=length(alphas); R=length(RR);
if true
    tc=squeeze(t_cont(A,R,:)/3600);

    figure(1)
    for a=1:A
        for r=1:R
            c_cont5=squeeze(c_cont(a,r,:,5));
            c_cont6=squeeze(c_cont(a,r,:,6));

            subplot(A,R,(A-a)*R+r)
                hold all
                plot(tc,c_cont5,'m')
                plot(tc,c_cont6,'b')
                xlabel('t (h)');
                ylabel('S28/TetR (nM)')
                xlim([0,20])
                box('on')
                title(sprintf('alhpa=%.3f, RR=%.2f',alphas(a),RR(r)))
        end
    end
end
%%
damping=zeros(A,R);
amplitude=zeros(A,R);
period=zeros(A,R);
peaks=cell(A,R);
teq=zeros(A,R);

i=5;

for a=1:A
    for r=1:R
        [pk,locs,w,amp]=findpeaks(-squeeze(c_cont(a,r,:,i)),'MinPeakProminence',.1); %find first minimum
        if length(pk)>=2
            [pks,idx,w,amp]=findpeaks(squeeze(c_cont(a,r,1:end,i)),'MinPeakProminence',.1);
            peaks{a,r}=pks;
            ampLoss=amp(2:end)./amp(1:end-1);
            try
                damping(a,r)=1-mean(ampLoss(end-20:end));
            catch
                damping(a,r)=1-mean(ampLoss);
            end
            period(a,r)=mean(diff(t_hour(locs)));
            [ub,lb]=envelope(squeeze(c_cont(a,r,1:end,i)),3,'peak');
            db=(ub-lb)./(ub+lb)*2;
            amplitude(a,r)=mean(db(end-100:end-10));
        
                d_log=log(pks(1:end-1)./pks(2:end));
                try
                    d_log=d_log(end-10:end);
                catch
                    a=a;
                end
                d_log=mean(d_log);
                       
        else
            peaks{a,r}=[];
            damping(a,r)=0;
            period(a,r)=0;
            amplitude(a,r)=0;
            
            [xData, yData] = prepareCurveData( t_hour(2:end)', squeeze(c_cont(a,r,2:end,i)) );

            ft = fittype( 'a*exp(-b*x)+c', 'independent', 'x', 'dependent', 'y' );
            opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
            opts.Display = 'Off';
            opts.StartPoint = [-1 1 1];
            opts.Lower = [-inf 0 0];
            opts.Upper = [0 Inf Inf];

            % Fit model to data.
            [fitresult, gof] = fit( xData, yData, ft, opts );
            teq(a,r)=1/fitresult.b;
        end
        

    end
  
end

leg=cell(size(RR));
for r=1:length(RR)
    leg{1,r}=[sprintf('RR %.1f',RR(r)*100),'%'];
end

figure(2)
    subplot(1,3,1)
         imagesc(damping)
         
     subplot(1,3,2)
        imagesc(amplitude)
        
    subplot(1,3,3)
        imagesc(period)
        
%% phase space plot
LAred=[219/255,13/255,21/255];
LAblue=[14/255,129/255,197/255];
LAyellow=[253/255,196/255,21/255];

c_damping=damping(:);
c_damping=reshape(normalize(c_damping,'range'),size(damping));
l_damping=(damping>amplitude);

c_amplitude=amplitude(:);
c_amplitude=reshape(normalize(c_amplitude,'range'),size(damping));
l_amplitude=(amplitude>damping);

c_teq=teq(:);
c_teq=reshape(normalize(c_teq,'range'),size(damping));

I_rgb=zeros([size(damping),3]);
for rgb=1:3
    I_rgb(:,:,rgb)=c_damping*LAred(rgb)+c_amplitude*LAblue(rgb)+c_teq*LAyellow(rgb);
end

figure(3)
    imagesc(I_rgb);
    xticks(1:length(RR))
    xticklabels(RR(1:end))
    xlabel('Refresh Ratio')
    ylabel('alpha=beta (nM/s)')
    yticks(1:1:length(alphas))
    yticklabels(alphas(1:1:length(alphas)))
    axis('xy')