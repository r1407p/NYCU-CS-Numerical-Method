clear;
clc;
f = @(x) (16+x^3)/(5*x^2);
k = @(x) x;

L = 1;
R = 4;
start = 5;
ori = start;
n = 0;

tol = 1e-3;


figure(1);
fplot(f,[L,R]);
hold on;
fplot(k,[L,R],'g');

grid on;


fprintf("use iterative method to find root from %d\n",start);

while abs(start - f(start)) > tol && n<30 && start ~=inf 
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
