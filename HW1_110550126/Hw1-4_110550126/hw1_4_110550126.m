clear;
clc;
f = @(x)[x(1)-3*x(2)-x(3)^2+3;
            2*x(1)^3+x(2)-5*x(3)^2+2;
            4*x(1)^2+x(2)+x(3)-7;];
j = @(x)[1,-3,-2*x(3);
            6*x(1)^2,1,-10*x(3);
            8*x(1),1,1;];
tol = 1e-5;
n = 0;
%start = [1;1;1];
%start = [1.3;0.9;-1.2];
%start = [100;100;100];
%start = [50,-50,-50];
%start = [10i;1i;1i];
%start = [-10i;1;1];
fprintf("solving system of nonlinear equations from %.6f+%.6fi,%.6f+%.6fi,%.6f+%.6fi\n",real(start(1)),imag(start(1)),real(start(2)),imag(start(2)),real(start(3)),imag(start(3)));
while true
    a = f(start);
    b = j(start);
    %b*s = -a 
    s = -b\a;
    %new = old +s
    start = start+s;
    n =n+1;
    fprintf("%d iteration: start =   %.6f+%.6fi,%.6f+%.6fi,%.6f+%.6fi\n",n,real(start(1)),imag(start(1)),real(start(2)),imag(start(2)),real(start(3)),imag(start(3)));
    %f(start)
    if norm(s)<tol
        break
    end
end
fprintf("find solution at  %.6f+%.6fi,%.6f+%.6fi,%.6f+%.6fi \n",real(start(1)),imag(start(1)),real(start(2)),imag(start(2)),real(start(3)),imag(start(3)));
