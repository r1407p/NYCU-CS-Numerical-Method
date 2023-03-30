clear;
clc;
A = [4 -1 0 0 0 0;
     -1 4 -1 0 0 0;
     0 -1 4 -1 0 0;
     0 0 -1 4 -1 0;
     0 0 0 -1 4 -1;
     0 0 0 0 -1 4;
     ];
b = [100;200;200;200;200;100];
Ab = [A b];

d = Ab(1,1);
for i = 2:6
    scale = Ab(i,i-1)/d;
    Ab(i,i-1) = 0;
    Ab(i,i) = Ab(i,i)-scale*Ab(i-1,i);
    Ab(i,7) = Ab(i,7)-scale*Ab(i-1,7);
    d = Ab(i,i);
end
X = [0;0;0;0;0;0];
X(6) = Ab(6,7)/Ab(6,6);
Ab(6,6) = 1;
Ab(6,7) = X(6);
for i = 5:-1:1
    X(i) = (Ab(i,7)-Ab(i,i+1)*X(i+1))/Ab(i,i);
    Ab(i,i+1) = 0;
    Ab(i,i) = 1;
    Ab(i,7) = X(i);
end
Ab
X


