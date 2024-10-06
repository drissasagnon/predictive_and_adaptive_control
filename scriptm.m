A1 = 28;
A2 = 32;
A3 = A1;
A4 = A2;
a1 = 71e-3;
a2 = 57e-3;
a3 = a1;
a4 = a2;
g = 981;
gamma1 = 0.7;
gamma2 = 0.6;
k1 = 3.33;
k2 = 3.35;


%% State space of linearized system :

v1_0 = 3;
v2_0 = 3;


h1_0 = (1/(2*g))*(gamma1*k1*v1_0/a1 + (1-gamma2)*k2*v2_0/a1)^2;
h2_0 = (1/(2*g))*(gamma2*k2*v2_0/a2 + (1-gamma1)*k1*v1_0/a2)^2;
h3_0 = (1/(2*g))*((1-gamma2)*k2*v2_0/a3)^2;
h4_0 = (1/(2*g))*((1-gamma1)*k1*v1_0/a4)^2;

T1 = (A1/a1)*sqrt(2*h1_0/g);
T2 = (A2/a2)*sqrt(2*h2_0/g);
T3 = (A3/a3)*sqrt(2*h3_0/g);
T4 = (A4/a4)*sqrt(2*h4_0/g);

A = [-1/T1     0  A3/(A1*T1)           0;
         0 -1/T2           0  A4/(A2*T2);
         0     0       -1/T3           0;
         0     0           0       -1/T4];
B = [ (gamma1*k1)/A1                 0;
                   0    (gamma2*k2)/A2;
                   0  (1-gamma2*k2)/A3;
     (1-gamma1)*k1/A4               0];
C = [1 0 0 0;
     0 1 0 0];
D = [0 0;
     0 0];
