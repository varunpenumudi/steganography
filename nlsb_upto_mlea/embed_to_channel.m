function newChannel = embed_to_channel(channel, bits)
    [M,N] = size(channel);
    newChannel = channel;
    
    k = 1; % bit index
    
    for i=1:M
        for j=1:N
            if k > length(bits)
                break
            end
            newChannel(i,j) = bitset(channel(i,j), 1, bits(k));
            k = k+1;
        end
    end
end