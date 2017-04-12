function [ segments, x0, N ] = parabolic( a, b, eps )   

[x1, x2, x3, f1, f2, f3, N] = golden_section( a, b );
segments = [x1, x3];

a1 = (f2 - f1) / (x2 - x1);
a2 = ((f3 - f1) / (x3 - x1) - (f2 - f1) / (x2 - x1)) / (x3 - x2);
x0 = (x1 + x2 - a1/a2)/2; xx = NaN;
f0 = f(x0); N = N+1;

it = 0;
while true
    if it == 0
        it = 1;
    else
        if abs( xx - x0 ) <= eps
            break;
        end
    end
    if x0 < x2
        if f0 <= f2
            x3 = x2; f3 = f2;
            x2 = x0; f2 = f0;
        else
            x1 = x0; f1 = f0;
        end
    else
        if f0 < f2
            x1 = x2; f1 = f2;
            x2 = x0; f2 = f0;
        else
            x3 = x0; f3 = f0;
        end
    end
    xx = x0;
    a1 = (f2 - f1) / (x2 - x1);
    a2 = ((f3 - f1) / (x3 - x1) - (f2 - f1) / (x2 - x1)) / (x3 - x2);
    x0 = (x1 + x2 - a1/a2)/2;
    f0 = f(x0); N = N + 1;
    segments = [segments; [x1, x3]];
end

end

