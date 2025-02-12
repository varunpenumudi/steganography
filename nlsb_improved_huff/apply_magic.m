function newBlock = apply_magic(block)
    [M, N] = size(block);
    
    flattened = reshape(block', 1, []);
    newBlock = flattened;            % flattened block
    mag = reshape(magic(N)', 1, []); % flattened magic matrix
    
    newBlock = flattened(mag);
    
    newBlock = reshape(newBlock', M, N)';
end