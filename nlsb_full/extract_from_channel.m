function bits = extract_from_channel(channel, len)
    bits = [];
    [M, N] = size(channel);
    
    % blocks of initial channel
    block1 = channel(1:M/2, 1:N/2);
    block2 = channel(1:M/2, (N/2+1):N);
    block3 = channel((M/2+1):M, 1:N/2);
    block4 = channel((M/2+1):M, (N/2+1):N);
    
    i = 1;     % bit index
    bits = []; % array to store extracted bits
    
    % extract cyclically from each block
    for m=1:(M/2)
        for n=1:(N/2)
            if i > len
                break
            end
            
            bits = [bits, bitget(block1(m,n), 1)];
            bits = [bits, bitget(block2(m,n), 1)];
            bits = [bits, bitget(block3(m,n), 1)];
            bits = [bits, bitget(block4(m,n), 1)];
            
            i = i+4;
        end
    end
end