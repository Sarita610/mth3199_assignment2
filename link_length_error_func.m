%Error function that encodes the link length constraints
%INPUTS:
%vertex_coords: a column vector containing the (x,y) coordinates of every vertex
%               in the linkage: [x1;y1;x2;y2;...;xn;yn]
%leg_params: a struct containing the parameters that describe the linkage
%            importantly, leg_params.link_lengths is a list of linkage lengths
%            and leg_params.link_to_vertex_list is a two column matrix where
%            leg_params.link_to_vertex_list(i,1) and
%            leg_params.link_to_vertex_list(i,2) are the pair of vertices connected
%            by the ith link in the mechanism
%OUTPUTS:
%length_errors: a column vector describing the current distance error of the ith
%               link, specifically length_errors(i) = (xb-xa)^2 + (yb-ya)^2 - d_i^2
%               where (xa,ya) and (xb,yb) are the coordinates of the vertices that
%               are connected by the ith link, and d_i is the length of the ith link
function length_errors = link_length_error_func(vertex_coords, leg_params)

    matrix = column_to_matrix(vertex_coords);
    length_errors = zeros(leg_params.num_linkages, 1);

    for i = 1:leg_params.num_linkages

        vertex_a = leg_params.link_to_vertex_list(i, 1);
        vertex_b = leg_params.link_to_vertex_list(i, 2);
        xa = matrix(vertex_a, 1);
        ya = matrix(vertex_a, 2);
        xb = matrix(vertex_b, 1);
        yb = matrix(vertex_b, 2);

        d_i = leg_params.link_lengths(i);

        length_errors(i) = (xb - xa)^2 + (yb - ya)^2 - d_i^2;

    end

end