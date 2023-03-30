clear;
clc;
A = [4.63 -1.21 3.22;
-3.07 5.48 2.11;
1.26 3.11 4.57];
b = [2.22;-3.17;5.11];
init= [0;0;0];
N = 3;
Y = [0;0;0];
X = [0;0;0];
w = 1.72;
now = 1;
tol = 0.001;
while 1
    for i =1:N
        X(i) = (b(i)/A(i,i)) - (A(i,[1:i-1,i+1:N])*init([1:i-1,i+1:N]))/A(i,i);
        init(i) = X(i);
    end
    X = Y+w*(X-Y);
    init = X;
    fprintf('Iteration %d: ', now)
    fprintf("X = [%f, %f, %f ]\n",X(1,1),X(2,1),X(3,1))
    if abs(A*X-b)<tol
        break
    end
    Y = X;
    now=now+1;
end