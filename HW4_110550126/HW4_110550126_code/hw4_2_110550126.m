clear;
clc;
n = 7;
x = [0.3 0.5 0.7 0.9 1.1 1.3 1.5];
f = @(x) x+sin(x)/3;
f_diff = @(x) 1+cos(x)/3;
m = zeros(n,n+1);
m(:,1) = x;
for i = 1:n
    m(i,2) = f(m(i,1));
end
for i = 1:n-1
    for j = 1:n-i
        m(j,i+2) = (m(j+1,i+1)-m(j,i+1));
    end
end
m
target = 0.72;
i = 3;% i from 1~4
s = (target-x(i))/0.2;
g_3 =@(s,i) m(i,2)+m(i,3)*s+m(i,4)*s*(s-1)/2+m(i,5)*s*(s-1)*(s-2)/6;
g_3_diff = @(s,i) ( m(i,3) + m(i,4)*(s+(s-1))/2 + m(i,5)*(s*(s-1)+(s-1)*(s-2)+s*(s-2))/6 )/0.2;
error = abs(g_3_diff(s,i)-f_diff(x(i)))
g_3_diff(s,i)

target = 1.33;
i = 5;% i from 1~5
s = (target-x(i))/0.2;
g_2 =@(s,i) m(i,2)+m(i,3)*s+m(i,4)*s*(s-1)/2;
g_2_diff = @(s,i) (m(i,3) + m(i,4)*(s+(s-1))/2)/0.2;
error = abs(g_2_diff(s,i)-f_diff(x(i)))
g_2_diff(s,i)

target = 0.50;
i = 1;% i from 1~3
s = (target-x(i))/0.2;
g_4 =@(s,i) m(i,2) + m(i,3)*s + m(i,4)*s*(s-1)/2 + m(i,5)*s*(s-1)*(s-2)/6 + m(i,6)*s*(s-1)*(s-2)*(s-3)/24;
g_4_diff = @(s,i) (m(i,3) + m(i,4)*(s+(s-1))/2 + m(i,5)*(s*(s-1)+(s-1)*(s-2)+s*(s-2))/6 + m(i,6)*(s*(s-1)*(s-2)+s*(s-1)*(s-3)+s*(s-2)*(s-3)+(s-1)*(s-2)*(s-3))/24)/0.2;
error = abs(g_4_diff(s,i)-f_diff(x(i)))
g_4_diff(s,i)


