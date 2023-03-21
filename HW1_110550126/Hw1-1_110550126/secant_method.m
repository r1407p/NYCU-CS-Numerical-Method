clear;
clc;
f = @(x) x.^2 + sin(x) -exp(x)/4 -1;
tol = 1e-5;
L = 0;
R = 2;
n = 0;


figure(1)
fplot(f,[L,R],"b")
hold on
plot(L,f(L),'mo')
plot(R,f(R),'mo')
grid on

new = R-f(R)*(R-L)/(f(R)-f(L));
fprintf("use secant method to find root from %d,%d\n",L,R)
while abs(f(new)) > tol
    n = n+1;
    plot(new,f(new),'.r','MarkerSize',10)
    plot(new,0,'ob')
    line([L,R],[f(L),f(R)])
    if f(L)*f(new)<0
        R = new;
    else
        L = new;
    end
    fprintf('%d iteration: new =  %.6f\n',n,new)
    new = R-f(R)*(R-L)/(f(R)-f(L));
end
fprintf('find root: at around %.6f',new)
