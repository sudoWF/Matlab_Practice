% A=load('datas.txt');
% plot(A(:,1),A(:,2),'s','markersize',5);
% grid on
% xlabel('....�Լ�д...')
% ylabel('.....�Լ�д....')
% title('......�Լ�д......') 
% 
% 
% a1=polyfit(x,y,1);%1�׶���ʽ��С�������
% y1=polyval(a1,x);
% plot(x,y,'*',x,y1,'g-','linewidth',2);
% 
% data = importdata('datas.txt')  %�ļ�λ�ú�����
% x = data(:,1)  %x���ڵ�һ������
% y = data(:,2)  %y���ڵڶ�������
% 
% a1=polyfit(x,y,1);%1�׶���ʽ��С�������
% y1=polyval(a1,x);
% plot(x,y,'*',x,y1,'g-','linewidth',2);



% data = importdata('datas.txt')  %�ļ�λ�ú�����
% x = data(:,1)  %x���ڵ�һ������
% y = data(:,2)  %y���ڵڶ�������
% 
% f=fit(x,y,'exp1')  
% plot(f,x,y);






% clear;clc;
% num = 30;
% x = linspace(0,1,num);
% error = rand(1,num);
data = importdata('datas.txt')  %�ļ�λ�ú�����
x = data(:,1)  %x���ڵ�һ������
y = data(:,2)  %y���ڵڶ�������

lny = log(y); % �ȶ�Ҫ��ϵ�����ȡ����
 
p = polyfit(x,lny,1); % Ȼ�������м���lny�����������
% B = p(1)
% lnA = p(2)
 
% -----------------����һ���������ָ����ϵĽ���ʽ------------------------
    B = p(1);
    A = exp(p(2));
 
    x1 = min(x):1:max(x)
    y1 = A*exp(B*x1);
    
% -----------------�����������ַ����ƹ�������ʽ��ֱ�ӵõ��������---------
    sh2 = polyval(p,x);
    y2 = exp(sh2);
    
 
% �ɼ������ַ�ʽ���õ��Ľ����ͬ
subplot(1,2,1)
plot(x,y,'o',x1,y1,'-')
subplot(1,2,2)
plot(x,y,'o',x,y2,'-')