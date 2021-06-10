%% ��������
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
%% ��������
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
%% ģ������
MODEL_NAME = "TIT10_CJY";
%% ģ�Ͳ���
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
%% �������ݼ��ĸ��๤��
% һЩ�ٶ���
% 1. ���������ڸն��ƻ������Ѿ������ն��ƻ��ĵط��������ض��ƻ���
% 2. ����������һ���ƻ�
% 3. ���ǲ����ĸ߲㣨3�����ϣ��ƻ����������һ������Ϊ�߲��ƻ��ĸ��ʽ�С����һ����߲���ƻ��ڴ��ݺ������޷������Ա���������Ԥ��

% ��ʽ��"��������", "��Ӱ������", �ۼ�ϵ��
CONDITIONS = {
    % ԭʼ���
    "0-original-Loss", "", 0; 
    % 1��������C���޸ն��ƻ�
    "C-P1-Loss", ["/Damper1_damper", "/Spring1_damper"], 1;
    % 1,2��������C�ƻ����޸ն��ƻ�
    "C-P2-Loss", ["/Damper1_damper", "/Spring1_damper", "/Damper2_damper", "/Spring2_damper"], 1;
    % 1,2,3��������C�ƻ����޸ն��ƻ�
    "C-P3-Loss", ["/Damper1_damper", "/Spring1_damper", "/Damper2_damper", "/Spring2_damper", "/Damper3_damper", "/Spring3_damper"], 1;

    % 1���������ƻ���1��ն��ƻ�
    "KC-P1-0.1-Loss", ["/Spring1"], [0.1];
    "KC-P1-0.2-Loss", ["/Spring1"], [0.2];
    % 1,2��������C�ƻ���1,2��ն��ƻ�
    "KC-P2-0.2 0.1-Loss", ["/Spring1", "/Spring2"], [0.2 0.1];
    "KC-P2-0.4 0.2-Loss", ["/Spring1", "/Spring2"], [0.4 0.2];
    % 1,2,3��������C�ƻ���1,2,3��ն��ƻ�
    "KC-P3-0.3 0.2 0.1-Loss", ["/Spring1", "/Spring2", "/Spring3"], [0.3 0.2 0.1];
    "KC-P3-0.6 0.4 0.2-Loss", ["/Spring1", "/Spring2", "/Spring3"], [0.6 0.4 0.2];
    };
%% ����ģ��
for j = 1:length(DATA_NAME)
    currentDataName = DATA_NAME{j, 1};
    currentDataSource = DATA_SOURCE{j, 1};
    mkdir("data/TrainingDataset-" + currentDataName);
    loadWaveData(currentDataSource);
    createNewModel(MODEL_NAME);
    initialization(MODEL_NAME);
    
    disp("Now doing " + currentDataName);
    
    %% ��ͬ�������з��棬�õ����ݺ������������ݱ���
    for i = 1:length(CONDITIONS(:, 1))
        currentName = CONDITIONS{i, 1}{1};
        components = CONDITIONS{i, 2};
        loss = CONDITIONS{i, 3};
        splitName = strsplit(currentName, '-');
        if components ~= ""
    %% ���������͸ն�һͬ�ƻ�
            if splitName{1} == "KC"
              %% �Ȱ�C�ƻ��Ĳ��ָ㶨
                % ��Condition����P��ͬ��C�ƻ�
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
                        % ����ϵ���������0
                        set_param(MODEL_NAME + cur_compo, 'spr_rate', '1');
                    end
                end
              %% ��дK�ƻ�  
                for k = 1:length(components(1, :))
                    cur_compo = components(1, k);
                    cur_loss = loss(1, k);
                    set_param(MODEL_NAME + cur_compo, 'spr_rate', num2str((1-cur_loss) * PARAMETERS(cur_compo)));
                end
            end
    %% ���������ƻ�
            if splitName{1} == "C"
                for k = 1:length(components(1, :))
                    cur_compo = components(1, k);
                    if cur_compo{1}(1, 2) == "D"
                        set_param(MODEL_NAME + cur_compo, 'D', '1');
                    else
                        % ����ϵ���������0
                        set_param(MODEL_NAME + cur_compo, 'spr_rate', '1');
                    end
                end
            end
        end
        sim(MODEL_NAME);
        scopeData = {Scope1, Scope2, Scope3, Scope4, Scope5, Scope6, Scope7};
        save ('data/ScopeData.mat','scopeData');
        
        % �粻��ͼ���ڶ�����Ϊ0��������Ϊi
        toTF(currentName, i, currentDataName);
        initialization(MODEL_NAME);
    end
end

save_system(MODEL_NAME);
close_system(MODEL_NAME);
disp("All Done");