clc;

draw_solution_array = false;

x = -1:1/100:0;
y = arrayfun(@f, x);

eps_array = [10^-2, 10^-4, 10^-8];
for eps = eps_array
    [x_solution_array, x_min, N] = Newton(-1, 0, eps);
    fprintf('Значение eps: %.6e\n', eps);
    fprintf('Значение x*: %.8f\n', x_min);
    fprintf('Значение функции f(x*): %.8f\n', f(x_min));
    fprintf('Количество итераций: %d\n', N);

    if ~draw_solution_array
        x_solution_array = [];
    else
        fprintf('xi,\tf(xi)\t:\n');
    end
    y_solution_array = arrayfun(@f, x_solution_array);

    for x_i = x_solution_array
        fprintf('%f\t%f\t\n', x_i, f(x_i));
    end
    fprintf('\n')
    
end

fprintf('\nfminbnd:\n');
opt=optimset('TolX', 1e-6);
[X, Fval, exitflag, output] = fminbnd(@f, -1, 0, opt);
fprintf('\nРезультат: x* = %13.10f; f(x*) = %10f; N = %d\n',...
    X, Fval, output.iterations); 

figure('Name', strcat('Точность: ', num2str(eps)),'NumberTitle', 'off');
plot(x, y, '-', x_solution_array, y_solution_array, 'b*',... 
    x_min, f(x_min), 'ro') 