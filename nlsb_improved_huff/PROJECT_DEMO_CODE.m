clc; clear all; close all;

%% EMBEDDING PROCEDURE

% baboon.bmp, barbara.bmp, tree.bmp, female.bmp, lake_view.bmp, ramdan.bmp
cover = imread("..\project_images\with_names\GEC.jpg");

% flip and transpose, split of image
Flip_cover = flip(cover);
Rc = Flip_cover(:,:,1)';
Gc = Flip_cover(:,:,2)';
Bc = Flip_cover(:,:,3)';

% message and convert to bits
message = random_message(1);

% SM to SMdv
SMdv = get_difference(Rc, message);
% SMdv to bits
bits = msg_to_bits(SMdv);

% creating huffman dictionary
probs = [];
for sym=0:255
    probs = [probs, sum(SMdv==sym)/length(SMdv)];
end
dict = huffmandict(0:255, probs);

% huffman encoded, encrypted bits
huff_bits = huffmanenco(SMdv, dict);           % Encode
encrypted_bits = mlea_encrypt_huff(huff_bits); % Encrypt
gray_bits = bin_to_gray(encrypted_bits);            % Convert to Gray

% Shuffle, Embed, Unshuffle Channel
Bc = shuffle_channel(Bc);
Bc = embed_to_channel(Bc, gray_bits);
Bc = unshuffle_channel(Bc);

% generate stego by transpose and reflip
Reflip_img(:,:,1) = Rc';
Reflip_img(:,:,2) = Gc';
Reflip_img(:,:,3) = Bc';
Reflip_img = flip(Reflip_img);

stego_img = Reflip_img;

%% EXTRACTION PROCEDURE

stego = stego_img;

% flip and transpose of stego image
Flip_steg = flip(stego);
Rc_steg = Flip_steg(:,:,1)';
Gc_steg = Flip_steg(:,:,2)';
Bc_steg = Flip_steg(:,:,3)';

% Shuffle Channel
Bc_steg = shuffle_channel(Bc_steg);
% Extract bits from Shuffled channel
extracted_bits = extract_from_channel(Bc_steg, length(huff_bits));

% bits to SMdv
bin_bits = gray_to_bin(extracted_bits);                      % Gray to binary
decrypted_bits = mlea_decrypt_huff(bin_bits);                % Decrypt
extracted_SMdv = huffmandeco(double(decrypted_bits), dict);  % Decode

% SMdv to SM
extracted_ascii= get_difference(Rc, extracted_SMdv);

% message in char format
msg_extr = char(extracted_ascii);

%% Image Metrics
% Show the Cover and Stego images side by side
figure
subplot(2,2,1), imshow(cover), title("Cover Image");
subplot(2,2,2), imshow(stego), title("Stego Image");
subplot(2,2,3), imhist(cover), title("Cover Image");
subplot(2,2,4), imhist(stego), title("Stego Image");

% show messages
fprintf("Message Embedded:  \n %s \n\n", message);
fprintf("Message Extracted: \n %s \n\n", msg_extr);

% show metrics
stego_nlsb = nlsb_embed(cover, message);

fprintf("NLSB: \n");
metrics(cover, stego_nlsb);

fprintf("\nNLSB Improved: \n");
metrics(cover, stego)
