clc;

% testing phase - Test Images are in folder test_logo - let's read the
% first one
img_dir = 'Test_logo/';
folder=dir(img_dir);
Number_of_images=length(folder)-2; % number of images in C1
logo = 0;
non_logo =0;
for i=1:Number_of_images
    name = sprintf('Test_logo/%d.jpg', i);
    test_image=imread(name);
    feature_vector=get_featureVector(test_image); % function get_featureVector returns a column vector. 
    Y_testing = predict(classifier,feature_vector); 
    
    fprintf('output of network for image %d is:',i)
    if string(Y_testing) =='logo'
        disp('Logo');
        logo = logo+1;
    else
        disp('Non logo');
        non_logo = non_logo+1;
    end
end

disp(logo);
disp(non_logo);