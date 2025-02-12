function gray_bits = gray_to_bin(bits)
    gray_bits = bits;
    
    for i=2:length(bits)
        gray_bits(i) = bitxor(bits(i), gray_bits(i-1));
    end
end