function bits = msg_to_bits(msg)
    ascii = uint8(char(msg));
    
    bits = [];
    for num=ascii
        for i=8:-1:1
            bits = [bits bitget(num, i)];
        end
    end
end