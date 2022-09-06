%% 隐式欧拉法（向后差分）
function [U,t,n_s] = eulerb_sol(rfun,h,u_0,t_0,T)
% U      解向量
% t      时步向量
% n_s    时步数
% rfun   右端函数
% u_0    初始值
% t_0    初始时步
% T      总时长
% 非线性方程迭代过程的最小允差
min_d = 0.5;
del = min_d+1;
%% 求解步数
n_s = ceil(T/h);
U = zeros(n_s+1,1);
t = t_0+linspace(0,n_s,n_s+1)*h;
%% 迭代格式
U(1) = u_0;
for i_s = 1:n_s
    u_k0 = U(i_s);
    u_k = u_k0;
    % 迭代求解非线性方程
    del = min_d+1;
    while del>=min_d
        u_k1 = u_k;
        u_k = u_k0+h*(rfun((t_0+i_s*h),u_k));
        del = abs(u_k-u_k1);
    end
    U(i_s+1) = u_k0+h*(rfun((t_0+i_s*h),u_k));
%     n_s-i_s  % 用于调试
end
end