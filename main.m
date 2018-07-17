%% Written by Muhammet Balcilar, France
% all rights reverved

clear all
clc
close all


% this demo is based on nxn grid graph as the paper shows
% robots are on the grid and they can move just 4 basic direction.
% this demo runs just for any number of robot.

ngrid=3;
nrobot=9;

% create bidirectional grid as the same example in the paper in fig1
[Graph Loc Edge]=GridGraph(ngrid);

% plot the created grid-graph
figure; plot(Loc(:,1),Loc(:,2),'bo');
axis([0 ngrid+1 0 ngrid+1]);
hold on;
for i=1:2:size(Edge,1)
    x1=Loc(Edge(i,1),1);
    x2=Loc(Edge(i,2),1);
    y1=Loc(Edge(i,1),2);
    y2=Loc(Edge(i,2),2);
    line([x1;x2],[y1;y2]);
end

% set the maximum time step
ts=7;

% r1 is 3nd cell, r2 is 5th cell and r3 is 6th cell ,..., r9 is in 1st cell 

sp=[3 5 6 2 9 7 8 4 1];

% r1 1st cell, r2 2nd cell and r3 3th cell, r9 is 9th cell as end positions

ep=[1 2 3 4 5 6 7 8 9] + ngrid*ngrid*(ts-1);

% create time based graph which has ts times more node in figure 5 in paper
[tG,tedge,tloc]= createtimegraph(Graph,Edge,Loc,ts);

% solve the problem with a*, it is not the same with paper since they used
% ILP solver.
[route] = astar3(tG,tloc,sp,ep,ts);

% show the reults on the screen

i=1;
frm=0;
h=figure; hold on;
for j=1:nrobot    
    pl(j,:)=[tloc(route(i,j),2) ngrid+1-tloc(route(i,j),1)];
end
axis([0 ngrid+1 0 ngrid+1]);
axis off;
set(gcf,'color','w');
for i=1:2:size(Edge,1)
    x1=Loc(Edge(i,1),1);
    x2=Loc(Edge(i,2),1);
    y1=Loc(Edge(i,1),2);
    y2=Loc(Edge(i,2),2);
    line([x1;x2],[y1;y2]);
end
hold off;

for i=2:size(route,1)
    for j=1:nrobot
        cl(j,:)=[tloc(route(i,j),2) ngrid+1-tloc(route(i,j),1)];
    end
    
    for iter=1:30
        clf
        for i=1:2:size(Edge,1)
            x1=Loc(Edge(i,1),1);
            x2=Loc(Edge(i,2),1);
            y1=Loc(Edge(i,1),2);
            y2=Loc(Edge(i,2),2);
            line([x1;x2],[y1;y2]);
        end
        axis([0 ngrid+1 0 ngrid+1]);
        axis off;
        hold on;
        for j=1:nrobot            
            text( pl(j,1)+iter*(cl(j,1)-pl(j,1))/30,pl(j,2)+iter*(cl(j,2)-pl(j,2))/30, num2str(j),'FontSize',20);
        end
        pause(0.1);
        hold off;
        
        if frm == 0   
            frame = getframe(h);
            im = frame2im(frame);
            [imind,cm] = rgb2ind(im,256);
%             imwrite(imind,cm,'Output/result.gif','gif', 'Loopcount',inf);
            frm=frm+1;
        end
        
        if mod(iter,3)==0
            frm=frm+1;
            frame = getframe(h);
            im = frame2im(frame);
            [imind,cm] = rgb2ind(im,256);
            %Write to the GIF File
%             imwrite(imind,cm,'Output/result.gif','gif','WriteMode','append');            
        end       
        
    end
    
    pl=cl;
end