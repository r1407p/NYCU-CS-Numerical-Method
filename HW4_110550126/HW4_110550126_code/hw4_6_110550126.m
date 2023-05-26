clear;
clc;
in_a= 0.4;
in_b = 2.6;
out_a = -0.2;
out_b = 1.4;
h = 0.1;
in_n = (in_b-in_a)/h+1
out_n = (out_b-out_a)/h+1
x_points = linspace(out_a,out_b,out_n)
y_points = linspace(in_a,in_b,in_n)
sum_x = 0;
sum_y = 0;
w = [5/9 8/9 5/9];
t = [-sqrt(3/5) 0 sqrt(3/5)]

f = @(x) exp(x);
for i = 1:out_n-1;
    a = x_points(i);
    b = a+0.1;
    temp = 0;
    for j = 1:3
        input = ((b-a)*t(j)+a+b)/2;
        temp = temp+w(j)*f(input);
    end
    temp = temp*(b-a)/2;
    sum_x =sum_x+temp;
end
fprintf("sum_x = %.8f\n",sum_x);

g = @(y) sin(2*y);
for i = 1:in_n-1;
    a = y_points(i);
    b = a+0.1;
    temp = 0;
    for j = 1:3
        input = ((b-a)*t(j)+a+b)/2;
        temp = temp+w(j)*g(input);
    end
    temp = temp*(b-a)/2;
    sum_y =sum_y+temp;
end
fprintf("sum_y = %.8f\n",sum_y);
ans = sum_y*sum_x;
fprintf("ans= %.8f", ans);

