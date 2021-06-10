%% 模型参数
Fs = 100;             % Sampling frequency
T = 1/ Fs;            % Sampling period
L = 11100;            % Length of signal
t = (0:L-1)*T;        % Time vector
N0 = 820;             % 取前N0个数据点
MODEL_NAME = "TIT10_CJY_COMPARISON";
%% 仿真
datasource = load("data/record20170228.mat").AccEW(:, 1);
loadWaveData(datasource);
createNewModel(MODEL_NAME);
initialization(MODEL_NAME);

% 工况
set_param(MODEL_NAME + "/Damper1_damper", 'D', '1');
set_param(MODEL_NAME + "/Damper2_damper", 'D', '1');
set_param(MODEL_NAME + "/Damper3_damper", 'D', '1');
% set_param(MODEL_NAME + "/Spring1", 'spr_rate', '147669491');
% set_param(MODEL_NAME + "/Spring2", 'spr_rate', '373944586');
% set_param(MODEL_NAME + "/Spring3", 'spr_rate', '292631834');

sim(MODEL_NAME);

scopeData = {Scope1, Scope2, Scope3, Scope4, Scope5, Scope6, Scope7};
save ('data/ScopeData.mat','scopeData');
scopeData = struct2cell(load('data/ScopeData.mat'));
Acc_simulation = zeros(11100, 7);
for i = 1:7
    tmp = scopeData{1}{i};
    Acc_simulation(:, i) = tmp{3}.Values.data(1:11100, 1);
end
%% 将实测数据和仿真数据对比
data = load('data/record20170228.mat');
wavedata = load('data/170228EW.txt');
dataEW = data.AccEW;
Acc_4_real = dataEW(:, 2);
Acc_6_real = dataEW(:, 3);
Acc_8_real = dataEW(:, 4);
% 数据1是仿真数据，数据2是实际数据
timeseries_4 = timeseries([Acc_simulation(:, 2) Acc_4_real], t.');
timeseries_6 = timeseries([Acc_simulation(:, 4) Acc_6_real], t.');
timeseries_8 = timeseries([Acc_simulation(:, 6) Acc_8_real], t.');

figure(1);
subplot(2, 2, 1);
plot(timeseries_4);
title('第4层加速度对比图', 'FontSize', 15);
ylabel('加速度 m*s-2', 'FontSize', 15);
set(gca, 'FontSize', 20);
legend('仿真数据','实测数据', 'FontSize',16);
axis([0 120 -50 50]);

subplot(2, 2, 2);
plot(timeseries_6);
title('第6层加速度对比图', 'FontSize', 15);
ylabel('加速度 m*s-2', 'FontSize', 15);
set(gca, 'FontSize', 20);
legend('仿真数据','实测数据', 'FontSize',16);
axis([0 120 -50 50]);

subplot(2, 2, 3);
plot(timeseries_8);
title('第8层加速度对比图', 'FontSize', 15);
ylabel('加速度 m*s-2', 'FontSize', 15);
set(gca, 'FontSize', 20);
legend('仿真数据','实测数据', 'FontSize',16);
axis([0 120 -50 50]);
%% 仿真的频域响应
figure(2);
f = Fs*(0:(L/2))/L;

i = 2;
subplot(2, 2, 1);
fft_value = fft(Acc_simulation(:, i));
P2 = abs(fft_value/L); %取实部除以数据长度L
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
plot(f(:, 1:555),P1(1:555, :));
set(gca, 'FontSize', 15);
title((i+2) + "层加速度响应的单边频谱");
xlabel('f (Hz)');
ylabel('|P1(f)|');
set(gca, 'FontSize', 20);
axis([0 5 0 2.5])

i = 4;
subplot(2, 2, 2);
fft_value = fft(Acc_simulation(:, i));
P2 = abs(fft_value/L); %取实部除以数据长度L
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
plot(f(:, 1:555),P1(1:555, :));
set(gca, 'FontSize', 15);
title((i+2) + "层加速度响应的单边频谱");
xlabel('f (Hz)');
ylabel('|P1(f)|');
set(gca, 'FontSize', 20);
axis([0 5 0 3.5])

i = 6;
subplot(2, 2, 3);
fft_value = fft(Acc_simulation(:, i));
P2 = abs(fft_value/L); %取实部除以数据长度L
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
plot(f(:, 1:555),P1(1:555, :));
set(gca, 'FontSize', 15);
title((i+2) + "层加速度响应的单边频谱");
xlabel('f (Hz)');
ylabel('|P1(f)|');
set(gca, 'FontSize', 20);
axis([0 5 0 5])
%% 实际的频域响应
figure(3);
subplot(2, 2, 1);
fft_value = fft(Acc_4_real);
P2 = abs(fft_value/L); %取实部除以数据长度L
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
plot(f(:, 1:555),P1(1:555, :));
set(gca, 'FontSize', 15);
title("4层加速度响应的单边频谱");
xlabel('f (Hz)');
ylabel('|P1(f)|');
set(gca, 'FontSize', 20);
axis([0 5 0 2.5])

subplot(2, 2, 2);
fft_value = fft(Acc_6_real);
P2 = abs(fft_value/L); %取实部除以数据长度L
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
plot(f(:, 1:555),P1(1:555, :));
set(gca, 'FontSize', 15);
title("6层加速度响应的单边频谱");
xlabel('f (Hz)');
ylabel('|P1(f)|');
set(gca, 'FontSize', 20);
axis([0 5 0 3.5])

subplot(2, 2, 3);
fft_value = fft(Acc_8_real);
P2 = abs(fft_value/L); %取实部除以数据长度L
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
plot(f(:, 1:555),P1(1:555, :));
set(gca, 'FontSize', 15);
title("8层加速度响应的单边频谱");
xlabel('f (Hz)');
ylabel('|P1(f)|');
set(gca, 'FontSize', 20);
axis([0 5 0 5])


save_system(MODEL_NAME);
close_system(MODEL_NAME);