clear;
clc;
f = @(x) x.^2 + sin(x) -exp(x)/4 -1;
df = @(x) 2*x + cos(x) - exp(x)/4;
tol = 1e-5;
start = 2;
n = 0;


figure(1)
fplot(f,[0,2],"b")
hold on
plot(start,f(start),'mo')
grid on


fprintf("use newton method to find root from %d\n",start);
while abs(f(start))>tol
    n = n+1;
    new = start-f(start)/df(start);
    line([new,start],[0,f(start)])
    plot([new,new],[0,f(new)],'-g')
    plot(new,f(new),'.r','MarkerSize',10)
    plot(new,0,'ob')
    start = new;
    fprintf('%d iteration: from =  %.6f\n',n,start)
end
fprintf('find root: at around %.6f',start)