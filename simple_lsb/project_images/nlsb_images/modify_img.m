clc;
clear all;
close all;

img = imread("");
img = imresize(img, [512 512]);

imshow(img);

imwrite(img, "");
imwrite(img, "");