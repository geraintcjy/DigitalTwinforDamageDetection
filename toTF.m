function toTF(simulation_type, plot_number, earthquake_name) 
% �ѻ�õ�����ת��Ϊ��䴫�ݺ���
% �������������ģ������ͣ��Լ��Ƿ��ͼ������ͼ����plot_number = 0��������������ͼ��
%% ģ�Ͳ���
    Fs = 100;             % Sampling frequency
    T = 1/ Fs;            % Sampling period
    L = 11100;            % Length of signal
    t = (0:L-1)*T;        % Time vector
    N0 = 820;             % ȡǰN0�����ݵ�
%% ��������
    scopeData = struct2cell(load('data/ScopeData.mat'));
    Acc_simulation = zeros(11100, 7);
    for i = 1:7
        tmp = scopeData{1}{i};
        Acc_simulation(:, i) = tmp{3}.Values.data(1:11100, 1);
    end
%% ���ݺ�������
    if plot_number ~= 0
        figure(plot_number);
    end
    tf = [];
    for i = 1:7
%   ����ȡ���ڲ��䴫���ʺ���
        if (i == 7)
            continue;
        end
        j = i+1;
        [tf(:, i), f] = tfestimate(Acc_simulation(:, i), Acc_simulation(:, j), hann(60), 30, 1024, Fs); 
        
        N0 = 52;
%         if (i==1)
%             figure(55);
%             plot(f(1:N0, 1), abs(tf((1:N0), i)), 'color', '#000034');
%             set(gca,'FontName','Times New Roman','FontSize',25);
%             ylabel("T",'FontSize',25);
%             xlabel('f (Hz)', 'FontName','Times New Roman','FontSize',25);
%             grid on;
%         end

        % [tf(:, i), f] = tfestimate(Acc_simulation(:, i), Acc_simulation(:, j), kaiser(11100,15), [], 16384, Fs); 
        % [tf(:, i), f] = tfestimate(Acc_simulation(:, i), Acc_simulation(:, j), rectwin(11100), 0, 16384, Fs); 
        % ��ͼ����
        if plot_number ~= 0
            subplot(6, 1, i);
            plot(f(1:N0, 1), abs(tf((1:N0), i)));
            % title("T" + j + i);
            ylabel("T" + j + i);
            if i == 6
                xlabel('f (Hz)');
            end
            set(gca,'FontSize',20);
            grid on;
        end

%   ��ȡÿ���䴫���ʺ���
%         for j = i:7
%             if (i == j)
%                 continue;
%             end
%             [tf(i, j, :), f] = tfestimate(Acc_simulation(:, i), Acc_simulation(:, j), 50, 25, 11100, Fs); 
%             if plot_number ~= 0
%                 subplot(7, 7, 7*(i-1)+j);
%                 plot(f, reshape(abs(tf(i, j, :)), size(f)));
%                 title("T" + j + i);
%                 ylabel("T");
%                 xlabel('f (Hz)');
%             end
%         end
    end
    if plot_number ~= 0
        sgtitle(simulation_type,'FontSize', 20);
    end
    
    tf = tf.';
    tf = tf(:, 1: N0);
    f = f.';
    f = f(:, 1: N0);
    if earthquake_name ~= "0-original-Loss"
        save("data/TrainingDataset-" + earthquake_name + "/tf-" + simulation_type + ".mat", 'tf');
        % save("data/TrainingDataset-" + earthquake_name + "/f.mat", 'f');
    end
%% ��ʵ�����ݺͷ������ݶԱ�
%     data = load('data/record20170228.mat');
%     wavedata = load('data/170228EW.txt');
%     dataEW = data.AccEW;
%     Acc_4_real = dataEW(:, 2);
%     Acc_6_real = dataEW(:, 3);
%     Acc_8_real = dataEW(:, 4);
%     % ����1�Ƿ������ݣ�����2��ʵ������
%     timeseries_4 = timeseries([Acc_simulation(:, 2) Acc_4_real], t.');
%     timeseries_6 = timeseries([Acc_simulation(:, 4) Acc_6_real], t.');
%     timeseries_8 = timeseries([Acc_simulation(:, 6) Acc_8_real], t.');
% 
%     figure(1);
%     subplot(2, 2, 1);
%     plot(timeseries_4);
%     title('��4����ٶȶԱ�ͼ');
%     ylabel('���ٶ� m*s-2');
%     legend('��������','ʵ������');
% 
%     subplot(2, 2, 2);
%     plot(timeseries_6);
%     title('��6����ٶȶԱ�ͼ');
%     ylabel('���ٶ� m*s-2');
%     legend('��������','ʵ������');
% 
%     subplot(2, 2, 3);
%     plot(timeseries_8);
%     title('��8����ٶȶԱ�ͼ');
%     ylabel('���ٶ� m*s-2');
%     legend('��������','ʵ������');

    % figure(2);
%     f = Fs*(0:(L/2))/L;
%     P1_store = zeros(5551, 7);
%     
%     % ����Ƶ��
%     for i = 1:7
%         subplot(3, 3, i);
%         fft_value = fft(Acc_simulation(:, i));
%         P2 = abs(fft_value/L); %ȡʵ���������ݳ���L
%         P1 = P2(1:L/2+1);
%         P1(2:end-1) = 2*P1(2:end-1);
%         P1_store(:, i) = P1;
%         plot(f,P1);
%         title((i+2) + "����ٶ���Ӧ�ĵ���Ƶ��");
%         xlabel('f (Hz)');
%         ylabel('|P1(f)|');
%     end
%     
%     % �����ʺ���
%     figure(3);
%     for i = 1:6
%         T = P1_store(:, i) ./ P1_store(:, i+1);
%         subplot(3, 2, i);
%         plot(f, T);
%         title((i+2) + "-" + (i+3) + "�㴫���ʺ���");
%         xlabel('f (Hz)');
%         ylabel('T');
%     end
end
