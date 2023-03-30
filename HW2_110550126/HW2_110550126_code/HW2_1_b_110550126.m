clear;
clc;
A = [2.51 1.48 4.53;
     1.48 0.93 -1.30;
     2.68 3.04 -1.48];
b = [0.05;1.03;-0.53];
Ab = [A b];
Ab = [0 0 1; 0 1 0; 1 0 0 ]*Ab;
i = 1;
for j = i+1:3
        Ab(j,i:4) = round(Ab(j,i:4) -Ab(j,i)/Ab(i,i)*Ab(i,i:4),2);
end
Ab
Ab = [1 0 0 ; 0 0 1; 0 1 0;]*Ab;
Ab
i = 2;
for j = i+1:3
        Ab(j,i:4) = round(Ab(j,i:4) -Ab(j,i)/Ab(i,i)*Ab(i,i:4),2);
end
Ab
x = [0;0;0];
x(3) = round(Ab(3,4)/Ab(3,3),2);
for i = 2:-1:1
    x(i) = round((Ab(i,4)-Ab(i,i+1:3)*x(i+1:3))/Ab(i,i),2);
end
x
