function extracted_msg = nlsb_extract_gray(stego, L)

    % FLIP and Transpose of stego image
    Flip_steg = flip(stego);
    Rc_steg = Flip_steg(:,:,1)';
    Gc_steg = Flip_steg(:,:,2)';
    Bc_steg = Flip_steg(:,:,3)';

    % SHUFFLE Channel and extract
    Bc_steg = shuffle_channel(Bc_steg);
    gray_extracted_bits = extract_from_channel(Bc_steg, L);
    bin_extracted_bits = gray_to_bin(gray_extracted_bits);            % Gray to Binary
    
    % BITS to message
    decrypted_bits = mlea_decrypt(bin_extracted_bits);       % Decrypt bits
    extracted_SMdv = bits_to_msg(decrypted_bits);            % bits to SMdv
    extracted_ascii= get_difference(Rc_steg, extracted_SMdv); % SMdv to SM

    % MESSAGE in char format
    extracted_msg = char(extracted_ascii);
end