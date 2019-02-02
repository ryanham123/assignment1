clear all
clc

global thermalVelo

global tstep
global setting


%setting=1;% 2 hist
%setting=2;% 1  particle trajectories
%setting=3;% tempature
setting=4;%temp and hist, mean free path , tau



watchplot=false;
pausetime=0.001;
currentposplot=false;
mass=0.26*9.1093*10^(-31);
kbolts=1.380*10^(-23);
T=300;

thermalVelo=(kbolts*T/mass)^(0.5);
tstep=1e-9/thermalVelo/5;

if(setting==1|setting==3|setting==4)

boxes(1,1)=0;%x
boxes(1,2)=0;%y
boxes(1,3)=0;%hight
boxes(1,4)=0;%width


end

if(setting==2)

boxes(1,1)=0;%x
boxes(1,2)=0;%y
boxes(1,3)=0;%hight
boxes(1,4)=0;%width

watchplot=true;
figure(1)
hold on

end


% boxes(1,1)=100e-9;%x
% boxes(1,2)=50e-9;%y
% boxes(1,3)=40e-9;%hight
% boxes(1,4)=40e-9;%width
% 
% boxes(2,1)=30e-9;%x
% boxes(2,2)=30e-9;%y
% boxes(2,3)=20e-9;%hight
% boxes(2,4)=20e-9;%width


numelec=20000;

xwatch=1:15;

plotnum=length(xwatch);

color_map=hsv(plotnum);

if(watchplot)
    
    for h=1:length(boxes(:,2))       
        plot([boxes(h,1)-boxes(h,4)/2 boxes(h,1)-boxes(h,4)/2 boxes(h,1)+boxes(h,4)/2 boxes(h,1)+boxes(h,4)/2 boxes(h,1)-boxes(h,4)/2 ],[boxes(h,2)+boxes(h,3)/2 boxes(h,2)-boxes(h,3)/2 boxes(h,2)-boxes(h,3)/2 boxes(h,2)+boxes(h,3)/2 boxes(h,2)+boxes(h,3)/2],'k')
   
   end
    
end




watchstep=8;

%create the electrons 
for i=1:numelec

    
electrons(i,:)=createElectron(boxes,thermalVelo);


end

for k=1:length(xwatch)
    paths(1,k*2-1)=electrons(xwatch(k),1);
    paths(1,k*2)= electrons(xwatch(k),2);
end

maxt=5000;

%enter time loop
for t=1:maxt
    
    electrons=moveElectrons(electrons,boxes);
    
    electrons=scatter(electrons);
    
    if(setting==3|setting==4)
        
       vxsqavg=sum(electrons(:,3).^2)/numelec;
       vysqavg=sum(electrons(:,4).^2)/numelec;

       vtsqavg=vysqavg+vxsqavg;
       
       tempature(t)=vtsqavg*mass/kbolts/2;
       
       if(t==maxt)
       
       hold off
       figure(5)
       plot(tempature)
       xlabel('Time (s)')
       ylabel('Tempature (K)')
       title(' Temperature plot ')
       
       
       end
       
       
       pause(0.001)
        
    end
    
    
    if(setting==1|setting==4)%plot tempature
        
       vxsqavg=electrons(:,3).^2;
       vysqavg=electrons(:,4).^2;

       vtsqavg=(vysqavg+vxsqavg).^(1/2);
       
       if(t==maxt)
       
       figure(3)
       hist(vtsqavg,300)
       xlabel('Speed (m/s)')
       ylabel('Bin Count')
       title('Speed Histogram')
       hold off
       
       end

       
       pause(0.001)
        
    end
    
   
   if(watchplot)%particle trajectories
        
        if (mod(t,watchstep)==0)
            
            for k=1:length(xwatch)


                paths(2,k*2-1)=paths(1,k*2-1);
                paths(2,k*2)= paths(1,k*2);

                paths(1,k*2-1)=electrons(xwatch(k),1);
                paths(1,k*2)=electrons(xwatch(k),2);



            end
        
            for k=1:length(xwatch)
                
              if (abs(paths(1,k*2-1) -paths(2,k*2-1) )<20e-9)
                 
%                 figure(5)
%                 hold on
                plot(paths(:,k*2-1),paths(:,k*2),'-','Color',color_map(k,:))
                xlim([0 200e-9])
                ylim([0 100e-9])
               
%                 hold off

              end
              

            end
            
            
            
            pause(0.01)
        end
        
   end
    

  
end

          
if(setting==4)

fprintf('The measured mean time between collision is %7.4s s \n',(tstep*numelec*t)./sum(electrons(:,6)));
fprintf('The measured Mean Free Path is %7.4s m \n',sum(electrons(:,5))/sum(electrons(:,6)));


end
