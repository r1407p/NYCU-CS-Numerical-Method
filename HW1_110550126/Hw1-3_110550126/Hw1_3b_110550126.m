clear;
clc;
f = @(x) sqrt(4/x);
k = @(x) x;
L = 1;
R = 3;
start = 2;
ori = start;
n = 0;

tol = 1e-3;


figure(1);
fplot(f,[L,R]);
hold on;
fplot(k,[L,R],'g');

grid on;


fprintf("use iterative method to find root from %d\n",start);

while abs(start - f(start)) > tol && n<20
    n=n+1;
    plot([start,start],[start,f(start)],'r-');
    new = f(start);
    plot([start,new],[f(start),f(start)],'r-');
    start = new;
    fprintf('%d iteration: start =  %.6f\n',n,start)
end

if(abs(start-f(start))<abs(ori-f(ori)))
    fprintf('find root: at around %.6f',start);
else
    fprintf('diverage from %.6f',ori);
end

