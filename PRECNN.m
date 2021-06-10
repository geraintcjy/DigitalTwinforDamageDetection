% 将得到的传递函数数据集导入为Matlab变量
%% 每个传递函数数据集仅取0-5Hz部分
% 取前N0个数据点
N0 = 52;
folderNames = {dir("data").name};

% CNN训练需要4D数据，高*宽*频道数*数据个数
all_tf = zeros(6, N0, 1, []);
all_label = zeros([], 2);% 分2类
C_tf = zeros(6, N0, 1, []);
K_tf = zeros(6, N0, 1, []);

% C_tf_value = zeros([], 7);
C_tf_pattern = zeros([], 3); %分3类
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
            % tf = normalize(tf, 2, 'zscore');
            all_tf(:, :, 1, all_count) = tf;
            
            index = str2double(splitName{3}(1, 2));
            if splitName{2}== "C"
                C_count = C_count+1;
                C_tf(:, :, 1, C_count) = tf;
                % 用类别表示每种工况（只坏一层为100， 坏12为010，坏123为001）
                C_tf_pattern(C_count, index) = 1;
                
                all_label(all_count, 1) = 1;
            else
                K_count = K_count+1;
                K_tf(:, :, 1, K_count) = tf;
                
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
                all_label(all_count, 2) = 1;
            end
        end
    end
end

all_tf_test = all_tf(:, :, :, 1:46);
all_tf_validation = all_tf(:, :, :, 47:92);
all_label_test = all_label(1:46, :);
all_label_validation = all_label(47:92, :);
all_tf = all_tf(:, :, :, 93:306);
all_label = all_label(93:306, :);

C_tf_test = C_tf(:, :, :, 1:15);
C_tf_validation = C_tf(:, :, :, 16:30);
C_tf_pattern_test = C_tf_pattern(1:15, :);
C_tf_pattern_validation = C_tf_pattern(16:30, :);
C_tf = C_tf(:, :, :, 31:102);
C_tf_pattern = C_tf_pattern(31:102, :);

K_tf_test = K_tf(:, :, :, 1:31);
K_tf_validation = K_tf(:, :, :, 32:62);
K_tf_value_test = K_tf_value(1: 31, :);
K_tf_value_validation = K_tf_value(32: 62, :);
K_tf = K_tf(:, :, :, 63:204);
K_tf_value = K_tf_value(63: 204, :);

disp('All Done');