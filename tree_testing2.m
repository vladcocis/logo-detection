% testing phase - Test Images are in folder test_logo
clc;

test_image=imread('Test_logo\34.jpg');

feature_vector=get_featureVector(test_image); % function get_featureVector returns a column vector. 
Y_testing = predict(classifier,feature_vector); 
if string(Y_testing) =='logo'
    disp('Logo');
else
    disp('Non logo');
end