clear;
clc;
dydt = @(y,t) y^2+ t^2;
h = 0.1;
start = 1;
end_ = 2;
n = (end_-start)/h+1;

x = linspace(start,end_,n);
x = x.';
table = zeros(n,4);
table(:,1) = x;
table(1,2) = 0;
table(1,3) = dydt(table(1,2),table(1,1));
table(1,4) = table(1,3)*h;
for i = 2:n
    table(i,2) = table(i-1,2)+table(i-1,4);
    table(i,3) = dydt(table(i,2),table(i,1));
    table(i,4) = table(i,3)*h;
end
table



