function PosMove=findpossmoveRec(graph,curr,ts)
%% Written by Muhammet Balcilar, France
% all rights reverved
cf=size(graph,1)/ts;
PosMove=[];
I1=find(graph(curr(1),:)==1);
for i1=1:length(I1)
    nx1=I1(i1);
    g1=graph;
    g1(:,nx1)=0;
    g1(nx1-cf,curr(1)+cf)=0;
    if length(curr)==1
        PosMove=[PosMove;nx1];
    else
        pm=findpossmoveRec(g1,curr(2:end),ts);
        if ~isempty(pm)
            PosMove=[PosMove;nx1*ones(size(pm,1),1) pm];
        end
    end
    
end