% First of all, download the FITS file of (1) from the Box folder: WFIRST_CGI-2019-DC-Tutorial>Data>SS, and the PSF FITS file in step (3) from WFIRST_CGI-2019-RealDC-SS>SS CAL. If you download them in separate folders, please update your local paths below.

% 1) Opening some simulated data, equivalent to the HLC simulation but for the starshade.
data = fitsread( 'starshade_run_dc2_jitter_perturbedSS_solar_glint_with_extragalactic_background_and_5exozodi_photometry_emgain_4000_time_per_frame_6sec_total_integration_105600sec_with_emccd.fits' ) ;

% 2) Overall view
figure( 1 ) ; imagesc( data ) ; xlabel( 'PIX' ) ; ylabel( 'PIX' ) ; title( 'Simulated Starshade data' ) ; colorbar ; pbaspect( [ 1 1 1 ] ) ; set( gca, 'FontSize', 16 ) ; img = getframe( gcf ) ; imwrite( img.cdata, 'simulated_data_SS.png' )

% 3) Opening the PSF response
psf = fitsread( 'starshade_run_dc2_psf_21.08mas.fits' ) ;

% 4) Displaying the PSF and showing that is normalized to 1
figure( 2 ) ; imagesc( psf ) ; xlabel( 'PIX' ) ; ylabel( 'PIX' ) ; title( sprintf( 'Sum(PSF)=%1.2f', sum( psf( : ) ) ) ) ; colorbar ; pbaspect( [ 1 1 1 ] ) ; set( gca, 'FontSize', 16 ) ; img = getframe( gcf ) ; imwrite( img.cdata, 'PSF_SS.png' )

% 5) Planet 'b' has its maximum intensity at the pixel (43,55). Matlab ordering. Selecting an area of 3x3 pixels around it.
d_box = 1 ;
planet_data = data( 43 - d_box : 43 + d_box, 55 - d_box : 55 + d_box ) ;

% 6) Displaying the planet data
figure( 3 ) ; imagesc( planet_data ) ; xlabel( 'PIX' ) ; ylabel( 'PIX' ) ; title( 'Planet b' ) ; colorbar ; pbaspect( [ 1 1 1 ] ) ; set( gca, 'FontSize', 16 ) ; img = getframe( gcf ) ; imwrite( img.cdata, 'planet_b_data.png' )

% 7) Deriving the total counts
planet_counts = sum( planet_data( : ) ) ;
disp( sprintf( 'The planet counts in a box of %ix%i pixels with background is %1.1f', 2 * d_box + 1, 2 * d_box + 1, planet_counts ) )

% 8) Estimating the background
background_data = data( 1 : 10, 1 : 10 ) ;
background_counts = median( background_data( : ) ) ;

% 9) Displaying the background free of other planets, starlight, exozodiacal light, etc.
figure( 4 ) ; imagesc( background_data ) ; xlabel( 'PIX' ) ; ylabel( 'PIX' ) ; title( sprintf( 'Background (median=%1.1f)', background_counts ) ) ; colorbar ; pbaspect( [ 1 1 1 ] ) ; set( gca, 'FontSize', 16 ) ; img = getframe( gcf ) ; imwrite( img.cdata, 'background_data.png' )

% 10) Correcting the planet count from the background counts
planet_counts_without_background = planet_counts - numel( planet_data ) * background_counts ;
disp( sprintf( 'The planet counts in a box of %ix%i pixels without background is %1.1f', 2 * d_box + 1, 2 * d_box + 1, planet_counts_without_background ) )

% 11) Getting the fraction of the PSF enclosed in the photometry box
center_pixel_psf = ( size( psf, 1 ) + 1 ) / 2 ;
psf_fraction = sum( sum( psf( center_pixel_psf - d_box : center_pixel_psf + d_box, center_pixel_psf - d_box : center_pixel_psf + d_box ) ) ) ;
disp( sprintf( 'The PSF fraction enclosed in the box of %ix%i pixels is %1.4f', 2 * d_box + 1, 2 * d_box + 1, psf_fraction ) )

% 12) Estimating the flux ratio
disp( 'From the spreadsheet the total star counts are 1.9238e8 photons/sec, the total integration time is 105,600 sec and the instrumental factor to convert photons to counts at the detector is 0.75.' )
disp( sprintf( 'Therefore the star counts would be %1.4e', 1.9238e8 * 105600 * 0.75 * psf_fraction ) )
disp( sprintf( 'The planet''s flux ratio is %1.3e', planet_counts_without_background / ( 1.9238e8 * 105600 * 0.75 * psf_fraction ) ) )

% 13) Comparing with the input value
disp( 'The input flux ratio in the simulation for planet b was 4.17e-9.' )
disp( sprintf( 'The relative error of our estimated flux ratio is %1.1f%s', ( planet_counts_without_background / ( 1.9238e8 * 105600 * 0.75 * psf_fraction ) / 4.17e-9 - 1 ) * 100, '%' ) )

% 14) Planet 'c' has its maximum intensity at the pixel (33,48). Matlab ordering. Following the same steps as before we get:
planet_data = data( 33 - d_box : 33 + d_box, 48 - d_box : 48 + d_box ) ;
figure( 5 ) ; imagesc( planet_data ) ; xlabel( 'PIX' ) ; ylabel( 'PIX' ) ; title( 'Planet c' ) ; colorbar ; pbaspect( [ 1 1 1 ] ) ; set( gca, 'FontSize', 16 ) ; img = getframe( gcf ) ; imwrite( img.cdata, 'planet_c_data.png' )
planet_counts = sum( planet_data( : ) ) ;
planet_counts_without_background = planet_counts - numel( planet_data ) * background_counts ;
disp( sprintf( 'Planet ''c'' flux ratio is %1.3e', planet_counts_without_background / ( 1.9238e8 * 105600 * 0.75 * psf_fraction ) ) )
disp( 'The input flux ratio in the simulation for planet c was 2.77e-10.' )
disp( sprintf( 'The relative error of our estimated flux ratio is %1.1f %s', ( planet_counts_without_background / ( 1.9238e8 * 105600 * 0.75 * psf_fraction ) / 2.77e-10 - 1 ) * 100, '%' ) )

