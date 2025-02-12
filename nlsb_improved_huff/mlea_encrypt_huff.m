function encrypted_bits = mlea_encrypt_huff(huff_bits)
    L = length(huff_bits) - mod(length(huff_bits), 8);
    encrypted_bits = huff_bits;
    
    % xor all bits with 1
    for i=1:L
        encrypted_bits(i) = bitxor(huff_bits(i), 1);
    end
    
    % For every 8 bit combination 
    for i=1:8:L
        % replace first and last four bits
        encrypted_bits(i:i+7) = encrypted_bits([i+4:i+7, i:i+3]);
        
        % perform left circular shift
        encrypted_bits(i:i+7) = encrypted_bits([i+1:i+7, i]);
    end
    
    % divide into blocks
    half = L/2;
    block1 = encrypted_bits(1:half);
    block2 = encrypted_bits(half+1:L);
    
    % if block1 bit is 1 then flip corresponding bit in block2
    for i=1:length(block1)
        block2(i) = bitxor(block1(i), block2(i));
    end
    
    encrypted_bits(1:half) = block1;
    encrypted_bits(half+1:L) = block2;
end