rng(5); % For reproducibility
load ionosphere;
labels = unique(Y);

cv = cvpartition(Y,'holdout',0.3);
Xtrain = X(training(cv),:);
Ytrain = Y(training(cv));
Xtest = X(test(cv),:);
Ytest = Y(test(cv));

% Classification Tree is chosen as the learner
mdl1 = ClassificationTree.template('NVarToSample','all');
RF1 = fitensemble(Xtrain,Ytrain,'Bag',150,mdl1,'type','classification');

% Classification Tree with surrogate splits is chosen as the learner
mdl2 = ClassificationTree.template('NVarToSample','all','surrogate','on');
RF2 = fitensemble(Xtrain,Ytrain,'Bag',150,mdl2,'type','classification');
