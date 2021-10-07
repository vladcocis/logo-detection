clear;
folder_logo=dir('Logo\');
folder_nonlogo=dir('Non_logo\');
Number_logo_images=length(folder_logo)-2; % number of logo images
Number_nonlogo_images=length(folder_nonlogo)-2; % number of non_logo images
input_training_set=[];

% Construct the training set 
% each training feature vector (either for logo or non logo images) is extracted 
% by using the DCT. Please see function get_featureVector
% dimension of the classifier is 11 (11 features)
for i=1:Number_logo_images
    Image=imread(['Logo\' folder_logo(i+2).name]);
    input_training_set=[input_training_set;get_featureVector(Image)];   
    output_training_set{i,1}='logo';
end
k=i;
for i=1:Number_nonlogo_images
    Image=imread(['Non_logo\' folder_nonlogo(i+2).name]);
    input_training_set=[input_training_set;get_featureVector(Image)];
    output_training_set{k+i,1}='non logo';
   
end
% because we have 180 training samples, the input_training_set should be
% arranged in a matrix of 11 rows and 180 columns to train the network.
% Remember that this arrangement should be the other way around (11 columns and 180 rows)
% for the Bayes and Tree classifiers
input_training_set=input_training_set'; % get the right arrangement for the input set. 
output_training_set=output_training_set'; % get the right arrangement for the output set


Target=strcmp('logo',output_training_set); % Now, Target has logical values (0 and 1). This has to be converted into double.


net = perceptron; 
net.trainParam.epochs = 40;  % set to 40 the maximum number of times the training samples will be used to train the network
net = train(net,input_training_set,double(Target)); % train the network with the training samples.


    
