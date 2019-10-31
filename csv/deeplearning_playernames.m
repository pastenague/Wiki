filename = "teams_players_1_to_591.csv";
data = readtable(filename,'TextType','string');
head(data)
data.team = categorical(data.team);
cvp = cvpartition(data.team,'Holdout',0.3);
dataTrain = data(training(cvp),:);
dataHeldOut = data(test(cvp),:);
cvp = cvpartition(dataHeldOut.team,'HoldOut',0.5);
dataValidation = dataHeldOut(training(cvp),:);
dataTest = dataHeldOut(test(cvp),:);
textDataTrain = dataTrain.player;
textDataValidation = dataValidation.player;
textDataTest = dataTest.player;
YTrain = dataTrain.team;
YValidation = dataValidation.team;
YTest = dataTest.team;
documentsValidation = preprocesstext(textDataValidation);
documentsTrain = preprocesstext(textDataTrain);
enc = wordEncoding(documentsTrain);
XTrain = doc2sequence(enc,documentsTrain,'Length',2);
XTrain(1:5)
XValidation = doc2sequence(enc,documentsValidation,'Length',2);
inputSize = 1;
embeddingDimension = 100;
numWords = enc.NumWords;
numHiddenUnits = 180;
numClasses = numel(categories(YTrain));
layers = [ ...
sequenceInputLayer(inputSize)
wordEmbeddingLayer(embeddingDimension,numWords)
lstmLayer(numHiddenUnits,'OutputMode','last')
fullyConnectedLayer(numClasses)
softmaxLayer
classificationLayer]
options = trainingOptions('adam', ...
    'MaxEpochs',1, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.01, ...
    'ValidationData',{XValidation,YValidation}, ...
    'Plots','training-progress', ...
    'Verbose',false);
net = trainNetwork(XTrain,YTrain,layers,options);