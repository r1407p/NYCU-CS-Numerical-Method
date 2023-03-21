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


fprintf("use bisection method to find root between (%d,%d)\n",L,R)

while abs(R-L) > tol
    n = n+1;
    mid = (R+L)/2;
    plot(mid,f(mid),'.r','MarkerSize',10)
    if f(L)*f(mid)<0
        R = mid;
    elseif f(mid)*f(R)<0
        L = mid;
    end
    fprintf('%d iteration: mid =  %.6f\n',n,mid)
end

fprintf('find root: at around %.6f',mid)
