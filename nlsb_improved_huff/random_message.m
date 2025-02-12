function msg = random_message(size_KB)
    ascii = randi([65 122], 1, size_KB*1024);
    
    msg = char(ascii);
end