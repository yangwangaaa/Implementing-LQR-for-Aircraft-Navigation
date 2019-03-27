clc;
clear all;
close all;

%% System matrices

A = [-0.0000 1.0000 -0.0000 0.0000;
-0.0000 -0.5000 -0.0022 0.0015;
-30.8405 -60.240 0.0089 0.0011;
-0.0190 0.0092 0.0017 0.0120];

B = [-0.0000 -0.0000;
-0.0226 -0.0212;
0.0010 -0.0035;
0.0068 -0.0072];

C = eye(4);

D = zeros(4,2);

%% State space representation

system = ss(A,B,C,D)

%% Eigen values of the system

lamda = eig(system)

%% LQR Controller feedback design
R = eye(2);
Q = eye(4);
[K,S,e] = lqr(system,Q,R,0)

%% System Matrices (with LQR Feedback)
Alqr = A-B*K;
Blqr = B;
Clqr = C;
Dlqr = D;

system_lqr = ss(Alqr,Blqr,Clqr,Dlqr)

lamda_lqr = eig(system_lqr)
