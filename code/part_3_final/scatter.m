function [electrons] = scatter(electrons,boxes,boxes2)

global tstep

global thermalVelo

random=rand(length(electrons(:,1)),1);
random2=randn(length(electrons(:,1)),1);
random3=randn(length(electrons(:,1)),1);

close=check_scat(electrons,boxes,boxes2);

p_scatter=1-exp(-tstep/(0.2e-12));

did_scatter=p_scatter>random&~close;

electrons(:,3)=round(abs(1-did_scatter)).*electrons(:,3)+thermalVelo*random2.*did_scatter;
electrons(:,4)=round(abs(1-did_scatter)).*electrons(:,4)+thermalVelo*random3.*did_scatter;



end

