function calibReg=registerCalibration(I_cal,I_exp)
%%
% EDGE_cal=edge(I_cal);
% EDGE_exp=edge(I_exp);

fixed=I_exp;%imgaussfilt(im2single(EDGE_exp),5);
moving=I_cal;%imgaussfilt(im2single(EDGE_cal),5);

fixed8=(fixed-min(fixed,[],'all'))*(2^16/(max(fixed,[],'all')-min(fixed,[],'all')));
moving8=(moving-min(moving,[],'all'))*(2^16/(max(moving,[],'all')-min(moving,[],'all')));

%%
[optimizer, metric] = imregconfig('multimodal');

[selectedMovingPoints,selectedFixedPoints]=cpselect(moving8,fixed8,'Wait',true);
translation= mean(selectedFixedPoints-selectedMovingPoints,1);
moving= imtranslate(moving,translation,'FillValues',0);

calibReg = imregister(moving, fixed, 'translation', optimizer, metric);

figure()
    subplot(1,2,1)
        imshowpair(fixed,moving,'falsecolor')
    subplot(1,2,2)
        imshowpair(fixed,calibReg,'falsecolor')
        
end