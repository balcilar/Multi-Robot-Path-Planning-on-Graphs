function [G Loc Edge]=GridGraph(ngrid)
%% Written by Muhammet Balcilar, France
% all rights reverved

% cretae 2nx2n zero graph as initial
G=zeros(2*ngrid,2*ngrid);
Edge=[];
nnode=1;
for n=1:ngrid*ngrid
    % calculate position of nth node in grid
    j=ceil(n/ngrid);
    i=n-(j-1)*ngrid;
    Loc(n,:)=[j i];
    if i-1>=1
        G(n,n-1)=1;        
        G(n-1,n)=1;
        Edge=[Edge;n n-1;n-1 n];
    end
    if i+1<=ngrid
        G(n,n+1)=1;
        G(n+1,n)=1;
        Edge=[Edge;n n+1;n+1 n];
    end
    if j-1>=1
        G(n,n-ngrid)=1;        
        G(n-ngrid,n)=1;
        Edge=[Edge;n n-ngrid;n-ngrid n];
    end
    if j+1<=ngrid
        G(n,n+ngrid)=1;
        G(n+ngrid,n)=1;
        Edge=[Edge;n n+ngrid;n+ngrid n];
    end
end
    
    
