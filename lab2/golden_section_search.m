function [segments, x_min, N] = golden_section_search(a, b, eps)

segments = [a, b];
tau = (sqrt(5)-1)/2;
l = b-a;

x1 = b - tau*l;
x2 = a + tau*l;
f1 = f(x1);
f2 = f(x2);
N = 2;

while l > 2*eps
    if f1 <= f2
        b = x2;
        l = b-a;
        x2 = x1;
        f2 = f1;
        x1 = b - tau*l;
        f1 = f(x1);
        N = N+1;
    else
        a = x1;
        l = b-a;
        x1 = x2;
        f1 = f2;
        x2 = a + tau*l;
        f2 = f(x2);
        N = N+1;
    end
        segment = [a, b];
        segments = [segments; segment];
end

x_min = (a + b) / 2;

end