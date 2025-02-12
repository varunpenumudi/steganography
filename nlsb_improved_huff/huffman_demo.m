clc, clear all, close all;

rand_msg = char(randi([0 255], 1, 5000));
prob = [];

for i=0:255
    prob = [prob, count(rand_msg, char(i))/5000];
end

dict = huffmandict(0:255, prob);

enc = huffmanenco(rand_msg, dict);
dec = huffmandeco(enc, dict);