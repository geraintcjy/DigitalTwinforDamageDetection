function initialization(modelname)
    % Set model parameters
    % 楼层质量
    set_param(modelname + '/M1', 'Mass', '439675.80');
    set_param(modelname + '/M2', 'Mass', '341837.00');
    set_param(modelname + '/M3', 'Mass', '329122.40');
    set_param(modelname + '/M4', 'Mass', '325982.40');
    set_param(modelname + '/M5', 'Mass', '319381.40');
    set_param(modelname + '/M6', 'Mass', '316817.40');
    set_param(modelname + '/M7', 'Mass', '306084.00');

    % 层间刚度
    set_param(modelname + '/Spring1', 'spr_rate', '155441570');
    set_param(modelname + '/Spring2', 'spr_rate', '393625880');
    set_param(modelname + '/Spring3', 'spr_rate', '308033510');
    set_param(modelname + '/Spring4', 'spr_rate', '275713750');
    set_param(modelname + '/Spring5', 'spr_rate', '268593380');
    set_param(modelname + '/Spring6', 'spr_rate', '255232260');
    set_param(modelname + '/Spring7', 'spr_rate', '230414750');

    % 结构瑞利阻尼
    % disp(get_param(modelname + '/Damper1', 'ObjectParameters'));
    set_param(modelname + '/Damper1', 'D', '356600');
    set_param(modelname + '/Damper2', 'D', '737100');
    set_param(modelname + '/Damper3', 'D', '624000');
    set_param(modelname + '/Damper4', 'D', '515700');
    set_param(modelname + '/Damper5', 'D', '550200');
    set_param(modelname + '/Damper6', 'D', '476500');
    set_param(modelname + '/Damper7', 'D', '478800');

    % 阻尼器的刚度，每层4个，参考阻尼器的线性模型参数
    set_param(modelname + '/Spring1_damper', 'spr_rate', '7680000');
    set_param(modelname + '/Spring2_damper', 'spr_rate', '7200000');
    set_param(modelname + '/Spring3_damper', 'spr_rate', '7200000');
    set_param(modelname + '/Spring4_damper', 'spr_rate', '7200000');
    set_param(modelname + '/Spring5_damper', 'spr_rate', '7200000');
    set_param(modelname + '/Spring6_damper', 'spr_rate', '7200000');
    set_param(modelname + '/Spring7_damper', 'spr_rate', '7200000');

    % 阻尼器的阻尼
    set_param(modelname + '/Damper1_damper', 'D', '1480000');
    set_param(modelname + '/Damper2_damper', 'D', '640000');
    set_param(modelname + '/Damper3_damper', 'D', '640000');
    set_param(modelname + '/Damper4_damper', 'D', '640000');
    set_param(modelname + '/Damper5_damper', 'D', '640000');
    set_param(modelname + '/Damper6_damper', 'D', '640000');
    set_param(modelname + '/Damper7_damper', 'D', '640000');
end