function loadWaveData(data) 
% Parameter: A 11100*1 matrix representing the earthquake wave data in 110s

% disp(data);
time = 0.01 * (0:11099)';

item = Simulink.SimulationData.Signal;
item.Name = 'Acceleration Dataset';
item.Values = timeseries(data, time);
dataset = Simulink.SimulationData.Dataset;
dataset{1} = item;

% This is the earthquake input data
save('data/dataset.mat', 'dataset');