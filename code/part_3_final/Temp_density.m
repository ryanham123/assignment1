function Temp_density(electrons)

    mass=0.26*9.1093*10^(-31);
    kbolts=1.380*10^(-23);
    
    xl=200e-9;
    yl=100e-9;
    div=2e-9;
    
  
    
    xmax=ceil(xl/div)+2;
    ymax=ceil(yl/div)+2;
    


    density_map=zeros(ymax,xmax,2);

    for k=1:length(electrons(:,1))
        
        my=ceil((electrons(k,2))/div)+1;
        mx=ceil((electrons(k,1))/div)+1;
        
        
        density_map(my,mx,1)=density_map(my,mx,1)+(electrons(k,3).^2 +electrons(k,3).^2);
        density_map(my,mx,2)=density_map(my,mx,2)+1;


    end
        
     for j=1:ymax
         
         for d=1:xmax
             
             if(density_map(j,d,2)<=0)
        
                density_map(j,d,2)=1;
        
             end
        
        
         end
         
     end
     
   tempature(:,:)=density_map(:,:,1)./density_map(:,:,2)*mass/kbolts/2;
   hold off
   figure(9)
   %surf(totaltemp(2:end-2,2:end-2)/t,'edgecolor','none')
   surf(tempature(2:end-2,2:end-2),'edgecolor','none')
   caxis([1 600])
   colorbar
   xlabel('x Position (m)')
   ylabel('y Position (m)')
   title('Temperature map (K)')
   view(0,90)
       
       
    

end

