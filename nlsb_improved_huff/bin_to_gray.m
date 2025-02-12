function gray_bits = bin_to_gray(bits)
    gray_bits = bits;
    
    for i=2:length(bits)
        gray_bits(i) = bitxor(bits(i), bits(i-1));
    end
end