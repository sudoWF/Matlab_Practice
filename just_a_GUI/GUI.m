% A=load('datas.txt');
% plot(A(:,1),A(:,2),'s','markersize',5);
% grid on
% xlabel('....自己写...')
% ylabel('.....自己写....')
% title('......自己写......') 
% 
% 
% a1=polyfit(x,y,1);%1阶多项式最小二乘拟合
% y1=polyval(a1,x);
% plot(x,y,'*',x,y1,'g-','linewidth',2);
% 
% data = importdata('datas.txt')  %文件位置和名称
% x = data(:,1)  %x等于第一列数据
% y = data(:,2)  %y等于第二列数据
% 
% a1=polyfit(x,y,1);%1阶多项式最小二乘拟合
% y1=polyval(a1,x);
% plot(x,y,'*',x,y1,'g-','linewidth',2);



% data = importdata('datas.txt')  %文件位置和名称
% x = data(:,1)  %x等于第一列数据
% y = data(:,2)  %y等于第二列数据
% 
% f=fit(x,y,'exp1')  
% plot(f,x,y);






% clear;clc;
% num = 30;
% x = linspace(0,1,num);
% error = rand(1,num);
data = importdata('datas.txt')  %文件位置和名称
x = data(:,1)  %x等于第一列数据
y = data(:,2)  %y等于第二列数据

lny = log(y); % 先对要拟合的数据取对数
 
p = polyfit(x,lny,1); % 然后对这个中间量lny进行线性拟合
% B = p(1)
% lnA = p(2)
 
% -----------------方法一：可以求出指数拟合的解析式------------------------
    B = p(1);
    A = exp(p(2));
 
    x1 = min(x):1:max(x)
    y1 = A*exp(B*x1);
    
% -----------------方法二：这种方法绕过求解解析式，直接得到拟合曲线---------
    sh2 = polyval(p,x);
    y2 = exp(sh2);
    
 
% 可见，两种方式求解得到的结果相同
subplot(1,2,1)
plot(x,y,'o',x1,y1,'-')
subplot(1,2,2)
plot(x,y,'o',x,y2,'-')