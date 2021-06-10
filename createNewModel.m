function createNewModel(modelname) 
% createNewModel Create a new, empty Simulink model
%    createNewModel('MODELNAME') creates a new model with
%    the name 'MODELNAME'. Without the 'MODELNAME'
%    argument, the new model is named 'defualt'.

%% Create the model
if nargin == 0 
     modelname = 'default';
end 
if exist(modelname + ".slx", 'file')
   open_system(modelname);
   return
end

% create and open the model
open_system(new_system(modelname));

% set default screen color
% set_param(modelname,'ScreenColor','blue');
% set default solver
set_param(modelname, 'Solver', 'daessc', 'StopTime', '111', 'ReturnWorkspaceOutputs', 'off');
% disp(get_param(modelname, 'ObjectParameters'));
%% Model Configurations
add_block('nesl_utility/Solver Configuration', modelname + '/SC' , 'MakeNameUnique', 'on');
set_param(gcb, 'position', [-120, 80, -60, 110]);
SC_ph = get_param(modelname + '/SC', 'PortHandles');

add_block('fl_lib/Mechanical/Translational Elements/Mechanical Translational Reference', modelname + '/TR1' , 'MakeNameUnique', 'on');
set_param(gcb, 'position', [-200, 30, -170, 60], 'Orientation', 'left');
TR1_ph = get_param(modelname + '/TR1', 'PortHandles');

add_block('fl_lib/Mechanical/Mechanical Sources/Ideal Translational Velocity Source', modelname + '/VS' , 'MakeNameUnique', 'on');
set_param(gcb, 'position', [-20, 10, 20, 50], 'Orientation', 'left');
VS_ph = get_param(modelname + '/VS', 'PortHandles');

add_block('nesl_utility/Simulink-PS Converter', modelname + '/PS-SimulinkConverter', 'MakeNameUnique', 'on');
set_param(gcb, 'position', [-90, -20, -80, -10], 'Orientation', 'right');
set_param(gcb, 'Unit', 'm/s');
PSSConverter_ph = get_param(modelname + '/PS-SimulinkConverter', 'PortHandles');

add_block('simulink/Sources/Signal Editor', modelname + '/signalEditor' , 'MakeNameUnique', 'on');
set_param(gcb, 'position', [-270, -100, -210, -70], 'Orientation', 'right');
set_param(gcb, 'FileName', 'data/dataset.mat');
set_param(gcb, 'ActiveScenario', 'dataset', 'ActiveSignal', 'Acceleration Dataset', 'Unit', 'm/s^2', 'Interpolate', 'on');
set_param(gcb, 'SampleTime', '0.01');
signalEditor_ph = get_param(modelname + '/signalEditor', 'PortHandles');

add_block('simulink/Commonly Used Blocks/Integrator', modelname + '/integrator', 'MakeNameUnique', 'on');
set_param(gcb, 'position', [-170, -100, -140, -70], 'Orientation', 'right');
integrator_ph = get_param(modelname + '/integrator', 'PortHandles');

add_line(modelname, signalEditor_ph.Outport, integrator_ph.Inport);
add_line(modelname, integrator_ph.Outport, PSSConverter_ph.Inport);
add_line(modelname, PSSConverter_ph.RConn, VS_ph.RConn(1, 1));
add_line(modelname, VS_ph.RConn(1, 2), TR1_ph.LConn);

for i = 1:7
    x_offset = 320 * (i-1);
    %% 阻尼器阻尼
    add_block('fl_lib/Mechanical/Translational Elements/Translational Damper', modelname + '/Damper' + i + '_damper', 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [90 + x_offset, 110, 170 + x_offset, 130], 'Orientation', 'left');
    Damper_damper_ph = get_param(modelname + '/Damper' + i + '_damper', 'PortHandles');
    %% 阻尼器刚度
    add_block('fl_lib/Mechanical/Translational Elements/Translational Spring', modelname + '/Spring' + i + '_damper', 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [90 + x_offset, 160, 170 + x_offset, 180], 'Orientation', 'left');
    Spring_damper_ph = get_param(modelname + '/Spring' + i + '_damper', 'PortHandles');
    
    if i > 1
        add_line(modelname, Damper_damper_ph.RConn, Spring_ph.LConn);
    end
    %% 结构刚度
    add_block('fl_lib/Mechanical/Translational Elements/Translational Spring', modelname + '/Spring' + i, 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [90 + x_offset, 60, 170 + x_offset, 80], 'Orientation', 'left');
    Spring_ph = get_param(modelname + '/Spring' + i, 'PortHandles');
    %% 结构阻尼，取瑞利阻尼2%
    add_block('fl_lib/Mechanical/Translational Elements/Translational Damper', modelname + '/Damper' + i, 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [90 + x_offset, 10, 170 + x_offset, 30], 'Orientation', 'left');
    Damper_ph = get_param( modelname + '/Damper' + i, 'PortHandles');
    %% 楼层质量
    add_block('fl_lib/Mechanical/Translational Elements/Mass', modelname + '/M' + i, 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [210 + x_offset, 0, 280 + x_offset, 70], 'Orientation', 'right');
    M_ph = get_param(modelname + '/M' + i, 'PortHandles');
    %% 运动传感器
    add_block('fl_lib/Mechanical/Mechanical Sensors/Ideal Translational Motion Sensor', modelname + '/MS' + i, 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [210 + x_offset, 150, 250 + x_offset, 210], 'Orientation', 'right');
    MS_ph = get_param(modelname + '/MS' + i, 'PortHandles');
    %% 边界条件
    add_block('fl_lib/Mechanical/Translational Elements/Mechanical Translational Reference', modelname + '/TR' + (i+1), 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [280 + x_offset, 120, 310 + x_offset, 150], 'Orientation', 'right');
    TR_ph = get_param(modelname + '/TR' + (i+1), 'PortHandles');
    %% Converters and Gotos
    add_block('nesl_utility/PS-Simulink Converter', modelname + '/Converter' + i + '_1', 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [280 + x_offset, 170, 290 + x_offset, 180], 'Orientation', 'right');
    set_param(gcb, 'Unit', 'm/s');
    Converter_1_ph = get_param(modelname + '/Converter' + i + '_1', 'PortHandles');

    add_block('nesl_utility/PS-Simulink Converter', modelname + '/Converter' + i + '_2', 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [280 + x_offset, 230, 290 + x_offset, 240], 'Orientation', 'right');
    set_param(gcb, 'Unit', 'm');
    Converter_2_ph = get_param(modelname + '/Converter' + i + '_2', 'PortHandles');
    
    add_block('simulink/Signal Routing/Goto', modelname + '/Goto' + i + '_1', 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [310 + x_offset, 160, 340 + x_offset, 180], 'Orientation', 'right');
    set_param(gcb, 'GotoTag', "v" + i);
    Goto_1_ph = get_param(modelname + '/Goto' + i + '_1', 'PortHandles');
    
    add_block('simulink/Continuous/Derivative', modelname + '/derivative' + i, 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [310 + x_offset, 200, 340 + x_offset, 220], 'Orientation', 'right');
    derivative_ph = get_param(modelname + '/derivative' + i, 'PortHandles');
    
    add_block('simulink/Signal Routing/Goto', modelname + '/Goto' + i + '_2', 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [310 + x_offset, 240, 340 + x_offset, 260], 'Orientation', 'right');
    set_param(gcb, 'GotoTag', "p" + i);
    Goto_2_ph = get_param(modelname + '/Goto' + i + '_2', 'PortHandles');
    
    add_block('simulink/Signal Routing/Goto', modelname + '/Goto' + i + '_3', 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [360 + x_offset, 200, 390 + x_offset, 220], 'Orientation', 'right');
    set_param(gcb, 'GotoTag', "a" + i);
    Goto_3_ph = get_param(modelname + '/Goto' + i + '_3', 'PortHandles');
    %% Froms and Scopes
    add_block('simulink/Signal Routing/From', modelname + '/From' + i + '_1', 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [310 + x_offset, 280, 340 + x_offset, 300], 'Orientation', 'right');
    set_param(gcb, 'GotoTag', "v" + i);
    From_1_ph = get_param(modelname + '/From' + i + '_1', 'PortHandles');
    
    add_block('simulink/Signal Routing/From', modelname + '/From' + i + '_2', 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [310 + x_offset, 320, 340 + x_offset, 340], 'Orientation', 'right');
    set_param(gcb, 'GotoTag', "p" + i);
    From_2_ph = get_param(modelname + '/From' + i + '_2', 'PortHandles');
    
    add_block('simulink/Signal Routing/From', modelname + '/From' + i + '_3', 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [310 + x_offset, 360, 340 + x_offset, 380], 'Orientation', 'right');
    set_param(gcb, 'GotoTag', "a" + i);
    From_3_ph = get_param(modelname + '/From' + i + '_3', 'PortHandles');
    
    add_block('simulink/Commonly Used Blocks/Scope', modelname + '/Scope' + i, 'MakeNameUnique', 'on');
    set_param(gcb, 'position', [380 + x_offset, 280, 410 + x_offset, 390], 'Orientation', 'right', 'NumInputPorts', '3');
    set_param(gcb, 'DataLogging', 'on', 'DataLoggingVariableName', "Scope" + i, 'DataLoggingSaveFormat', 'Dataset');
    set_param(gcb, 'LayoutDimensionsString', '[3 1]');
    set_param(gcb, 'SampleTime', '0.01');
    set_param(gcb, 'ShowTimeAxisLabel', 'on');
    % disp(get_param(modelname + '/Scope' + i, 'ObjectParameters'));
    % disp(get_param(modelname + '/Scope' + i, 'YLabel'));
    Scope_ph = get_param(modelname + '/Scope' + i, 'PortHandles');
    
    add_line(modelname, Spring_ph.RConn, Damper_damper_ph.RConn);
    add_line(modelname, Spring_ph.LConn, Damper_damper_ph.LConn);
    add_line(modelname, Spring_ph.RConn, Damper_ph.RConn);
    add_line(modelname, Spring_ph.LConn, Damper_ph.LConn);
    add_line(modelname, Spring_ph.RConn, Spring_damper_ph.RConn);
    add_line(modelname, Spring_ph.LConn, Spring_damper_ph.LConn);
    add_line(modelname, Spring_ph.LConn, M_ph.LConn);
    add_line(modelname, Spring_ph.LConn, MS_ph.LConn);
    add_line(modelname, MS_ph.RConn(1, 1), TR_ph.LConn);
    add_line(modelname, MS_ph.RConn(1, 2), Converter_1_ph.LConn);
    add_line(modelname, MS_ph.RConn(1, 3), Converter_2_ph.LConn);
    add_line(modelname, Converter_1_ph.Outport, Goto_1_ph.Inport);
    add_line(modelname, Converter_1_ph.Outport, derivative_ph.Inport);
    add_line(modelname, derivative_ph.Outport, Goto_3_ph.Inport);
    add_line(modelname, Converter_2_ph.Outport, Goto_2_ph.Inport);
    add_line(modelname, From_1_ph.Outport, Scope_ph.Inport(1, 1));
    add_line(modelname, From_2_ph.Outport, Scope_ph.Inport(1, 2));
    add_line(modelname, From_3_ph.Outport, Scope_ph.Inport(1, 3));
    
    if i == 1
        add_line(modelname, Spring_ph.RConn, SC_ph.RConn);
        add_line(modelname, Spring_ph.RConn, VS_ph.LConn);
    end
end
% Simulink.BlockDiagram.arrangeSystem(modelname);
%% Set model parameters
initialization(modelname);
save_system(modelname);
