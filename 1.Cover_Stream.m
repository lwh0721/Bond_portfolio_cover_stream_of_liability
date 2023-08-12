% Objective coefficient f
f = [109, 94.8, 99.5, 93.1, 97.2, 96.3, 92.9, 110, 104,...
    101, 107, 102, 95.2, 0, 0, 0, 0, 0]';

% Forward Rate + 1
f_12 = (1.0594^2) / (1.0504);
f_23 = (1.0636^3) / (1.0594^2);
f_34 = (1.0718^4) / (1.0636^3);
f_45 = (1.0789^5) / (1.0718^4);
f_56 = (1.0839^6) / (1.0789^5);

% Inequality constraints A, b
A = -[10 7 8 6 7 6 5 10 8 6 10 7 100 -1 0 0 0 0;
    10 7 8 6 7 6 5 10 8 6 110 107 0 f_12 -1 0 0 0;
    10 7 8 6 7 6 5 110 108 106 0 0 0 0 f_23 -1 0 0;
    10 7 8 6 7 106 105 0 0 0 0 0 0 0 0 f_34 -1 0;
    10 7 8 106 107 0 0 0 0 0 0 0 0 0 0 0 f_45 -1;
    110 107 108 0 0 0 0 0 0 0 0 0 0 0 0 0 0 f_56];

b = -[500; 200; 800; 200; 800; 1200];

% Euality constraints Aeq, beq
Aeq = [];
beq = [];

% Variable bounds lb, ub
lb = zeros(18,1);
ub = ones(18,1) * inf;

% Call linprog
[x, fval] = linprog(f,A,b,Aeq,beq,lb,ub)