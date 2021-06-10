%% 地震名称
% DATA_NAME = {
%     "record20170228NS";
%     "record20170228NS+0.5noise";
%     "record20170228NS+1noise";
%     "record20170228NS+1.5noise";
%     "record20170228NS+2noise";
%     "record20170228NS+2.5noise";
%     "record20170228NS+3noise";
%     "record20170228NS+3.5noise";
%     "record20170228NS+4noise";
%     "record20170228NS+4.5noise";
%     "record20170228NS+5noise";
%     "record20170228NS+5.5noise";
%     "record20170228NS+6noise";
%     "record20170228NS+6.5noise";
%     "record20170228NS+7noise";
%     "record20170228NS+7.5noise";
%     "record20170228NS+8noise";
%     "record20170228NS-2";
%     "record20170228NS-2+0.5noise";
%     "record20170228NS-2+1noise";
%     "record20170228NS-2+1.5noise";
%     "record20170228NS-2+2noise";
%     "record20170228NS-2+2.5noise";
%     "record20170228NS-2+3noise";
%     "record20170228NS-2+3.5noise";
%     "record20170228NS-2+4noise";
%     "record20170228NS-2+4.5noise";
%     "record20170228NS-2+5noise";
%     "record20170228NS-2+5.5noise";
%     "record20170228NS-2+6noise";
%     "record20170228NS-2+6.5noise";
%     "record20170228NS-2+7noise";
%     "record20170228NS-2+7.5noise";
%     "record20170228NS-2+8noise";
%     };

DATA_NAME = {
    "recordNS";
    };
%% 地震数据
% ORIGINAL_NS_1 = load("data/record20170228.mat").AccNS(:, 1);
% ORIGINAL_NS_2 = load("data/record20170228.mat").AccNS(:, 2);
% DATA_SOURCE = {
%     ORIGINAL_NS_1;
%     ORIGINAL_NS_1 + 1*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 2*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 3*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 4*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 5*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 6*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 7*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 8*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 9*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 10*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 11*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 12*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 13*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 14*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 15*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_1 + 16*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2;
%     ORIGINAL_NS_2 + 1*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 2*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 3*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 4*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 5*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 6*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 7*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 8*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 9*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 10*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 11*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 12*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 13*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 14*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 15*(rand(11100, 1) - 0.5);
%     ORIGINAL_NS_2 + 16*(rand(11100, 1) - 0.5);
%     };

% DATA_SOURCE = 40*(rand(11100, 1) - 1);

% Kern County
% DATA_SOURCE = reshape(load("data/KernCounty.AT2"), 1, []);
% DATA_SOURCE = 9.8 * DATA_SOURCE(1, 1:11100);
% DATA_SOURCE = reshape(load("data/KernCounty-2.AT2"), 1, []);
% DATA_SOURCE = 9.8 * DATA_SOURCE(1, 1:11100);

% Arcadia
% DATA_SOURCE = reshape(load("data/Arcadia.AT2"), 1, []);
% DATA_SOURCE = 9.8 * DATA_SOURCE(1, 1:11100);
% DATA_SOURCE = reshape(load("data/Arcadia-2.AT2"), 1, []);
% DATA_SOURCE = 9.8 * DATA_SOURCE(1, 1:11100);

DATA_SOURCE = {
    load("data/record20170228.mat").AccEW(:, 1);
    };
%% 模型名称
MODEL_NAME = "TIT10_CJY";
%% 模型参数
PARAMETERS = containers.Map( ...
["/M1", "/M2", "/M3", "/M4", "/M5", "/M6", "/M7", ...
    "/Spring1", "/Spring2", "/Spring3", "/Spring4", "/Spring5", "/Spring6", "/Spring7", ...
    "/Damper1", "/Damper2", "/Damper3", "/Damper4", "/Damper5", "/Damper6", "/Damper7", ...
    "/Spring1_damper", "/Spring2_damper", "/Spring3_damper", "/Spring4_damper", "/Spring5_damper", "/Spring6_damper", "/Spring7_damper", ...
    "/Damper1_damper", "/Damper2_damper", "/Damper3_damper", "/Damper4_damper", "/Damper5_damper", "/Damper6_damper", "/Damper7_damper"], ...
{439675.80, 341837.00, 329122.40, 325982.40, 319381.40, 316817.40, 306084.00, ...
    155441570, 393625880, 308033510, 275713750, 268593380, 255232260, 230414750, ...
    356600, 737100, 624000, 515700, 550200, 476500, 478800, ...
    7680000, 7200000, 7200000, 7200000, 7200000, 7200000, 7200000, ...
    1480000, 640000, 640000, 640000, 640000, 640000, 640000});
%% 生成数据集的各类工况
% 一些假定：
% 1. 阻尼器先于刚度破坏（即已经发生刚度破坏的地方阻尼器必定破坏）
% 2. 整层阻尼器一起破坏
% 3. 我们不关心高层（3层以上）破坏的情况，这一方面因为高层破坏的概率较小，另一方面高层的破坏在传递函数上无法有明显表达，难以做出预测

% 格式："工况名称", "受影响的组件", 折减系数
CONDITIONS = {
    % 原始情况
    "0-original-Loss", "", 0; 
    % 1层阻尼器C，无刚度破坏
    "C-P1-Loss", ["/Damper1_damper", "/Spring1_damper"], 1;
    % 1,2层阻尼器C破坏，无刚度破坏
    "C-P2-Loss", ["/Damper1_damper", "/Spring1_damper", "/Damper2_damper", "/Spring2_damper"], 1;
    % 1,2,3层阻尼器C破坏，无刚度破坏
    "C-P3-Loss", ["/Damper1_damper", "/Spring1_damper", "/Damper2_damper", "/Spring2_damper", "/Damper3_damper", "/Spring3_damper"], 1;

    % 1层阻尼器破坏，1层刚度破坏
    "KC-P1-0.1-Loss", ["/Spring1"], [0.1];
    "KC-P1-0.2-Loss", ["/Spring1"], [0.2];
    % 1,2层阻尼器C破坏，1,2层刚度破坏
    "KC-P2-0.2 0.1-Loss", ["/Spring1", "/Spring2"], [0.2 0.1];
    "KC-P2-0.4 0.2-Loss", ["/Spring1", "/Spring2"], [0.4 0.2];
    % 1,2,3层阻尼器C破坏，1,2,3层刚度破坏
    "KC-P3-0.3 0.2 0.1-Loss", ["/Spring1", "/Spring2", "/Spring3"], [0.3 0.2 0.1];
    "KC-P3-0.6 0.4 0.2-Loss", ["/Spring1", "/Spring2", "/Spring3"], [0.6 0.4 0.2];
    };
%% 创建模型
for j = 1:length(DATA_NAME)
    currentDataName = DATA_NAME{j, 1};
    currentDataSource = DATA_SOURCE{j, 1};
    mkdir("data/TrainingDataset-" + currentDataName);
    loadWaveData(currentDataSource);
    createNewModel(MODEL_NAME);
    initialization(MODEL_NAME);
    
    disp("Now doing " + currentDataName);
    
    %% 不同工况进行仿真，得到传递函数，并将数据保存
    for i = 1:length(CONDITIONS(:, 1))
        currentName = CONDITIONS{i, 1}{1};
        components = CONDITIONS{i, 2};
        loss = CONDITIONS{i, 3};
        splitName = strsplit(currentName, '-');
        if components ~= ""
    %% 当阻尼器和刚度一同破坏
            if splitName{1} == "KC"
              %% 先把C破坏的部分搞定
                % 在Condition里找P相同的C破坏
                C_position = 0;
                for k = 1:length(CONDITIONS(:, 1))
                    tmp_splitName = strsplit(CONDITIONS{k, 1}{1}, '-');
                    if tmp_splitName{1} == "C" && tmp_splitName{2}(1, 2) == splitName{2}(1, 2)
                        C_position = k;
                        break
                    end
                end
                
                C_components = CONDITIONS{C_position, 2};
                
                for k = 1:length(C_components(1, :))
                    cur_compo = C_components(1, k);
                    if cur_compo{1}(1, 2) == "D"
                        set_param(MODEL_NAME + cur_compo, 'D', '1');
                    else
                        % 弹簧系数必须大于0
                        set_param(MODEL_NAME + cur_compo, 'spr_rate', '1');
                    end
                end
              %% 再写K破坏  
                for k = 1:length(components(1, :))
                    cur_compo = components(1, k);
                    cur_loss = loss(1, k);
                    set_param(MODEL_NAME + cur_compo, 'spr_rate', num2str((1-cur_loss) * PARAMETERS(cur_compo)));
                end
            end
    %% 仅阻尼器破坏
            if splitName{1} == "C"
                for k = 1:length(components(1, :))
                    cur_compo = components(1, k);
                    if cur_compo{1}(1, 2) == "D"
                        set_param(MODEL_NAME + cur_compo, 'D', '1');
                    else
                        % 弹簧系数必须大于0
                        set_param(MODEL_NAME + cur_compo, 'spr_rate', '1');
                    end
                end
            end
        end
        sim(MODEL_NAME);
        scopeData = {Scope1, Scope2, Scope3, Scope4, Scope5, Scope6, Scope7};
        save ('data/ScopeData.mat','scopeData');
        
        % 如不画图，第二个设为0，否则设为i
        toTF(currentName, i, currentDataName);
        initialization(MODEL_NAME);
    end
end

save_system(MODEL_NAME);
close_system(MODEL_NAME);
disp("All Done");