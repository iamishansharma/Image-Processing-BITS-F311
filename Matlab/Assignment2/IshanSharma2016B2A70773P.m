
% Ishan Sharma - 2016B2A70773P 
% Image Processing - Assignment 2
% Sem 2 2019-20.
% Date: 21th April 2020

clear all;
close all;
clc;

% Reading original image.
orimg = imread('cameraman.tif');

% Converting image to double for transformation
orimgd = double(orimg);

% Getting dimensions of image
[m,n] = size(orimgd);

% Creating DCT Matrix
dm = dctmtx(m);

% Applying DCT Transformation
dctimg = (dm)*(orimgd)*(dm');

% Setting the white square region
% in 3rd quarant zero here
% White Square = 20% of edge size
% Therefore starting index = 80% of m;

start = int64(0.8*m);

for i=start:m
    for j=start:n
        dctimg(i,j) = 0.0;
    end
end

% Inversing the DCT Transformation
cmimg = (dm')*(dctimg)*(dm); 

% Calculating Error Matrix 
err = abs(orimgd - cmimg);

% Displaying All Images

subplot(1,3,1); imshow(orimgd,[]); title('Original Image');
subplot(1,3,2); imshow(cmimg,[]); title('Reconstructed Image');
subplot(1,3,3); imshow(err,[]); title('Error');