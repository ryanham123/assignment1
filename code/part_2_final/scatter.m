function [electrons] = scatter(electrons)

global tstep

global thermalVelo

random=rand(length(electrons(:,1)),1);
random2=randn(length(electrons(:,1)),1);
random3=randn(length(electrons(:,1)),1);

p_scatter=1-exp(-tstep/(0.2e-12));

did_scatter=p_scatter>random;

electrons(:,3)=round(abs(1-did_scatter)).*electrons(:,3)+thermalVelo*random2.*did_scatter;
electrons(:,4)=round(abs(1-did_scatter)).*electrons(:,4)+thermalVelo*random3.*did_scatter;


     
electrons(:,5)=electrons(:,5)+(electrons(:,3).^2+electrons(:,4).^2).^(0.5)*tstep;
electrons(:,6)=electrons(:,6)+did_scatter;






end

