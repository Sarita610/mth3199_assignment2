params.numerical_diff = true;
x_guess = [pi/6; 3];

[x_root, flag] = multi_newton_solver(@hit_target, x_guess, params);
theta = x_root(1);
t_c = x_root(2);


% disp(theta)
% disp(t_c)
% disp(flag)
% 
% f_check = hit_target(x_root);
% disp(f_check)

projectile_simulation(theta,t_c);

