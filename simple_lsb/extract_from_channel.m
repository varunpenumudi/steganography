function bits = extract_from_channel(channel, len)
    bits = [];
    [M, N] = size(channel);
    
    i = 1;
    
    for m=1:M
        for n=1:N
            if i > len
                break
            end
            
            bits = [bits, bitget(channel(m,n), 1)];
            i = i+1;
        end
    end
end