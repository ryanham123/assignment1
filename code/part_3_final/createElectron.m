
function [elec]=createElectron(boxes,boxes2,thermalVelo)
    global setting

    electronfound=false;
    
    while (electronfound==false)
        
        electronfound=true;
        
       if(setting==1|setting==2)
        elec(1,1)=rand()*200*10^-9;
        elec(1,2)=rand()*100*10^-9;
        elec(1,3)=thermalVelo*randn();
        elec(1,4)=thermalVelo*randn();
        
       else
        
        elec(1,1)=rand()*200*10^-9;
        elec(1,2)=rand()*100*10^-9;
        elec(1,3)=thermalVelo*randn();
        elec(1,4)=thermalVelo*randn();
        
       end


        for g=1:length(boxes(:,1))
        test_barr_in_top=abs(elec(:,2)-boxes(g,2)) < boxes(g,3)/2 & abs((elec(:,1))-boxes(g,1)) < boxes(g,4)/2;
            
            if(test_barr_in_top==1)
                
                electronfound=false;
                
            end
        end
        
        for g=1:length(boxes2(:,1))
        test_barr_in_top=abs(elec(:,2)-boxes2(g,2)) < boxes2(g,3)/2 & abs((elec(:,1))-boxes2(g,1)) < boxes2(g,4)/2;
            
            if(test_barr_in_top==1)
                
                electronfound=false;
                
            end
        end
          
    end
    
%     elec(1,1)=0;
%     elec(1,2)=95;
%     elec(1,3)=0.1;
%     elec(1,4)=0.001;

end