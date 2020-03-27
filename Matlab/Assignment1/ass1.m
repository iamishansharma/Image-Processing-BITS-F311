
% Ishan Sharma: 2016B2A70773P 
% IMAGE PROCESSING | Assignment-1 | Sem-2 Academic Year: 2019-20 |
% Date: 15th March 2020

clear all;
close all;
clc;

% Reading image from file -> 

    image = imread('assign1.bmp');
    
    im = double(image);
    
    [r,c]=size(im);
    
    figure;
    
    subplot(2,3,1);imshow(image);title('Original Image');

% Converting image to Fourier Domain 

    % Centering the image first -> 
    
        im_center = zeros((r),(c));
    
        for i=1:r 
           for j=1:c    
               im_center(i,j)=im(i,j)*((-1)^(i+j));   
           end
        end
       
        subplot(2,3,2);imshow(uint8(im_center));title('Transform Centering');
    
    % Now doing Fourier Transform -> 
    
        im_in_f = fft2(im_center);
    
        subplot(2,3,3);imshow(uint8(im_in_f));title('Fourier Transform');
    

 % Low pass filtering now! Do = 25, size of square = 50; 

    % Creating Filter ->
    
        H = zeros((r),(c));
        
        G = zeros((r),(c));
        
        % Center on image is at (128,128) therefore: 
        % the filter goes from 128-25 to 128+25 for both dimensions
        
        for i = 103:153 
            for j = 103:153
                H(i,j) = 1;
            end
        end
   
    % Applying Filter -> 

        G = im_in_f.*H;
        
        subplot(2,3,4);imshow(uint8(G));title('Filtered Fourier Transform');
     
% Taking Inverse FFT of the filtered image ->

    finalim = ifft2(G);
    
    subplot(2,3,5);imshow(uint8(finalim));title('Inverse Fourier Transform');
    
    % De-centering -> 
    
    for i=1:r
        for j=1:c
            finalim(i,j)=finalim(i,j)*((-1)^(i+j));
        end
    end
    
% Retaining the real parts of the inveresed image -> 

    finalim = real(finalim);
    finalim = uint8(finalim);

    subplot(2,3,6);imshow(uint8(finalim));title('Final Image');
