function x = golden_section_search(a, b, eps)

tau = (sqrt(5)-1)/2;
l = b-a;

x1 = b - tau*l;
x2 = a + tau*l;
f1 = f(x1);
f2 = f(x2);

while l > 2*eps
    
end



end