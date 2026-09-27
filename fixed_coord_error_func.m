%Error function that encodes the fixed vertex constraints
%INPUTS:
%vertex_coords: a column vector containing the (x,y) coordinates of every vertex
%               same input as link_length_error_func: [x1;y1;x2;y2;...;xn;yn]
%leg_params: a struct containing the parameters that describe the linkage
%            importantly, leg_params.crank_length is the length of the crank
%            and leg_params.vertex_pos0 and leg_params.vertex_pos2 are the
%            fixed positions of the crank rotation center and vertex 2.
%theta: the current angle of the crank
%OUTPUTS:
%coord_errors: a column vector of height four corresponding to the differences
%              between the current values of (x1,y1),(x2,y2) and
%              the fixed values that they should be
function coord_errors = fixed_coord_error_func(vertex_coords, leg_params, theta)

    matrix = column_to_matrix(vertex_coords);
    x1 = matrix(1, 1);
    y1 = matrix(1, 2);
    x2 = matrix(2, 1);
    y2 = matrix(2, 2);

    x1_ = leg_params.vertex_pos0(1) + leg_params.crank_length*cos(theta);
    y1_ = leg_params.vertex_pos0(2) + leg_params.crank_length*sin(theta);
    x2_ = leg_params.vertex_pos2(1);
    y2_ = leg_params.vertex_pos2(2);

    coord_errors = [x1 - x1_; y1 - y1_; x2 - x2_;y2 - y2_];

end