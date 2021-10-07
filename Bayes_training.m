clear;

folder_logo=dir('Logo\');
folder_nonlogo=dir('Non_logo\');
Number_logo_images=length(folder_logo)-2; % number of logo images
Number_nonlogo_images=length(folder_nonlogo)-2; % number of non_logo images
input_training_set=[];

% Construct the training set 
% each training feature vector is extracted 
% by using the DCT. Please see function get_featureVector
% dimension of the classifier is 64 (64 features)
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

% train the Bayes classifier using the training samples
classifier = fitcnb(input_training_set,output_training_set); 

% get a brief description of the classifier.
disp(classifier);