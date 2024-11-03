function msg = random_message(size_KB)
    ascii = randi([0 255], 1, size_KB*1024);
    
    msg = char(ascii);
end