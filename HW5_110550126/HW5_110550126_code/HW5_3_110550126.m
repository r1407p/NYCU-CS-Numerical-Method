clear;
clc;
dy = [0];
predict_y = [0];

%a
T = linspace(0.2,1,5);

for i = 1:5
   
    [t, y] = ode45(@f, [0 T(i)], [0; 1; 0]);
    predict_y(i+1) = y(length(y),1);
    dy(i+1) = y(length(y),2);
end
predict_y

%b
for i = 4:5
    predict_y(i+1) = predict_y(i) + 0.2/24*(55*dy(i)-59*dy(i-1)+37*dy(i-2)-9*dy(i-3));
end
predict_y(6)


%c
corrector = predict_y(5) + 0.2/24*(9*dy(6)+19*dy(5)-5*dy(4)+dy(3))
error_rate = abs((corrector-predict_y(6))/corrector)
accuracy = 1-error_rate;
fprintf("accuracy=%.8f",accuracy)

function dydt = f(t, y)
    dydt = [y(2); y(3); t-t*y(2)+2*y(1)];
end
