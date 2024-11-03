function [] = metrics(cover, stego)
    
    
    % Calculate mse
    error = cover(:)-stego(:);
    square_error = error.^2;
    
    mse = mean(square_error);
    rmse = sqrt(mse);
    peak_snr = 10 * log10((255^2)/mse);
    ssim_value = ssim(cover, stego);
    
    fprintf('Image Quality Metrics: \n');
    fprintf("MSE: %f \n", mse);
    fprintf("PSNR: %f \n", peak_snr);
    fprintf("RMSE: %f \n", rmse);
    fprintf("SSIM: %f \n", ssim_value);
end