clc;
clear all;
w1 = 1;
w2 = 1;
x1f = 98.8964;
x2f = 6.083;
t1= 0:0.1:8;

syms t 

a = [0 1 0 0;
    0 0 0 -1;
    0 0 0 0;
    0 0 -1 0];
 y = expm(a*t)
 y1=vpa(subs(y,8));
 c = [0 0 -1.72 -7.677]';
 x = vpa(y*c);
x1 = x(1)
figure;
plot(t1,subs(x1,t1))
grid;
xlabel('Time');
ylabel('State x1');
x2 = x(2)
figure;
plot(t1,subs(x2,t1))
grid;
xlabel('Time');
ylabel('State x2');
lam1 = x(3)
lam2 = x(4)

u_o = -lam2
u = subs(u_o,t1);
figure;
plot(t1,u)
grid;
xlabel('Time');
ylabel('Control u*');


cost = vpa(0.5*w1*(x1f - 100).^2 + 0.5*w2*(x2f).^2 + 0.5*0.1*trapz(u.*u))
