clear;
clc;
g0 = @(x) 6*(x+1).^3-3*(x+1).^2;
g1 = @(x) -10*(x+0.5).^3 +6*(x+0.5).^2 +3/2*(x+0.5);
g2 = @(x) 10*x.^3 - 9*x.^2 + 1;
g3 = @(x) -6*(x-0.5).^3 +6*(x-0.5).^2 -3/2*(x-0.5);
x0 = linspace(-1,-0.5);
x1 = linspace(-0.5,0);
x2 = linspace(0,0.5);
x3 = linspace(0.5,1);
plot(x0,g0(x0));
hold on;
plot(x1,g1(x1));
hold on;
plot(x2,g2(x2));
hold on;
plot(x3,g3(x3));
hold on;
g1(-0.5)
g1(0)
p0 = @(x) 0*x;
p1 = @(x) 1+2*x;
p2 = @(x) 1-2*x;
p3 = @(x) 0*x;

plot(x0,p0(x0));
plot(x1,p1(x1));
plot(x2,p2(x2));
plot(x3,p3(x3));