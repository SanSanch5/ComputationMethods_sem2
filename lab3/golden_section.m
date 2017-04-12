 function [ a, mid, b, fa, fm, fb, N ] = golden_section( a, b )
    tau = (sqrt(5)-1)/2;
    l = b-a;
    x1 = b - tau*l;
    x2 = a + tau*l;
    f1 = f(x1); f2 = f(x2);
    fa = NaN; fb = NaN;
    N = 2;
    while true
        if f1 <= f2
            b = x2; fb = f2;
            l = b-a;
            x2 = x1; f2 = f1;
            x1 = b - tau*l; f1 = f(x1);
            mid = x1; fm = f1;
        else
            a = x1; fa = f1;
            l = b-a;
            x1 = x2; f1 = f2;
            x2 = a + tau*l; f2 = f(x2);
            mid = x2; fm = f2;
        end
        N = N+1;
        if fa >= fm && fm <= fb
            return
        end
    end

end

