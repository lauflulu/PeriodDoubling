SIZE = 256;
COLOR = {'Hot','Grey'}
pal = zeros(SIZE,3);

color = COLOR{1};

switch color
    case 'Hot'
        Spacing = linspace(0,255,86)';
        pal(1:86,1) = Spacing;
        pal(86:256,1) = 255;
        pal(86:171,2) = Spacing;
        pal(171:256,2) = 255;
        pal(171:256,3) = Spacing;
    case 'Grey'
        Spacing = linspace(0,255,256)';
        pal = [Spacing,Spacing,Spacing];
    otherwise
end


fp = fopen([color '.pal'],'w');
fprintf(fp, '%d %d %d\n',pal');
fclose(fp);

