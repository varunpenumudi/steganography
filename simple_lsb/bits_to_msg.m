function msg = bits_to_msg(bits)
    ascii = [];
    
    for i=1:8:length(bits)
        val = uint8(0);
        
        for j=i:i+7
            val = val*2;       % val << 1
            val = val+bits(j); % val | 1
        end
        
        ascii = [ascii val];
    end
    
    msg = char(ascii);
end