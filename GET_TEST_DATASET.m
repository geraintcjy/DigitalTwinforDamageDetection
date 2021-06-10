N0 = 52;
n = 1;

load('data/TrainingDataset-record20170228EW/tf-KC-P3-0.3 0.2 0.1-Loss.mat');
tf = abs(tf(: , 1: N0));
tf = normalize(tf, 2, 'zscore');
tf_truncated = zeros(6, N0 / n);
    for k = 1:(N0/n)
        tmp = mean(tf(:, n*(k-1)+1 : n*k), 2);
        tf_truncated(:, k) = tmp;
    end
tf_truncated = reshape(tf_truncated, 1, []);

disp(predictK(tf_truncated));