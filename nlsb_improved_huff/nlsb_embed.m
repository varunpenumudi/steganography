function stego = nlsb_embed(cover, message)
    %% flip and transpose, split of image
    Flip_cover = flip(cover);
    Rc = Flip_cover(:,:,1)';
    Gc = Flip_cover(:,:,2)';
    Bc = Flip_cover(:,:,3)';
    
    %% message to bits
    SMdv = get_difference(Rc, message);  % SM to SMdv
    bits = msg_to_bits(SMdv);            % SMdv to bits
    encrypted_bits = mlea_encrypt(bits); % Encrypt bits

    %% Shuffle Channel, Embed and Unshuffle
    zs = zeros(1, 0.5*length(encrypted_bits));
    Bc = shuffle_channel(Bc);                         % shuffle
    Bc = embed_to_channel(Bc, [encrypted_bits, zs]);  % embed
    Bc = unshuffle_channel(Bc);                       % unshuffle

    %% Generate stego by transpose and reflip
    Reflip_img(:,:,1) = Rc';
    Reflip_img(:,:,2) = Gc';
    Reflip_img(:,:,3) = Bc';
    Reflip_img = flip(Reflip_img);

    stego = Reflip_img;
end