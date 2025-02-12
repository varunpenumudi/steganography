function extracted_msg = nlsb_extract(stego, L)

    %% flip and transpose of stego image
    Flip_steg = flip(stego);
    Rc_steg = Flip_steg(:,:,1)';
    Gc_steg = Flip_steg(:,:,2)';
    Bc_steg = Flip_steg(:,:,3)';

    %% Shuffle Channel and extract
    Bc_steg = shuffle_channel(Bc_steg);
    extracted_bits = extract_from_channel(Bc_steg, L);
    
    %% Bits to message
    decrypted_bits = mlea_decrypt(extracted_bits);       % Decrypt bits
    extracted_SMdv = bits_to_msg(decrypted_bits);        % bits to SMdv
    extracted_ascii= get_difference(Rc_steg, extracted_SMdv); % SMdv to SM

    % message in char format
    extracted_msg = char(extracted_ascii);
end