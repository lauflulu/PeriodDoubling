function [finalRefreshRatio, averageRefreshRatiosPerReactor] = plotIntensityCurves(intensities, folder, ENABLE_BLANK_SUBTRACTION)
%% This function will plot the intensity curve of the fluorescence 
%  intensity within the reaction chambers over time as well as determine
%  the final refresh ratios and plot these as well. 

%% Variables
numOfChambers = size(intensities,1);
timePoints = size(intensities,2)-1;
refreshRatios = zeros(numOfChambers,timePoints-1);
legendNames = cell(size(numOfChambers));
for i = 1:numOfChambers
legendNames{i} = ['Channel ' num2str(i)];
end

%% Determine Corrected Intensities
% The first image recorded is taken before the channels are flushed with
% EGFP, thus providing a measure of the background. This background is
% removed from each of the other images. 
if ENABLE_BLANK_SUBTRACTION
    correctedIntensities = intensities(:,2:end) - intensities(:,1);
    correctedIntensities = correctedIntensities - correctedIntensities(:,end);
else
    correctedIntensities = intensities(:,1:end) - intensities(:, end);
end

%% Determine Refresh Ratios
% The refresh ratio, or the percentage of the reactor ring which is
% refreshed per dilution sequence is expressed as the fraction of the
% volume of the reactor ring which is being refreshed. This is found by
% determining the change in intensity during the dilution. 
for i = 2:timePoints
    refreshRatios(:,i-1) = 1 - (correctedIntensities(:,i)./correctedIntensities(:,i-1));
end

averageRefreshRatiosPerReactor = mean(refreshRatios(:,:),2);

%% Display Results
% Plot the Corrected Intensities
figure(1)
plot(correctedIntensities')
title('Intensities per Reactor');
legend(legendNames);
xlabel('Dilution Steps'); ylabel('Intensity [A.U.]');
savefig(gcf,fullfile(folder, 'Intensities.fig'));

% Plot the final refresh ratios
figure(2)
plot(refreshRatios')
title('Refresh Ratios per Reactor');
legend(legendNames);
ylim([0 1]);
xlabel('Dilution Steps'); ylabel('Refresh Ratio')
savefig(gcf, fullfile(folder, 'RefreshRatios.fig'));

%% Determine Average Refresh Ratios
% This is the average refresh ration of each individual reactor which has 
% been selected. This array is only used to then determine the average
% refresh ratio across all selected reactors. 
averageRefreshRatiosPerReactor2 = mean(refreshRatios);

% This is the average refresh ratio across all reactors which have been
% selected. This can be used as an estimate when loading all reactors at
% the same time.
finalRefreshRatio = mean(averageRefreshRatiosPerReactor2);


%% Print Results
correctedIntensities
refreshRatios
