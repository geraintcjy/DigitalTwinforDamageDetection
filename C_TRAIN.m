% [XTrain,~,YTrain] = digitTrain4DArrayData;
% [XValidation,~,YValidation] = digitTest4DArrayData;
% disp(XValidation(:, :, :, 1))

% convolution2dLayer：https://www.mathworks.com/help/deeplearning/ref/nnet.cnn.layer.convolution2dlayer.html
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
    fullyConnectedLayer(3)
    regressionLayer];

miniBatchSize  = 1;
validationFrequency = floor(numel(C_tf_pattern)/miniBatchSize);
options = trainingOptions('adam', ...
    'MiniBatchSize',miniBatchSize, ...
    'MaxEpochs',40, ...
    'InitialLearnRate',1e-3, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropFactor',0.85, ...
    'LearnRateDropPeriod',1, ...
    'Shuffle','every-epoch', ...
    'ValidationData',{C_tf_validation, C_tf_pattern_validation}, ...
    'ValidationFrequency',validationFrequency, ...
    'Plots','training-progress', ...
    'Verbose',false);

net = trainNetwork(C_tf, C_tf_pattern, layers, options);

YPredicted = predict(net, C_tf_test);
[max_ori, argmax_ori] = max(C_tf_pattern_test, [], 2);
[max_pred, argmax_pred] = max(YPredicted, [], 2);
% disp([argmax_ori,argmax_pred]);
plotconfusion(categorical(argmax_ori.'), categorical(argmax_pred.'));