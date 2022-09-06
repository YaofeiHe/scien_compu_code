%% 求解示例
%% 这里定义匿名函数（右端函数）
rfun = @(t,u)-5*u;
t_0 = 0;
u_0 = 1;


t_e = 4;
T = t_e-t_0;
% 0.1
h = 0.1;
[U_f1,t_f1,~] = eulerf_sol(rfun,h,u_0,t_0,T);
% 0.23
h = 0.23;
[U_f2,t_f2,~] = eulerf_sol(rfun,h,u_0,t_0,T);
% 0.36
h = 0.36;
[U_f3,t_f3,~] = eulerf_sol(rfun,h,u_0,t_0,T);
% 0.42
h = 0.42;
[U_f4,t_f4,~] = eulerf_sol(rfun,h,u_0,t_0,T);

t_t = [t_0:0.01:t_e];
U_t = exp(-5*t_t);

figure(1)
plot(t_t,U_t,'r-',t_f1,U_f1,t_f2,U_f2,t_f3,U_f3,t_f4,U_f4)
legend('解析解','h=0.1','h=0.23','h=0.36','h=0.42  ')