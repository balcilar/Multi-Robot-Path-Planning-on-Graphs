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

During a discrete time step, each robot may either remain stationary or move to an adjacent vertex. To formally describe a plan, let a scheduled path be a map *pi : Z+ → V* , in which *Z+ := N ∪ {0}*. A scheduled path pi is feasible if it satisfies the following properties: 

* 1) pi(0) = xI (ri). 

* 2) For each i, there exists a smallest ti ∈ Z+ such that pi(ti) = xG(ri). 

* 3) For any t ≥ ti, pi(t) ≡ xG(ri). 

* 4) For any 0 ≤ t < ti , (pi(t), pi(t + 1)) ∈ E or pi(t) = pi(t + 1) (if pi(t) = pi(t + 1)

robot ri stays at vertex pi(t) between the time steps t and t + 1). We say that two paths pi, pj are in collision if there exists k ∈ Z+ such that pi(t) = pj (t) (meet collision) or (pi(t), pi(t + 1)) = (pj (t + 1), pj (t)) (head-on collision). 

## Solution




![Alt Text](Output/result.gif)



## Reference
[1] Yu, Jingjin, and Steven M. LaValle. "Optimal multirobot path planning on graphs: Complete algorithms and effective heuristics." IEEE Transactions on Robotics 32.5 (2016): 1163-1177.
