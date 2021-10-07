% testing phase - Test Images are in folder test_logo - let's read the
% first one
clc;

test_image=imread('Test_logo\34.jpg');

feature_vector=get_featureVector(test_image); % function get_featureVector returns a column vector.

Y_testing = net(feature_vector');  % compute the output of the trained network

%imshow(test_image),title('Original Image'),
if round(Y_testing)>=.5
    disp('Logo');
else
    disp('Non logo');
end