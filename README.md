# WFIRST-CGI-Data-Challenge-Tutorials
Tutorial notebooks and data sets for the WFIRST Exoplanet Imaging Data Challenge

Most notebooks are Python3/Jupyter notebooks that should run smoothly with the most recent stable numpy, scipy, and astropy packages distributed through Anaconda. Additional package dependencies are noted here each tutorial.

## 1. HLC image analysis

The simulated WFIRST Hybrid Lyot Coronagraph (HLC) images are the core component of the data challenge. In the tutorial data set, as in the official data challenge, there are 4 epochs of observation one scientific target star. At each epoch, images of the target are acquired at two observatory roll angles.

⋅⋅⋅### HLC data organization

⋅⋅⋅The simulated WFIRST Hybrid Lyot Coronagraph (HLC) images are stored under `WFIRST-CGI-Data-Challenge-Tutorials/Data/HLC/`.

⋅⋅⋅There are three sub-directories:

⋅⋅⋅`Data/HLC/HLC CAL/` -- Calibration input products.

⋅⋅⋅`Data/HLC/HLC DATA/` -- "Raw" co-added science target and reference target star images from four observing epochs.

⋅⋅⋅`Data/HLC/HLC proc/` -- Post-processed (PSF-subtracted, roll-combined) HLC images.

⋅⋅⋅### Tutorial notebooks

⋅⋅⋅Inside `WFIRST-CGI-Data-Challenge-Tutorials/Notebooks-Code/HLC_image_analysis/` there are 3 tutorials for analyzing simulated WFIRST Hybrid Lyot Coronagraph images:

⋅⋅⋅1. __hlc_data_tour.ipynb__ -- A guided tour of the raw HLC images and calibration files.

⋅⋅⋅2. __hlc_photometry_public_demo.ipynb__ -- Quick-look photometry & flux ratio calibration demo.

⋅⋅⋅3. __hlc_VIP_demo.ipynb__ -- Demo application of the [VIP](https://pypi.org/project/vip-hci/) high-contrast image analysis package.

## 2. Starshade image analysis


## 3. Astrometry, radial velocities, and orbit fitting

