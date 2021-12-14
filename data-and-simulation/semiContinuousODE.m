function [t,y]=semiContinuousODE(odefun,tspan,y0,RR,yIN,output)
    t=0;

    y=y0';
    for i=1:(length(tspan)-1)
        [T,Y]=ode23s(odefun,linspace(tspan(i),tspan(i+1),10),y0);
        y0=Y(end,:)*(1-RR)+yIN(i,:);   
        if strcmp(output,'up')
            y=[y;Y(end,:)];
            t=[t;T(end,:)];
        elseif strcmp(output,'low')
            y=[y;y0];
            t=[t;tspan(i+1)];
        else    
            y=[y;Y];
            t=[t;T];
        end
    end
    
    
end