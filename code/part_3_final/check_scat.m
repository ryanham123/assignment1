function [vector] = check_scat(electrons,boxes,boxes2)
    allboxes(1:length(boxes(:,1)),:)=boxes;
    allboxes(1+length(boxes(:,1)):length(boxes(:,1))+length(boxes2(:,1)),:)=boxes2;
    extra=2e-9;
    vector=zeros(length(electrons(:,1)),1);

    for g=1:length(allboxes(:,1))

    test_barr_in_top=abs(electrons(:,2)-allboxes(g,2)) < (allboxes(g,3)/2+extra) & abs((electrons(:,1))-allboxes(g,1)) < (allboxes(g,4)/2+extra);
    
    vector=vector+test_barr_in_top;
    
    end

end

