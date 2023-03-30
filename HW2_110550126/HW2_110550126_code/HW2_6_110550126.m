clear;
clc;
A = [4 -1  1  0  0  0;
    -1  4 -1  1  0  0;
     1 -1  4 -1  1  0;
     0  1 -1  4 -1  1;
     0  0  1 -1  4 -1;
     0  0  0  1 -1  4;
     ];
b = [100;200;300;300;200;100];
Ab = [A b];
w = 2;

siz = length(b);
d = Ab(1,1);
for k = 1:siz-1% reference row: k 
    for i = k+1:k+w %process eliminate row:
        if i>siz
            break
        end
        scale = Ab(i,k)/d;
        Ab(i,k) = 0;
        for j = k+1:k+w%process eliminate column:j
            if j >siz
                break
            end
            Ab(i,j) = Ab(i,j)-scale*Ab(k,j);
        end
        Ab(i,siz+1) = Ab(i,siz+1)-scale*Ab(k,siz+1);
    end
    d = Ab(k+1,k+1);
end
X = zeros(siz,1);
X(siz) = Ab(siz,siz+1)/Ab(siz,siz);
Ab(siz,siz) = 1;
Ab(siz,siz+1) = X(siz);
for i = siz:-1:2 %column
    for j = i-1:-1:i-w %row
        if j <1
            break
        end
        Ab(j,siz+1) = Ab(j,siz+1)-Ab(j,i)*X(i);
        Ab(j,i) = 0;
    end
    Ab(i-1,siz+1) = Ab(i-1,siz+1)/Ab(i-1,i-1);
    Ab(i-1,i-1) = 1;
    X(i-1) = Ab(i-1,siz+1);
end
Ab
X
A*X


