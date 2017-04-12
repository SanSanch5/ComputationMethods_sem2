clc;

draw_solution_array = false;

x = -1:1/100:0;
y = arrayfun(@f, x);

eps_array = [10^-2, 10^-4, 10^-6];
for eps = eps_array
    [segments, x_min, N] = parabolic(-1, 0, eps);

    fprintf('�������� eps: %.10e\n', eps);
    fprintf('�������� x*: %.8f\n', x_min);
    fprintf('�������� ������� f(x*): %.8f\n', f(x_min));
    fprintf('���������� ��������: %d\n\n', N);
    
    if ~draw_solution_array
        segments = [];
    else
        fprintf('[\tai,\tbi\t]:\n');
    end
    
    [n, m] = size(segments);
    for row = 1 : n
        fprintf('[\t%f\t,\t%f\t]\n', segments(row,1), segments(row,2));
    end
    fprintf('\n')
end

figure('Name', strcat('��������: ', num2str(eps)),'NumberTitle', 'off');
plot(x, y, '-', x_min, f(x_min), 'ro');
