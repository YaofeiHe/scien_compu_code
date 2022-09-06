clear;clc
%% 求解示例
%% 这里定义匿名函数（右端函数）
rfun = @(t,u)-5*u;
t_0 = 0;
u_0 = 1;

%% 求解
h = 0.1;
t_e = 4;
T = t_e-t_0;
% 显式欧拉
[U_f,t_f,n_s] = eulerf_sol(rfun,h,u_0,t_0,T);
% 改进欧拉
[U_c,t_c,n_c] = eulerc_sol(rfun,h,u_0,t_0,T);
% 隐式欧拉
[U_b,t_b,n_b] = eulerb_sol(rfun,h,u_0,t_0,T);
%% 真解
t_t = [t_0:0.01:t_e];
U_t = exp(-5*t_t);

%% 绘图
figure(1)
plot(t_t,U_t,'r-',t_f,U_f,'bo',t_c,U_c,'ko',t_b,U_b,'go')
legend('解析解','显式欧拉解','改进欧拉解','隐式欧拉解')
% figure(2)
% plot(t_f,U_f,'bo',t_c,U_c,'ko',t_b,U_b,'go')
% legend('显式欧拉解','改进欧拉解','隐式欧拉解')
% figure(3)
% plot(t_t,U_t,'r-',t_f,U_f,'b-',t_b,U_b,'g-')
% legend('解析解','显式欧拉解','隐式欧拉解')