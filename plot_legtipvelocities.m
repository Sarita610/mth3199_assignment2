function plot_legtipvelocities

    leg_params = define_leg_parameters();

    vertex_coords_guess = [...
        [   0;  50];... %vertex 1 guess
        [ -50;   0];... %vertex 2 guess
        [ -50;  50];... %vertex 3 guess
        [-100;   0];... %vertex 4 guess
        [-100; -50];... %vertex 5 guess
        [ -50; -50];... %vertex 6 guess
        [ -50;-100]...  %vertex 7 guess
    ];

    tvertex = 7;
    tx = 2*tvertex - 1;
    ty = 2*tvertex;

    theta_val = linspace(0, 2*pi, 100);
    dx_tip = zeros(size(theta_val));
    dy_tip = zeros(size(theta_val));
    vertex_coords = vertex_coords_guess;

    for i = 1:length(theta_val)
        theta_ = theta_val(i);
        vertex_coords = compute_coords(vertex_coords, leg_params, theta_);

        dVdtheta = compute_velocities(vertex_coords, leg_params, theta_);
    
        dx_tip(i) = dVdtheta(tx);
        dy_tip(i) = dVdtheta(ty);
    end 

    %Plot 1
    figure(1);
    plot(theta_val, dx_tip)

    %Plot 2
    figure(2);
    plot(theta_val, dy_tip)

end 