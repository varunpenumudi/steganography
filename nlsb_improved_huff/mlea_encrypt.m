function encrypted_bits = mlea_encrypt(bits)
    encrypted_bits = zeros(1, length(bits));
    
    % xor all bits with 1
    for i=1:length(bits)
        encrypted_bits(i) = bitxor(bits(i), 1);
    end
    
    % For every 8 bit combination 
    for i=1:length(bits):8
        % replace first and last four bits
        encrypted_bits(i:i+7) = encrypted_bits([i+4:i+7, i:i+3]);
        
        % perform left circular shift
        encrypted_bits(i:i+7) = encrypted_bits([i+1:i+7, i]);
    end
    
    % divide into blocks
    half = length(encrypted_bits)/2;
    block1 = encrypted_bits(1:half);
    block2 = encrypted_bits(half+1:length(bits));
    
    % if block1 bit is 1 then flip corresponding bit in block2
    for i=1:length(block1)
        block2(i) = bitxor(block1(i), block2(i));
    end
    
    encrypted_bits(1:half) = block1;
    encrypted_bits(half+1:length(bits)) = block2;
end