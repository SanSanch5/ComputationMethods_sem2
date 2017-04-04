draw_solution_array = true;

x = -1:1/100:0;
y = arrayfun(@f, x);

eps_array = [10^-2, 10^-4, 10^-6];
for eps = eps_array
    x_solution_array = bitwise_search(-1, 0, eps);
    [rc, cc] = size(x_solution_array);
    x_min = x_solution_array(end);
    if ~draw_solution_array
        x_solution_array = [];
    end
    y_solution_array = arrayfun(@f, x_solution_array);

    fprintf('�������� eps: %f\n', eps);
    fprintf('�������� x*: %.8f\n', x_min);
    fprintf('�������� ������� f(x*): %.8f\n', f(x_min));
    fprintf('���������� ��������: %d\n\n', cc);

    figure('Name', strcat('��������: ', num2str(eps)),'NumberTitle', 'off');
    plot(x, y, '-', x_solution_array, y_solution_array, 'b*',... 
        x_min, f(x_min), 'ro') 
end