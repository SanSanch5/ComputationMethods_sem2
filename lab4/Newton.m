function [x, x0, N] = Newton( a, b, eps ) 

N = 0;
x0 = (a+b)/2;
h = 1e-3;
x = [x0];

while true
    fa = f(x0+h);
    fb = f(x0-h);
    fm = f(x0);
    N = N+3;
    f1 = 0;
    if fm >= fa || fm >= fb
        f1 = (fa-fb) / (2*h);
    end
    if abs(f1) <= eps
        break
    end
    f2 = (fa - 2*fm + fb) / (h^2);
    x0 = x0 - f1/f2;
    if x0 < a || x0 > b
        [x0, n] = golden_section( a, b, N, eps );
        N = N+n;        
    end
    x = [x, x0];
end

end

