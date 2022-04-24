 for i = 1:8 
     for j = 1:11 
         image(dilSorted(:,:,j,i));
         title(['Reactor: ' num2str(i) ' Frame: ' num2str(j)]);
         pause(1); 
     end
 end