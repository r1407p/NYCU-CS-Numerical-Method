clear;
clc;
n = 2;
h_01 = 3.679686;
h_005= 4.558168;
pre = 3.679686;
cur = 4.558168;
while abs(cur - pre) > 1e-6
    next = cur + (cur - pre)/(2^n - 1);
    pre = cur;
    cur = next;
    n = n + 1;
end
1-(abs(cur-h_005)/cur)