function f_out = hit_target(x)
    theta = x(1);
    t = x(2);
    V_p = projectile_traj(theta, t);
    V_t = target_traj(t);

    f_out = V_p-V_t;
end

    