% Objective coefficient f
f = [109, 94.8, 99.5, 93.1, 97.2, 96.3, 92.9, 110, 104,...
    101, 107, 102, 95.2]';

% Spot Rate + 1
s1 = 1.0504;
s2 = 1.0594;
s3 = 1.0636;
s4 = 1.0718;
s5 = 1.0789;
s6 = 1.0839;

% Inequality constraints A, b
A = [];
b = [];


% Present value of the liabilities
Total_present = 500/s1 + 200/(s2^2) + 800/(s3^3) + 200/(s4^4)...
                + 800/(s5^5) + 1200/(s6^6);
% Dollar duration of the liabilities
DD = 1*500/(s1^2) + 2*200/(s2^3) + 3*800/(s3^4) + 4*200/(s4^5)...
    + 5*800/(s5^6) + 6*1200/(s6^7);
% Convert Dollar duration to Modified duration, so that we can make
% equation of liability modified duration and bonds modified duration
DD_modified = DD / Total_present;



% Present value of each bond
P1 = 10/s1 + 10/(s2^2) + 10/(s3^3) + 10/(s4^4) + 10/(s5^5) + 110/(s6^6);
P2 = 7/s1 + 7/(s2^2) + 7/(s3^3) + 7/(s4^4) + 7/(s5^5) + 107/(s6^6);
P3 = 8/s1 + 8/(s2^2) + 8/(s3^3) + 8/(s4^4) + 8/(s5^5) + 108/(s6^6);
P4 = 6/s1 + 6/(s2^2) + 6/(s3^3) + 6/(s4^4) + 106/(s5^5);
P5 = 7/s1 + 7/(s2^2) + 7/(s3^3) + 7/(s4^4) + 107/(s5^5);
P6 = 6/s1 + 6/(s2^2) + 6/(s3^3) + 106/(s4^4);
P7 = 5/s1 + 5/(s2^2) + 5/(s3^3) + 105/(s4^4);
P8 = 10/s1 + 10/(s2^2) + 110/(s3^3);
P9 = 8/s1 + 8/(s2^2) + 108/(s3^3);
P10 = 6/s1 + 6/(s2^2) + 106/(s3^3);
P11 = 10/s1 + 110/(s2^2);
P12 = 7/s1 + 107/(s2^2);
P13 = 100/s1;

% Duration of each bond
D1 = (1*10/s1 + 2*10/(s2^2) + 3*10/(s3^3) + 4*10/(s4^4) + 5*10/(s5^5)...
    + 6*110/(s6^6))/P1;
D2 = (1*7/s1 + 2*7/(s2^2) + 3*7/(s3^3) + 4*7/(s4^4) + 5*7/(s5^5)...
    + 6*107/(s6^6))/P2;
D3 = (1*8/s1 + 2*8/(s2^2) + 3*8/(s3^3) + 4*8/(s4^4) + 5*8/(s5^5)...
    + 6*108/(s6^6))/P3;
D4 = (1*6/s1 + 2*6/(s2^2) + 3*6/(s3^3) + 4*6/(s4^4) + 5*106/(s5^5))/P4;
D5 = (1*7/s1 + 2*7/(s2^2) + 3*7/(s3^3) + 4*7/(s4^4) + 5*107/(s5^5))/P5;
D6 = (1*6/s1 + 2*6/(s2^2) + 3*6/(s3^3) + 4*106/(s4^4))/P6;
D7 = (1*5/s1 + 2*5/(s2^2) + 3*5/(s3^3) + 4*105/(s4^4))/P7;
D8 = (1*10/s1 + 2*10/(s2^2) + 3*110/(s3^3))/P8;
D9 = (1*8/s1 + 2*8/(s2^2) + 3*108/(s3^3))/P9;
D10 = (1*6/s1 + 2*6/(s2^2) + 3*106/(s3^3))/P10;
D11 = (1*10/s1 + 2*110/(s2^2))/P11;
D12 = (1*7/s1 + 2*107/(s2^2))/P12;
D13 = (1*100/s1)/P13;

% Compute yield-to-maturity to calculate the bond modified duration
% Yield-to-Maturity =  [Annual Interest(coupon) + {(FV-Price)/Maturity}] / 
% [(FV+Price)/2]
% FV=100 for all bond (face value)
yield_1 = (10+(100-P1)/6) / ((100+P1)/2);
yield_2 = (7+(100-P2)/6) / ((100+P2)/2);
yield_3 = (8+(100-P3)/6) / ((100+P3)/2);
yield_4 = (6+(100-P4)/5) / ((100+P4)/2);
yield_5 = (7+(100-P5)/5) / ((100+P5)/2);
yield_6 = (6+(100-P6)/4) / ((100+P6)/2);
yield_7 = (5+(100-P7)/4) / ((100+P7)/2);
yield_8 = (10+(100-P8)/3) / ((100+P8)/2);
yield_9 = (8+(100-P9)/3) / ((100+P9)/2);
yield_10 = (6+(100-P10)/3) / ((100+P10)/2);
yield_11 = (10+(100-P11)/2) / ((100+P11)/2);
yield_12 = (7+(100-P12)/2) / ((100+P12)/2);
yield_13 = (0+(100-P13)/1) / ((100+P13)/2);

% Compute the bond modified duration
% modified duration = duration / (1+yield/m),  m=1
D1_modified = D1 / (1+yield_1);
D2_modified = D2 / (1+yield_2);
D3_modified = D3 / (1+yield_3);
D4_modified = D4 / (1+yield_4);
D5_modified = D5 / (1+yield_5);
D6_modified = D6 / (1+yield_6);
D7_modified = D7 / (1+yield_7);
D8_modified = D8 / (1+yield_8);
D9_modified = D9 / (1+yield_9);
D10_modified = D10 / (1+yield_10);
D11_modified = D11 / (1+yield_11);
D12_modified = D12 / (1+yield_12);
D13_modified = D13 / (1+yield_13);

% Euality constraints Aeq, beq
Aeq = [P1 P2 P3 P4 P5 P6 P7 P8 P9 P10 P11 P12 P13;
    D1_modified*P1/Total_present D2_modified*P2/Total_present...
    D3_modified*P3/Total_present D4_modified*P4/Total_present...
    D5_modified*P5/Total_present D6_modified*P6/Total_present...
    D7_modified*P7/Total_present D8_modified*P8/Total_present...
    D9_modified*P9/Total_present D10_modified*P10/Total_present...
    D11_modified*P11/Total_present D12_modified*P12/Total_present...
    D13_modified*P13/Total_present];
beq = [Total_present; DD_modified];

% Variable bounds lb, ub
lb = zeros(13,1);
ub = ones(13,1) * inf;

% Call linprog
[x, fval] = linprog(f,A,b,Aeq,beq,lb,ub)