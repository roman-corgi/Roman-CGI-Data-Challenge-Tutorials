# Roman-CGI-Data-Challenge-Tutorials
Tutorial notebooks and data sets for the [Roman Exoplanet Imaging Data Challenge](https://www.exoplanetdatachallenge.com/)

Most notebooks are Python3/Jupyter notebooks that should run smoothly with the most recent stable numpy, scipy, and astropy packages distributed through Anaconda. Additional package dependencies are noted here each tutorial.

## 1. HLC image analysis

The simulated Roman Hybrid Lyot Coronagraph (HLC) images are the core component of the data challenge. In the tutorial data set, as in the official data challenge, there are 4 epochs of observation one scientific target star. At each epoch, images of the target are acquired at two observatory roll angles.

   ### HLC data

   The simulated Roman Hybrid Lyot Coronagraph (HLC) images are stored under [Data/HLC/](Data/HLC/).

   There are three subdirectories:

   [Data/HLC/HLC CAL/](Data/HLC/HLC%20CAL/) - Calibration input FITS files.

   [Data/HLC/HLC DATA/](Data/HLC/HLC%20DATA/) - "Raw" co-added science target and reference target star images from four observing epochs, in FITS format.

   [Data/HLC/HLC proc/](Data/HLC/HLC%20proc/) - Post-processed (PSF-subtracted, roll-combined) HLC images in FITS format.

   ### Tutorial notebooks

   Inside [Notebooks-Code/HLC_image_analysis/](Notebooks-Code/HLC_image_analysis/) there are 3 tutorials for analyzing the above HLC images:

   1. [hlc_data_tour.ipynb](Notebooks-Code/HLC_image_analysis/hlc_data_tour.ipynb) - A guided tour of the raw HLC images and calibration files.

   2. [hlc_photometry_public_demo.ipynb](Notebooks-Code/HLC_image_analysis/hlc_photometry_public_demo.ipynb) - Quick-look photometry & flux ratio calibration demo.

   3. [hlc_VIP_demo.ipynb](Notebooks-Code/HLC_image_analysis/hlc_VIP_demo.ipynb) - Demo application of the [VIP](https://pypi.org/project/vip-hci/) high-contrast image analysis package for roll subtraction and source extraction.

## 2. Starshade image analysis 

   ### Starshade data
   
   As in the official data challenge, this tutorial data set includes two final epochs of images of the scientific target     observed with a Roman starshade rendezvous mission. The starshade images were simulated using the [SISTER](http://sister.caltech.edu) starshade simulation toolkit. The starshade data and calibration FITS files are stored under [Data/SS](Data/SS).
   
   ### Tutorial script and presentation
   
   The starshade image analysis demo script, [SS_Photometry_Tutorial.m](Notebooks-Code/Starshade_image_analysis/SS_Photometry_Tutorial.m), is written in Matlab. It demonstrations point source photometry and flux ratio calibration, and is functionally analogous to the above HLC photometry tutorial  [hlc_photometry_public_demo.ipynb](Notebooks-Code/HLC_image_analysis/hlc_photometry_public_demo.ipynb).

   In addition to the Matlab script, we include a slide show that walks through the steps of the Matlab script, including the plots: [SS_Photometry_Tutorial.pdf](Presentations/SS_Photometry_Tutorial.pdf).
  
## 3. Astrometry, radial velocities, and orbit fitting

