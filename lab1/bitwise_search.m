function x = bitwise_search(a, b, eps)
delta = (b-a)/4;
x0 = a;
f0 = f(a);
x = x0;

while abs(delta) > eps
    x1 = x0 + delta;
    f1 = f(x1);
    x = [x; x1];
    
    if f0 > f1
        x0 = x1;
        f0 = f1;
        if x0 < b && x0 > a
            continue;
        end
    end
    x0 = x1;
    f0 = f1;
    delta = -delta/4;
end

x = x.';

end