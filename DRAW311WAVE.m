data = load("data/record20170228.mat").AccEW(:, 1);
Acc_4_real = load("data/record20170228.mat").AccEW(:, 2);
Acc_6_real = load("data/record20170228.mat").AccEW(:, 3);
Acc_8_real = load("data/record20170228.mat").AccEW(:, 4);
wavedata = load('data/170228EW.txt');
t = (0:11100-1)*0.01;        % Time vector

figure(1);
plot(t, wavedata);
set(gca,'FontSize',25)%%甚至坐标轴刻度的大小
xlabel("时间/s");%%设置坐标轴名称的字体大小
ylabel("加速度/m·s-2");
% sgtitle('311地震东西向地震波形时域图','FontSize',30);
% 
% figure(2);
% subplot(2, 2, 1);
% plot(timeseries_4);
% title('第4层加速度对比图');
% ylabel('加速度 m*s-2');
% legend('仿真数据','实测数据');
% set(gca,'FontName','Times New Roman','FontSize',25)%%甚至坐标轴刻度的大小
% 
% subplot(2, 2, 2);
% plot(timeseries_6);
% title('第6层加速度对比图');
% ylabel('加速度 m*s-2');
% legend('仿真数据','实测数据');
% set(gca,'FontName','Times New Roman','FontSize',25)%%甚至坐标轴刻度的大小
% 
% subplot(2, 2, 3);
% plot(timeseries_8);
% title('第8层加速度对比图');
% ylabel('加速度 m*s-2');
% legend('仿真数据','实测数据');
% set(gca,'FontName','Times New Roman','FontSize',25)%%甚至坐标轴刻度的大小