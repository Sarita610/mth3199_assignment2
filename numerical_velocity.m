leg_params = define_leg_parameters();

theta_val = linspace(0, 2*pi, 100);

dx_tip_numerical = zeros(size(theta_vals)); 
dy_tip_numerical = zeros(size(theta_vals));

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

vertex_coords = vertex_coords_guess;

for i = 1:length(theta_val)
    theta = theta_val(i);
    vertex_coords = compute_coords(vertex_coords, leg_params, theta);
   
    coords_wrapped = @(theta_val)compute_coords(vertex_coords_guess, leg_params, theta_val);
    numerical_computation = approximate_jacobian(coords_wrapped, theta);
    
    

    dx_tip_numerical(i) = numerical_computation(tx)
    dy_tip_numerical(i) = numerical_computation(ty);
end

figure(1);
plot(theta_val, dx_tip_numerical);

figure(2);
plot(theta_val, dy_tip_numerical);



