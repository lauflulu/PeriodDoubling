%% Tiff-Concatenator
clear all
close all

%% Select the correct .Tiff file:
[pathName]  = uigetdir();

if ~isfolder([pathName,'\original'])
    error("the folder and/or file structure is invalid.");
end

if ~isfolder([pathName,'\SinglePosSingleChan'])
    mkdir([pathName,'\SinglePosSingleChan']);
end
    
files = dir(fullfile([pathName,'\original'], '*tif'));    
T=length(files);

dlgtitle = 'How many different positions did you evaluate?';
prompt= {'Number of positions','Channels'};
dims = [1 35];
definput = {'8','3'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
numReactor = str2double(answer{1});
numChan = str2double(answer{2});

[Y,X]=size(imread([files(1).folder,'\',files(1).name]));

%%
time=zeros(T,1);
tmp=split(files(1).name,'_');
t0=str2num(tmp{1})*24+str2num(tmp{2})+str2num(tmp{3})/60+str2num(tmp{4})/3600;
for t=1:T
    tmp=split(files(t).name,'_');
    t1=str2num(tmp{1})*24+str2num(tmp{2})+str2num(tmp{3})/60+str2num(tmp{4})/3600;
    time(t,1)=t1-t0;
end

save([pathName,'\',tmp{1},'_time.mat'],'time')
%% look through the files
k=0;
K=numReactor*numChan;
tstart=datetime('now');
f=waitbar(k/K,[sprintf('%d of %d stacks have been created',k,K),sprintf('\nStart time: %s',string(tstart))]);
tic;
for r = 1:numReactor
    for c = 1:numChan
        k=k+1;
        for t = 1:T
             image = imread([files(t).folder,'\',files(t).name],k);
             
             if t==1
                imwrite(image,[pathName,sprintf('\\SinglePosSingleChan\\Pos_%d_Chan_%d.tif',r,c)])
             else
                imwrite(image,[pathName,sprintf('\\SinglePosSingleChan\\Pos_%d_Chan_%d.tif',r,c)],'WriteMode','append')
             end
        end
        dt=toc/k*K/3600/24;
        tfinish=datetime(tstart+dt);
        waitbar(k/K,f,[sprintf('%d of %d stacks have been created',k,K),sprintf('\nStart time: %s',string(tstart)),...
            sprintf('\nFinishing time: %s',string(tfinish))]);
        
    end        
end
