clear;
clc;
f = @(x) ((x-2)^3)*(x-4)^2;
df = @(x) 3*((x-2)^2)*((x-4)^2)+2*((x-2)^3)*(x-4);
tol = 1e-5;

start = 2.95;
n = 0;



fplot(f,[1.5,4],"b")
grid on
figure(1)
hold on
plot(start,f(start),'mo')


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
