function newChannel = shuffle_channel(channel)
    [M, N] = size(channel);
    
    block1 = channel(1:M/2, 1:N/2);
    block2 = channel(1:M/2, (N/2+1):N);
    block3 = channel((M/2+1):M, 1:N/2);
    block4 = channel((M/2+1):M, (N/2+1):N);
    
    block1 = apply_magic(block1);
    block2 = apply_magic(block2);
    block3 = apply_magic(block3);
    block4 = apply_magic(block4);
    
    newChannel = [block1 block2; block3 block4];
end