% 将得到的传递函数数据集导入为Matlab变量
%% 每个传递函数数据集仅取0-5Hz部分
% 取前N0个数据点，每n个数据进行取平均处理，减小数据量
N0 = 52;
n = 1;
folderNames = {dir("data").name};

all_tf = zeros([], 6*N0/n);
all_label = zeros([], 1);
C_tf = zeros([], 6*N0/n);
K_tf = zeros([], 6*N0/n);

C_tf_value = zeros([], 7);
C_tf_pattern = zeros([], 3);
K_tf_value = zeros([], 3);

all_count = 0;
C_count = 0;
K_count = 0;
%% 获取每个数据集文件夹的数据
for i = 1:length(folderNames)
    if length(folderNames{i}) < 16
        continue
    end
    if folderNames{i}(1:8) ~= "Training"
        continue
    end
    datasets = dir(fullfile("data/" + folderNames{i}, '*.mat'));
    dataNames = {datasets.name}.';
    
    for j = 1:length(dataNames(:, 1))
        currentName = dataNames(j, 1);
        splitName = strsplit(currentName{1}, '-');
        if currentName == "f.mat"
            continue;
        end

        if splitName{2}== "C" || splitName{2}== "KC"
            load("data/" + folderNames{i} + "/" + currentName);
            all_count = all_count + 1;
            tf = abs(tf(: , 1: N0));
            % 对每一行进行归一化处理 https://www.mathworks.com/help/matlab/ref/double.normalize.html#d123e907681
            tf = normalize(tf, 2, 'zscore');

            tf_truncated = zeros(6, N0 / n);
            for k = 1:(N0/n)
                tmp = mean(tf(:, n*(k-1)+1 : n*k), 2);
                tf_truncated(:, k) = tmp;
            end
            
            all_tf(all_count, :) = reshape(tf_truncated, 1, []); % 每行为一类工况
            
            index = str2double(splitName{3}(1, 2));
            if splitName{2}== "C"
                C_count = C_count+1;
                C_tf(C_count, :) = reshape(tf_truncated, 1, []).';
                
                % 用向量表示每种工况
                tmp_label = zeros(1, 7);
                for t = 1:index
                    tmp_label(1, t) = 1;
                end
                C_tf_value(C_count, :) = tmp_label;
                
                % 用类别表示每种工况（只坏一层为10， 坏12为010，坏123为001）
                C_tf_pattern(C_count, index) = 1;
                
                all_label(all_count, 1) = 0;
            else
                K_count = K_count+1;
                K_tf(K_count, :) = reshape(tf_truncated, 1, []).';
                
                tmp_label = zeros(1, 3);
                value = str2num(splitName{4}); % 可能是单个数，也可能是个向量
                if isscalar(value)
                    tmp_label(1, 1) = value;
                else
                    for t = 1:length(value)
                        tmp_label(1, t) = value(1, t);
                    end
                end
                K_tf_value(K_count, :) = tmp_label;
                all_label(all_count, 1) = 1;
            end
        end
    end
end

%% 一起保存
save('data/CNNDataset/all_tf.mat', 'all_tf');
save('data/CNNDataset/all_label.mat', 'all_label');
save("data/CNNDataset/C_tf.mat", 'C_tf');
save("data/CNNDataset/C_tf_pattern.mat", 'C_tf_pattern');
save("data/CNNDataset/K_tf.mat", 'K_tf');
save("data/CNNDataset/K_tf_value.mat", 'K_tf_value');
%% 分开保存训练和测试
% all_label_test = all_label(276: 315, :);
% all_tf_test = all_tf(276: 315, :);
% all_label = all_label(1: 275, :);
% all_tf = all_tf(1: 275, :);
% 
% C_tf_pattern_test = C_tf_pattern(86: 105, :);
% C_tf_test = C_tf(86: 105, :);
% C_tf_pattern = C_tf_pattern(1: 85, :);
% C_tf = C_tf(1: 85, :);
% 
% K_tf_value_test = K_tf_value(171: 210, :);
% K_tf_test = K_tf(171: 210, :);
% K_tf_value = K_tf_value(1: 170, :);
% K_tf = K_tf(1: 170, :);
% 
% save('data/CNNDataset/all_tf.mat', 'all_tf');
% save('data/CNNDataset/all_label.mat', 'all_label');
% save("data/CNNDataset/C_tf.mat", 'C_tf');
% save("data/CNNDataset/C_tf_pattern.mat", 'C_tf_pattern');
% save("data/CNNDataset/K_tf.mat", 'K_tf');
% save("data/CNNDataset/K_tf_value.mat", 'K_tf_value');
% 
% save('data/CNNDataset/all_tf_test.mat', 'all_tf_test');
% save('data/CNNDataset/all_label_test.mat', 'all_label_test');
% save("data/CNNDataset/C_tf_test.mat", 'C_tf_test');
% save("data/CNNDataset/C_tf_pattern_test.mat", 'C_tf_pattern_test');
% save("data/CNNDataset/K_tf_test.mat", 'K_tf_test');
% save("data/CNNDataset/K_tf_value_test.mat", 'K_tf_value_test');

disp("All Done");