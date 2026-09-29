%Computes the theta derivatives of each vertex coordinate for the Jansen linkage
%INPUTS:
%vertex_coords: a column vector containing the (x,y) coordinates of every vertex
%               these are assumed to be legal values that are roots of the error funcs!
%leg_params: a struct containing the parameters that describe the linkage
%theta: the current angle of the crank
%OUTPUTS:
%dVdtheta: a column vector containing the theta derivatives of each vertex coord
function dVdtheta = compute_velocities(vertex_coords, leg_params, theta)

    num_v = 2*leg_params.num_vertices;
    J = approximate_jacobian(@(V) link_length_error_func(V, leg_params), vertex_coords);

    dxdtheta = -leg_params.crank_length * sin(theta);
    dydtheta =  leg_params.crank_length * cos(theta);
    M = [eye(4), zeros(4, num_v-4)];

    M = [M; J];
    B = [dxdtheta; dydtheta; 0; 0;  zeros(leg_params.num_linkages, 1)];

    dVdtheta = M\B;

end