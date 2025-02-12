function bits = mlea_decrypt(encrypted_bits)

    % divide into blocks
    L = length(encrypted_bits);
    block1 = encrypted_bits(1:(L/2));
    block2 = encrypted_bits((L/2)+1:L);
    
    % if block1 bit is 1 then flip corresponding bit in block2
    for i=1:length(block1)
        block2(i) = bitxor(block1(i), block2(i));
    end
    
    % concat blocks
    bits(1:(L/2)) = block1;
    bits((L/2)+1:L) = block2;
    
    % for every 8-bit combination perform
    for i=1:L:8
        % right circular shift
        bits(i:i+7) = bits([i+7, i:i+6]);
        
        % replace first four bits with last four bits
        bits(i:i+7) = bits([i+4:i+7, i:i+3]);
    end
    
    % bitXor with 1 for each bit
    for i=1:L
        bits(i) = bitxor(bits(i), 1);
    end
end