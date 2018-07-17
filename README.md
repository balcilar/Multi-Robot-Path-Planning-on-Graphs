# Multi-Robot Path Planning on Graphs

We study the problem of optimal multi-robot path planning on graphs (MPP) over the makespan (last arrival time) criteria. We implemented A* search algorithm to find solution. In an MPP instance, the robots are uniquely labeled (i.e., distinguishable) and
are confined to an nxn squared connected graph. The robots may move from a vertex to an adjacent one in one time step in the
absence of collision, which may occur when two robots simultaneously move to the same vertex or along the same edge in
different directions. A distinguishing feature of our MPP formulation is that we allow robots on fully occupied cycles to rotate
synchronously.

Let *G = (V, E)* be a connected, undirected, simple graph, with *V = {vi}* being the vertex set and *E = {(vi, vj )}* the edge
set. Let *R = {r1, . . . , rn}* be a set of *n* robots. The robots move at discrete time steps (i.e., at *t = 0, 1, . . .*). At time step t = 0, each robot occupies a distinct vertex of *G*. In general, at any time step *t = 0, 1, . . .*, the robots assume a configuration that is an injective map from *R* to *V* . The start (initial) and goal configurations of the robots are denoted as *xI* and *xG*, respectively.
Following figure shows a possible configuration and its possible goal configuration of 9 robots on a 3 × 3 grid graph. 

![Alt Text](Output/startendpositions.jpg)



![Alt Text](Output/result.gif)



## Reference
[1] Yu, Jingjin, and Steven M. LaValle. "Optimal multirobot path planning on graphs: Complete algorithms and effective heuristics." IEEE Transactions on Robotics 32.5 (2016): 1163-1177.
