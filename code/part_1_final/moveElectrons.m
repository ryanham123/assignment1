function [electons]=moveElectrons(electons,boxes)
    clear test_y
    
    global tstep
   

    
    xshift=electons(:,3)*tstep/2;
    yshift=electons(:,4)*tstep/2;
    
    electons(:,1)=mod(electons(:,1)+xshift,200e-9);
    electons(:,2)=electons(:,2)+yshift;
    
    test_y_top_bot=((electons(:,2)+yshift)> 100e-9)|(electons(:,2)+yshift< 0);
    
   

    
    electons(:,4)= electons(:,4)-2.*electons(:,4).*test_y_top_bot;
    
    xshift=electons(:,3)*tstep/2;
    yshift=electons(:,4)*tstep/2;
    
    electons(:,1)=mod(electons(:,1)+xshift,200e-9);
    electons(:,2)=electons(:,2)+yshift;
    

end