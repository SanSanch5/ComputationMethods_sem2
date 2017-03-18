tst = variant20_function(-0.5);
disp(tst)

x = -1:1/100:0;
y = variant20_function(x);
x_solution_array = bitwise_search(-1, 0, 10^-6);
disp(x_solution_array)
figure
plot(x, y)