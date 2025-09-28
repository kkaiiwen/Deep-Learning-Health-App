function trainNet

    % Paths to training and validation images
    trainingDataPath = '/Users/kaiwen/Desktop/food';
    validationDataPath = '/Users/kaiwen/Desktop/food';

    % Create imageDatastores that read images by folder name as label
    imdsTrain = imageDatastore(trainingDataPath, ...
        'IncludeSubfolders', true, ...
        'LabelSource', 'foldernames');

    imdsVal = imageDatastore(validationDataPath, ...
        'IncludeSubfolders', true, ...
        'LabelSource', 'foldernames');

    % Input size for GoogLeNet (fixed at 224x224x3)
    inputSize = [224, 224, 3];

    % Define data augmenter (adds random variation to training images)
    augmenter = imageDataAugmenter( ...
        'RandRotation', [-20, 20], ...        % rotate between -20° and +20°
        'RandXReflection', true, ...          % flip images left-right
        'RandScale', [0.8, 1.2]);             % zoom in/out

    % Create augmented datastores
    augimdsTrain = augmentedImageDatastore(inputSize(1:2), imdsTrain, ...
        'DataAugmentation', augmenter);

    % For validation we normally do not augment, only resize
    augimdsVal = augmentedImageDatastore(inputSize(1:2), imdsVal, ...
        'ColorPreprocessing', 'gray2rgb');

    % Load pretrained GoogLeNet
    net = googlenet;
    lgraph = layerGraph(net); % convert to editable layer graph

    % Get number of classes from training labels
    numClasses = numel(categories(imdsTrain.Labels));

    % Create new fully connected (FC) and classification layers
    fcLayer = fullyConnectedLayer(numClasses, ...
        'Name', 'new_fc', ...
        'WeightLearnRateFactor', 10);

    classLayer = classificationLayer('Name', 'new_output');

    % Replace GoogLeNet’s old head with new layers
    lgraph = replaceLayer(lgraph, 'loss3-classifier', fcLayer);
    lgraph = replaceLayer(lgraph, 'output', classLayer);

    % Training options
    options = trainingOptions('sgdm', ...     % use stochastic gradient descent with momentum
        'MiniBatchSize', 10, ...              % process 10 images at a time
        'MaxEpochs', 6, ...                   % train for 6 full passes through the dataset
        'InitialLearnRate', 3e-4, ...         % starting learning rate
        'Shuffle', 'every-epoch', ...         % shuffle data at the start of each epoch
        'ValidationData', augimdsVal, ...     % use validation set for evaluation
        'ValidationFrequency', 3, ...         % validate every 3 iterations
        'Verbose', false, ...                 % suppress detailed command line output
        'Plots', 'training-progress');        % plot accuracy and loss curves

    % Train the modified GoogLeNet
    [net, trainInfo] = trainNetwork(augimdsTrain, lgraph, options);

    % Save trained model
    save('trainedGoogLeNet1.mat', 'net');

end