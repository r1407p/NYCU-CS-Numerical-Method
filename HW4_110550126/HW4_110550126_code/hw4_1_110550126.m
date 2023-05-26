clear;
clc;
n = 6;
x = [0.15 0.21 0.23 0.27 0.32 0.35];
f = @(x) 1+log(x)/log(10);
m = zeros(n,n+2);
for i = 1:n
    m(i,1) = i-1;
end
m(:,2) = x;
for i = 1:n
    m(i,3) = f(m(i,2));
end

for i = 1:n-1
    for j = 1:n-i
        m(j,i+3) = (m(j+1,i+2)-m(j,i+2))/(m(j+i,2)-m(j,2));
    end
end
m
g = @(x0,i) m(i,3)+m(i,4).*(x0-x(i))+m(i,5).*(x0-x(i)).*(x0-x(i+1));
error = @(x0,i) m(i,6).*(x0-x(i)).*(x0-x(i+1)).*(x0-x(i+2));
error(0.268,1);%0.0040
error(0.268,2);%-3.8567e-05
error(0.268,3);%2.3570e-05
g_diff = @(x0,i) m(i,4)+m(i,5).*((x0-x(i))+(x0-x(i+1)));
g_diff_error = @(x0,i) m(i,6).*((x0-x(i)).*(x0-x(i+1))+(x0-x(i+1)).*(x0-x(i+2))+(x0-x(i)).*(x0-x(i+2)));
g_diff_error(0.268,1)
g_diff_error(0.268,2)
g_diff_error(0.268,3)
g_diff(0.268,3)

