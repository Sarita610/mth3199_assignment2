%runs strandbeest simulation
function strandbeest_simulation()
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

    vid = 'strandbeest_animation.avi';
    writer_obj = VideoWriter(vid);
    open(writer_obj);

    fig = figure(1);
    set(fig, 'units', 'pixels', 'position', [0 0 1440 1080])
    axis equal;
    hold on;
    axis([-160, 60, -160, 60]);

    title('Strandbeest Simulation', 'Interpreter', 'latex', 'FontSize', 20);
    xlabel('$x$ position (-)', 'Interpreter', 'latex', 'FontSize', 16);
    ylabel('$y$ position (-)', 'Interpreter', 'latex', 'FontSize', 16);

    tvertex = 7;
    tx = 2*tvertex - 1;
    ty = 2*tvertex;

    path = plot(nan, nan, 'r--', 'linewidth', 1);
    path_x = [];
    path_y = [];

    leg_drawing = initialize_leg_drawing(leg_params);
    num_animation = 3;

    theta_val = linspace(0, num_animation*2*pi, 600);
    vertex_coords = vertex_coords_guess;
    
    for i = 1:length(theta_val)
        theta = theta_val(i);
        vertex_coords = compute_coords(vertex_coords, leg_params, theta);
        update_leg_drawing(vertex_coords, leg_drawing, leg_params);

        if theta <= 2*pi
            path_x(end+1) = vertex_coords(tx);
            path_y(end+1) = vertex_coords(ty);
            set(path, 'xdata', path_x, 'ydata', path_y);
        end

        drawnow;
        current_frame = getframe(fig);
        writeVideo(writer_obj, current_frame);
    end

    close(writer_obj);
end