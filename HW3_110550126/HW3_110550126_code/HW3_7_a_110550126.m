clear;
clc;
x = [1;
     2;
     3;];
e = exp(1);
y=  [1/e'
     2/(e)^2;
     3/(e)^3;];
diff = [0;
    -1/(e)^2;
    -2/(e)^3;
    ];
g = @(u) [2*u^3-3*u^2+1 -2*u^3+3*u^2 u^3-2*u^2+u u^3-u^2];