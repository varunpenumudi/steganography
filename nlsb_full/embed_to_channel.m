function newChannel = embed_to_channel(channel, bits)
    [M,N] = size(channel);
    
    % divide channel into four blocks
    block1 = channel(1:M/2, 1:N/2);
    block2 = channel(1:M/2, (N/2+1):N);
    block3 = channel((M/2+1):M, 1:N/2);
    block4 = channel((M/2+1):M, (N/2+1):N);
    
    % blocks for new embedded channel
    newBlock1 = block1;
    newBlock2 = block2;
    newBlock3 = block3;
    newBlock4 = block4;
    
    k = 1; % bit index
    
    % Embed cyclically in each block
    for i=1:(M/2)
        for j=1:(N/2)
            if k > length(bits)
                break
            end
            newBlock1(i,j) = bitset(block1(i,j), 1, bits(k)); % embed in block1
            k = k+1;
            newBlock2(i,j) = bitset(block2(i,j), 1, bits(k)); % embed in block2
            k = k+1;
            newBlock3(i,j) = bitset(block3(i,j), 1, bits(k)); % embed in block3
            k = k+1;
            newBlock4(i,j) = bitset(block4(i,j), 1, bits(k)); % embed in block4
            k = k+1;
        end
    end
    
    newChannel = [newBlock1 newBlock2; newBlock3 newBlock4];
end