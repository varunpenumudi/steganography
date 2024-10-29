clc;
clear all;
close all;

% EMBEDDING PROCEDURE

cover = imread("\project_images\nlsb_images\image8.bmp");

% get channels of image
Rc = cover(:,:,1);
Gc = cover(:,:,2);
Bc = cover(:,:,3);

% generating the random message and convert to bits
message = random_message(1);
bits = msg_to_bits(message);

% embedding into channel of your choice
Gc = embed_to_channel(Gc, bits);

% generate stego
stego = cover;
stego(:,:,1) = Rc;
stego(:,:,2) = Gc;
stego(:,:,3) = Bc;

imwrite(stego, "stego.bmp");


% EXTRACTION
stego = imread("stego.bmp");

% split into channels
Rc_steg = stego(:,:,1);
Gc_steg = stego(:,:,2);
Bc_steg = stego(:,:,3);

% extract bits from channel and get the message
extracted_bits = extract_from_channel(Gc_steg, length(bits));
extracted_msg = bits_to_msg(extracted_bits);

% Show the images side by side
figure
subplot(1,2,1), imshow(cover), title("Cover Image");
subplot(1,2,2), imshow(stego), title("Stego Image");

% show metrics
disp('Image Quality Metrics:');
metrics(cover, stego);