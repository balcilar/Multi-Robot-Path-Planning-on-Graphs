function [value ind]=findindex(Cost,curr)
%% Written by Muhammet Balcilar, France
% all rights reverved
value=inf;
ind=size(Cost,1)+1;
I=sum( abs(Cost(:,1:end-1)-curr)');
i=find(I==0);
if length(i)>0
    value=Cost(i(1),end);
    ind=i(1);
end
