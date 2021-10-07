function vector=get_featureVector(image)
% this function returns a column vector of 11 features.
% First convert the colour input image into a greayscale image
if size(image,3)==3,
    image= rgb2gray(image);
end
image=imresize(image,[128,128]); % normalization


%extract the features in the wavelet domain
[ca1,ch1,cv1,cd1] = dwt2(image,'db1');
[ca2,ch2,cv2,cd2] = dwt2(ca1,'db1');
[ca3,ch3,cv3,cd3] = dwt2(ca2,'db1');

vector=[std2(abs(ch1)),std2(abs(cv1)),std2(abs(cd1)),std2(abs(ch2)),std2(abs(cv2)),...
    std2(abs(cd2)),std2(abs(ch3)),std2(abs(cv3)),std2(abs(cd3)),mean(mean(abs(ch1))),mean(mean(abs(cv1)))];

end