 function [ x, N ] = golden_section( a, b, cnt, eps )
    tau = (sqrt(5)-1)/2;
    l = b-a;
    x1 = b - tau*l;
    x2 = a + tau*l;
    f1 = f(x1); f2 = f(x2);
    N = 2;
    i = 0;
    while l > 2*eps && i < cnt
        if f1 <= f2
            b = x2;
            l = b-a;
            x2 = x1; f2 = f1;
            x1 = b - tau*l; f1 = f(x1);
        else
            a = x1;
            l = b-a;
            x1 = x2; f1 = f2;
            x2 = a + tau*l; f2 = f(x2);
        end
        N = N+1;
        i = i+1;
    end
    x = (a + b) / 2;
end

