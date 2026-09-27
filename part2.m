x = [1; 2; 3];

max_iter = 200;
ftol = 1e-12;

for n=1:max_iter
    [f_val, J] = test_function01(x)
    dx = J\f_val;
    x = x-dx;

    if norm(dx) < ftol
        break
    end
end 

x
[f_check, ~] = test_function01(x);
disp(f_check)

