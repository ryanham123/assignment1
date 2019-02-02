function [electrons] = checkboxes2(electrons,boxes)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    global tstep
    global thermalVelo

    yminvar=0.5e-9;
    
    xshift=electrons(:,3)*tstep;
    yshift=electrons(:,4)*tstep;
    random2=randn(length(electrons(:,1)),1);
    random3=randn(length(electrons(:,1)),1);
    
    
    for g=1:length(boxes(:,1))
        
        xmin=boxes(g,1)-boxes(g,4)/2;
        xmax=boxes(g,1)+boxes(g,4)/2;
        ymin=boxes(g,2)-boxes(g,3)/2;
        ymax=boxes(g,2)+boxes(g,3)/2;
        
        
        cornera=abs(electrons(:,2)+yshift-ymax)<yminvar&abs(electrons(:,2)+xshift-xmax)<yminvar;
        cornerb=abs(electrons(:,2)+yshift-ymax)<yminvar&abs(electrons(:,2)+xshift-xmin)<yminvar;
        cornerc=abs(electrons(:,2)+yshift-ymin)<yminvar&abs(electrons(:,2)+xshift-xmax)<yminvar;
        cornerd=abs(electrons(:,2)+yshift-ymin)<yminvar&abs(electrons(:,2)+xshift-xmin)<yminvar;
        test_barr_in_top=abs(electrons(:,2)+yshift-boxes(g,2)) < boxes(g,3)/2 & abs((electrons(:,1)+xshift)-boxes(g,1)) < boxes(g,4)/2;

        
        corner=cornera|cornerb|cornerc|cornerd;
          
        test_barr_in_top=abs(electrons(:,2)+yshift-boxes(g,2)) < boxes(g,3)/2 & abs((electrons(:,1)+xshift)-boxes(g,1)) < boxes(g,4)/2;

        test_barr_x_top_right=(abs((electrons(:,1)+xshift)-(boxes(g,1)-boxes(g,4)/2))<yminvar);
        test_barr_x_top_left=(abs((electrons(:,1)+xshift)-(boxes(g,1)+boxes(g,4)/2))<yminvar);

        test_barr_x_side=test_barr_x_top_right|test_barr_x_top_left;
        
        
        

        %electrons(:,4)=electrons(:,4)-2.*electrons(:,4).*test_barr_in_top.*(~test_barr_x_side|corner);
        

        %electrons(:,3)=electrons(:,3)-2.*electrons(:,3).*test_barr_in_top.*(test_barr_x_side|corner);
         
        electrons(:,3)=round(abs(1-test_barr_in_top)).*electrons(:,3)+abs(thermalVelo.*random2.*test_barr_in_top.*(test_barr_x_side)).*sign(-2.*electrons(:,3))+thermalVelo.*random2.*test_barr_in_top.*(~test_barr_x_side);
        electrons(:,4)=round(abs(1-test_barr_in_top)).*electrons(:,4)+abs(thermalVelo.*random3.*test_barr_in_top.*(~test_barr_x_side)).*sign(-2.*electrons(:,4))+thermalVelo.*random3.*test_barr_in_top.*(test_barr_x_side);
        
        
        electrons(:,3)=electrons(:,3)-2.*electrons(:,3).*test_barr_in_top.*(corner);
        electrons(:,4)=electrons(:,4)-2.*electrons(:,4).*test_barr_in_top.*(corner);
        
        %electrons(:,4)=round(abs(1-test_barr_in_top)).*electrons(:,4)+thermalVelo*random3.*test_barr_in_top;
     
    

    end



end

