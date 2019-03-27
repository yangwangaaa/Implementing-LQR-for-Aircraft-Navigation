clear all;
clc;

t = 0:0.1:8;
%% sim with initial control

u = 0.1*ones(length(t),1);
[t0,y0] = sim('e1',t',[],[t' u]);

%% Unconstrained optimization

options = optimoptions('fminunc','Display','iter','Algorithm','quasi-newton');
[xopt,optimal_cost] = fminunc('e1cf',u,options);

%% Simulation with optimal control
[t_opt,y_opt] = sim('e1',t',[],[t' xopt]);

%% Plotting State time histories
figure;
plot(t_opt,y_opt(:,1));
grid; xlabel('Time'); ylabel('State x1');
figure;
plot(t_opt,y_opt(:,2));
grid; xlabel('Time'); ylabel('State x2');
figure;
plot(t_opt,xopt);
grid; xlabel('Time'); ylabel('Control u*');


