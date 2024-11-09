clc;
clear all;
close all;

% EMBEDDING PROCEDURE

cover = imread("..\project_images\nlsb_images\image8.bmp");

% flip and transpose, split of image
Flip_cover = flip(cover);
Rc = Flip_cover(:,:,1)';
Gc = Flip_cover(:,:,2)';
Bc = Flip_cover(:,:,3)';

% generating the random message and convert to bits
message = random_message(14);
% SM to SMdv
SMdv = get_difference(Rc, message);
% SMdv to bits
bits = msg_to_bits(SMdv);
% Encrypt bits
encrypted_bits = mlea_encrypt(bits);

% Shuffle Channel
Bc = shuffle_channel(Bc);

% Embedding into Blue channel
Bc = embed_to_channel(Bc, encrypted_bits);

% Unshuffle Channel
Bc = unshuffle_channel(Bc);

% generate stego by transpose and reflip
Reflip_img(:,:,1) = Rc';
Reflip_img(:,:,2) = Gc';
Reflip_img(:,:,3) = Bc';
Reflip_img = flip(Reflip_img);

stego_img = Reflip_img;
imwrite(stego_img, "stego.bmp");





% EXTRACTION PROCEDURE

stego = imread("stego.bmp");

% flip and transpose of stego image
Flip_steg = flip(stego);
Rc_steg = Flip_steg(:,:,1)';
Gc_steg = Flip_steg(:,:,2)';
Bc_steg = Flip_steg(:,:,3)';

% Shuffle Channel
Bc_steg = shuffle_channel(Bc_steg);
% Extract bits from Shuffled channel
extracted_bits = extract_from_channel(Bc_steg, length(bits));

% Decrypt bits
decrypted_bits = mlea_decrypt(extracted_bits);
% bits to SMdv
extracted_SMdv = bits_to_msg(decrypted_bits);
% SMdv to SM
extracted_ascii= get_difference(Rc, extracted_SMdv);

% message in char format
extracted_msg = char(extracted_ascii);

% Show the Cover and Stego images side by side
figure
subplot(2,2,1), imshow(cover), title("Cover Image");
subplot(2,2,2), imshow(stego), title("Stego Image");
subplot(2,2,3), imhist(cover), title("Cover Image");
subplot(2,2,4), imhist(stego), title("Stego Image");



% show messages
fprintf("Message Embedded:  \n %s \n\n", message);
fprintf("Message Extracted: \n %s \n"  , extracted_msg);


% show metrics
fprintf("\n");
metrics(cover, stego);