 for i = 1:8 
     for j = 1:11 
         image(dilSorted(:,:,j,i));
         title(['Reactor: ' num2str(j) ' Frame: ' num2str(i)]);
         pause(1); 
     end
 end