clear;
clc;
x = [1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8];
y = [1.543 1.669 1.811 1.971 2.151 2.352 2.577 2.828 3.107];
h = 0.1;
n = 9;
trap = 0;
for i = 1:n
    trap =trap+ y(i);
end
for i = 2:n-1
    trap = trap+y(i);
end
trap  = trap*h/2
%simp 1/3 rule
simp_2222 = 0;
simp_2222 = simp_2222+(y(1)+4*y(2)+y(3));
simp_2222 = simp_2222+(y(3)+4*y(4)+y(5));
simp_2222 = simp_2222+(y(5)+4*y(6)+y(7));
simp_2222 = simp_2222+(y(7)+4*y(8)+y(9));
simp_2222 = simp_2222*h/3
% for 8 interval we can use 2 3/8 rule and 1 1/3 rule (3+3+2 = 8)
% 3 3 2
simp_332 = 0;
simp_332 = simp_332+(y(1)+3*y(2)+3*y(3)+y(4))*3*h/8;
simp_332 = simp_332+(y(4)+3*y(5)+3*y(6)+y(7))*3*h/8;
simp_332 = simp_332+(y(7)+4*y(8)+y(9))*h/3;
simp_332 % 1.7669
abs(simp_2222-simp_332) % 1.2500e-05
% 3 2 3
simp_323 = 0;
simp_323 = simp_323+(y(1)+3*y(2)+3*y(3)+y(4))*3*h/8;
simp_323 = simp_323+(y(4)+4*y(5)+y(6))*h/3;
simp_323 = simp_323+(y(6)+3*y(7)+3*y(8)+y(9))*3*h/8;
simp_323 % 1.7670
abs(simp_2222-simp_323) % 1.6667e-05
% 2 3 3
simp_233 = 0;
simp_233 = simp_233+(y(1)+4*y(2)+y(3))*h/3;
simp_233 = simp_233+(y(3)+3*y(4)+3*y(5)+y(6))*3*h/8;
simp_233 = simp_233+(y(6)+3*y(7)+3*y(8)+y(9))*3*h/8;
simp_233 % 1.7669
abs(simp_2222-simp_233) % 1.2500e-05
