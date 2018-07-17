function [mn cr]=finminexceptTabu(tmp,Tabu)
%% Written by Muhammet Balcilar, France
% all rights reverved
nodes=tmp(:,1:end-1);
cost=tmp(:,end);
for i=1:size(Tabu,1)
    tt=sum(abs(nodes-Tabu(i,:)),2);
    I=find(tt==0);
    if length(I)>0
        cost(I(1))=inf;
    end
end
[mn cr]=min(cost);