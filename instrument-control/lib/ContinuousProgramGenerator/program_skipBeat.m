clear all
close all
%% initialize

numIter=100; % number of iterations
numRings=8; % number of reactors
numReagents=3; % number of reagents

feedRatio=zeros(numIter,numRings,numReagents); % feed ratio for each step and reactor and reagent
input=zeros(numIter,numRings,numReagents); % input kinetics

RR=25; % total refresh ratio for each step

reagentPorts=[1,3,7]; % ports with reagents
waterPort=9;
reagentLogic=[0,-1,1]; % 0: no input, 1: periodic input, -1: anti-input to fill volume

ringInPeriod=[0,16,16,16,16,16,16,0];
skip={[Inf],...
    [Inf],...
    [1],...
    [1,2,3],...
    [3],...
    [3,4],...
    [3,4,5],...
    [Inf]};
%% generate feed matrix
for i=1:numIter
    for r=1:numRings
        for s=1:numReagents
            if reagentLogic(s)==1 && ((~mod(i,ringInPeriod(r))) && ~ismember(floor(i/ringInPeriod(r)),skip{1,r}))
                feedRatio(i,r,s)=RR/2;
            elseif reagentLogic(s)==-1 && ~((~mod(i,ringInPeriod(r))) && ~ismember(floor(i/ringInPeriod(r)),skip{1,r}))
                feedRatio(i,r,s)=RR/2;
            elseif reagentLogic(s)==0
                feedRatio(i,r,s)=RR/2;
            end
        end
    end
end

%% forward compute input kinetics
updateRule=@(RR,n,feed) (100-RR)/100*n + feed/100;
for i=2:numIter
    for r=1:numRings
        for s=1:numReagents
            input(i,r,s)=updateRule(RR,input(i-1,r,s),feedRatio(i,r,s));
        end
    end
end

%% plot feed matrix
colormap('gray')
figure(1)
for s=1:numReagents
    subplot(2,numReagents,s)
    imagesc(squeeze(feedRatio(:,:,s)))
    title(sprintf('Reagent %d',s))
    xticks(1:numRings)
    xlabel('Ring Number')
    ylabel('Iteration')
    hcb=colorbar;
    ylabel(hcb,'Feed Ratio (%)','Rotation',270)
end


for s=1:numReagents
    subplot(2,numReagents,s+numReagents)
    imagesc(squeeze(input(:,:,s))*100)
    title(sprintf('Reagent %d',s))
    xticks(1:numRings)
    xlabel('Ring Number')
    ylabel('Iteration')
    hcb=colorbar;
    ylabel(hcb,'Input (%)','Rotation',270)
end


%% feed matrix into xml
iterationStart=@(xml,id,iterations) [xml,...
    sprintf('<IterationStart>\n<ID>%d</ID>\n<Iterations>%d</Iterations>\n</IterationStart>\n',id,iterations)];
iterationEnd=@(xml,id) [xml,sprintf('<IterationEnd>%d</IterationEnd>\n',id)];
feed=@(xml,ratio,ring) [xml,...
    sprintf('<Feed>\n<Ratio>%.1f</Ratio>\n<Ring>%d</Ring>\n</Feed>\n',ratio,ring)];
flushFeed=@(xml,port,cycles) [xml,...
    sprintf('<FlushFeed>\n<ReagentNr>%d</ReagentNr>\n<Cycles>%d</Cycles>\n</FlushFeed>\n',port,cycles)];
changeReagent=@(xml,duration,reagentNr) [xml,...
    sprintf('<ChangeReagent>\n<Duration>'),duration,sprintf('</Duration>\n<ReagentNr>%d</ReagentNr>\n</ChangeReagent>\n',reagentNr)];
mix=@(xml,duration) [xml,'<Mix>',duration,sprintf('</Mix>\n')];
acquire=@(xml) [xml,sprintf('<Acquire/>\n')];
incubate=@(xml,duration) [xml,'<Incubate>',duration,sprintf('</Incubate>\n')];

xml=[];

for i=1:numIter
    xml=iterationStart(xml,i,1);
    %reagents
    for s=1:numReagents
        if sum(feedRatio(i,:,s))
            xml=flushFeed(xml,reagentPorts(s),100);
            %rings
            for r=1:numRings
                if feedRatio(i,r,s)
                    xml=feed(xml,feedRatio(i,r,s),r);
                end
            end
        end
    end
    %mix and acquire
    xml=incubate(xml,'00:00:01');
    xml=changeReagent(xml,'00:00:30',waterPort);
    xml=mix(xml,'00:05:00');
    xml=incubate(xml,'00:00:01');
    xml=acquire(xml);
    xml=incubate(xml,'00:00:01');
    xml=iterationEnd(xml,i);
end

fid = fopen('210611_continuous.xml','wt');
fprintf(fid, xml);
fclose(fid);
'finished'

