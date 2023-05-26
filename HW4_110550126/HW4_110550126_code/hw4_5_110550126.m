clear;
clc;
f = @(x) 1/x.^2;
prev = 0;
now =0;
iteration = 1;
a = 0.2;
b = 1.0;
while(1)
    prev = now;
    points = 2^iteration+1;
    h = (b-a)/(points-1);
    p = linspace(a,b,points);
    now = 0;
    for i = 1:points
        now = now + f(p(i));
    end
    for i = 2:points-1
        now = now + f(p(i));
    end
    now = now *h/2;

    fprintf("%d iteration: ",iteration);
    fprintf("value = %f\n",now);
    fprintf("with %d points, h = %f \n",points,h);
    if(abs(now-prev)< 0.02 )
        break;
    end
    iteration = iteration+1;
end
fprintf("\nans = %f\n",now);
fprintf("at %d iteration with %d points, h = %f \n",iteration,points,h);