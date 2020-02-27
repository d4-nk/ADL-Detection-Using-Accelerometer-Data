partitionedModel = crossval(trainedModel.ClassificationEnsemble, 'KFold', 5);

% Compute validation predictions
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);

% Compute validation accuracy
validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');

plotconfusion(ind2vec(trainedModel.ClassificationEnsemble.Y'),ind2vec(validationPredictions'));

Eval = Evaluate(trainedModel.ClassificationEnsemble.Y,validationPredictions);