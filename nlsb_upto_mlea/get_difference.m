function msg_diff = get_difference(channel, msg)
    % convert the characters of message to ascii values
    ascii = double(char(msg));
    
    L = length(ascii);
    [M, N] = size(channel);
    
    msg_diff = zeros(1, L);
    k = 1;
    
    for m=1:M
        for n=1:N
            if k > L
                break;
            end
            
            diff = mod(double(channel(m,n)) - ascii(k), 256);
            msg_diff(k) = diff;
            k = k+1;
        end
    end
    
end