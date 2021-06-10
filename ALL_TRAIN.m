layers = [
    imageInputLayer([6 52 1])
    convolution2dLayer([1 1], 16, 'Padding','same')
    batchNormalizationLayer
    reluLayer
    % maxPooling2dLayer([1 2],'Stride',2)
    convolution2dLayer([1 1], 32, 'Padding','same')
    batchNormalizationLayer
    reluLayer
    % maxPooling2dLayer([1 2],'Stride',2)
    convolution2dLayer([1 1], 64, 'Padding','same')
    batchNormalizationLayer
    reluLayer
    convolution2dLayer([1 1], 64, 'Padding','same')
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(2)
    regressionLayer];

miniBatchSize  = 1;
validationFrequency = floor(numel(all_tf_test)/miniBatchSize);
options = trainingOptions('adam', ...
    'MiniBatchSize',miniBatchSize, ...
    'MaxEpochs',20, ...
    'InitialLearnRate',1e-3, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropFactor',0.8, ...
    'LearnRateDropPeriod',1, ...
    'Shuffle','every-epoch', ...
    'ValidationData',{all_tf_validation, all_label_validation}, ...
    'ValidationFrequency',600, ...
    'Plots','training-progress', ...
    'Verbose',false);

net = trainNetwork(all_tf, all_label, layers, options);

YPredicted = predict(net, all_tf_test);
[max_ori, argmax_ori] = max(all_label_test, [], 2);
[max_pred, argmax_pred] = max(YPredicted, [], 2);
% disp([argmax_ori,argmax_pred]);
plotconfusion(categorical(argmax_ori.'), categorical(argmax_pred.'));
set(gca,'FontName','Times New Roman','FontSize',25);