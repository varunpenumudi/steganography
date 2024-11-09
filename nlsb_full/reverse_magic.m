function newBlock = reverse_magic(block)
    [M, N] = size(block);
    
    flattened = reshape(block', 1, []);
    newBlock = flattened;            % flattened block
    mag = reshape(magic(N)', 1, []); % flattened magic matrix
    
    newBlock(mag) = flattened;
    
    newBlock = reshape(newBlock', M, N)';
end