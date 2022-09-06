%% 显式欧拉法（向前差分）
function [U,t,n_s] = eulerf_sol(rfun,h,u_0,t_0,T)
% U      解向量
% t      时步向量
% n_s    时步数
% rfun   右端函数
% u_0    初始值
% t_0    初始时步
% T      总时长

%% 求解步数
n_s = ceil(T/h);
U = zeros(n_s+1,1);
t = t_0+linspace(0,n_s,n_s+1)*h;
%% 迭代格式
U(1) = u_0;
for i_s = 1:n_s
    U(i_s+1) = U(i_s)+h*rfun((t_0+(i_s-1)*h),U(i_s));
end
end