function [route] = astar3(exbigraph,exbiloc,startnode,endnode,ts)
%% Written by Muhammet Balcilar, France
% all rights reverved

graph=exbigraph;
Loc=exbiloc;
n=size(graph,1);


curr=startnode;

Cost=[curr 0];
Hcost= sum(sum(abs(Loc(curr,:)-Loc(endnode,:))));

Route{1}=[curr];

Tabu=[curr];
cRoute=[curr];
cr=1;

i=1;
% if the endnode is found or all possibility is finished
while Hcost(cr)>0 %      sum(curr~=endnode)>0    
    i=i+1;
    iter=i
        
    % find all possibility from current node
    %PosMove2=findpossmove(graph,curr,ts);
    PosMove=findpossmoveRec(graph,curr,ts);
    
    % find all possibility's cost from current to concerned node
    for j=1:size(PosMove,1)
        % manhattan distance for current and possible locs
        cost(j,1)=sum(sum( abs(Loc(curr,:)-Loc(PosMove(j,:),:))))+findindex(Cost,curr);
        % add time cost every step cost is just 1 move
        cost(j,1)=cost(j,1)+1;
        [val ind]=findindex(Cost,PosMove(j,:));
        if cost(j,1)<val 
            Cost(ind,:)=[PosMove(j,:) cost(j,1)];            
            Route{ind}=[cRoute; PosMove(j,:)];
            Hcost(ind,1)=sum(sum(abs(Loc(PosMove(j,:),:)-Loc(endnode,:))));
        end
        
    end
        
    % find minimum of normal cost plus heuristic cost of possible node
    tmp=Cost;
    tmp(:,end)=tmp(:,end)+Hcost;        
    [mn cr]=finminexceptTabu(tmp,Tabu);
    
    if isinf(mn)
        break
    end
    % set minimum total cost's node as current node
    curr=Cost(cr,1:end-1);    
    cRoute=Route{cr};
    % add current node to tabu list to prevent loops
    Tabu=[Tabu; curr];
end
% if current node is equal endnode means route is found
if Hcost(cr)==0
    route=cRoute;
else % i not means there is no way
    route=[];
end

