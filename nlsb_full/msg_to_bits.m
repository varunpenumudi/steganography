function bits = msg_to_bits(msg)
    % get the ascii values of message
    ascii = uint8(char(msg));
    
    bits = [];
    for num=ascii
        % 8th to 1st LSB
        for i=8:-1:1 
            bits = [bits bitget(num, i)]; % get the LSB and append
        end
    end
end