function [] = metrics(cover, stego)
    peak_snr   = psnr(cover, stego);
    mse        = immse(cover, stego);
    rmse       = sqrt(mse);
    ssim_value = ssim(cover, stego);
    
    fprintf("PSNR: %f \n", peak_snr);
    fprintf("MSE:  %f \n",  mse);
    fprintf("RMSE: %f \n", rmse);
    fprintf("SSIM: %f \n", ssim_value);
end