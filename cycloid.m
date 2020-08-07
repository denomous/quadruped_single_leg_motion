clear;

lamda = 0.5;%�ڶ�����ռ��
Ts = 1;%����ʱ��
xs = 0;%x����ʼ��
xf = 30;%x���յ�
h = 20;%̧�ȸ߶�
zs = -50;%z�����

x=[];z=[];
x_last=0;z_last=0;t_last=0;

for t=0:0.01:Ts
    if(t>=0 && t<=lamda*Ts)
        sigma = 2*pi*t/(lamda*Ts);
        x_t = (xf-xs)*((sigma-sin(sigma))/(2*pi))+xs;
        %y_t = (yf-ys)*((sigma-sin(singma))/(2*pi))+ys;
        z_t = h*(1-cos(sigma))/2+zs;
        x = [x,x_t];
        z = [z,z_t];
    elseif(t>lamda*Ts && t<Ts)
        x_t = x_last-(x_last-xs)/((Ts-t)/(t-t_last));
        z_t = z_last;
        x = [x,x_t];
        z = [z,z_t];
    end
    x_last = x_t;
    z_last = z_t;
    t_last = t;
end

plot(x,z);