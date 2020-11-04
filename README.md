# Roman CGI Data Challenge Official (in-house) Analysis Notebooks
Official (in-house) analysis notebooks and data sets for the [Roman Exoplanet Imaging Data Challenge](https://www.exoplanetdatachallenge.com/)

The analysis Jupyter notebooks rely on a number of packages outside of the
Python numerical core libraries (Numpy and Scipy). All of these depencies can
be installed through conda and/or pip installation commands. The simplest way
to ensure smooth execution is to clone the conda Python 3.7 environment
specified in the file [environment.yml](environment.yml).

A brief summary of the file organization follows.


## 1. Data

   ### HLC data

   The simulated Hybrid Lyot Coronagraph (HLC) images are the core component
   of the data challenge. In the tutorial data set, as in the official data
   challenge, there are 4 epochs of observation one scientific target star. At
   each epoch, images of the target are acquired at two observatory roll angles.

   The simulated HLC images are stored under [Data/official2019/HLC/](Data/official2019/HLC/).

   There are three subdirectories:

   [Data/official2019/HLC/HLC CAL/](Data/official2019/HLC/HLC%20CAL/) - Calibration input FITS files.

   [Data/official2019/HLC/HLC DATA/](Data/official2019/HLC/HLC%20DATA/) - "Raw" co-added science target and reference target star images from four observing epochs, in FITS format.

   [Data/official2019/HLC/data_reference_sheet.xlsx](Data/official2019/HLC/data_reference_sheet.xlsx) - Reference sheet provided to data challenge participants, describing the properties of the science target star and the observations.

   ### Starshade data

   The data set includes two final epochs of images of the scientific target observed with a Roman Starshade Rendezvous mission. The starshade images were simulated using the [SISTER](http://sister.caltech.edu) starshade simulation toolkit. The starshade data and calibration FITS files are stored under [Data/official2019/SS](Data/official2019/SS).

   ### Radial velocities

   The radial velocities are stored in two ASCII files in [Data/official2019/RV/](Data/official2019/RV/), [data1.txt](Data/official2019/RV/data1.txt) and [data2.txt](Data/official2019/RV/data2.txt). The two files span different ranges of dates, representing two instruments, Keck HIRES and NEID, with different corresponding measurement errors.
   
## 2. Analysis
   
The notebooks in [Analysis/official2019](Analysis/official2019) demonstrate a complete end-to-end analysis for one of the planets in the official data challenge system. This is not meant to represent a state-of-the-art analysis, but rather a proof-of-concept retrieval of astrometry, photometry, orbit, and geometric albedo.

   0. [Analysis/official2019/00-RUN_ALL.ipynb](Analysis/official2019/00-RUN_ALL.ipynb) - This runs all of the notebooks described below in sequence. Total execution time is roughly 40 minutes (limited by orbit fitting MCMC). Running this and Checking for successful completion can be used to verify the software environment.

   1. [Analysis/official2019/01-centered_HLC_PSF.ipynb](Analysis/official2019/01-centered_HLC_PSF.ipynb) - This notebook prepares a centered model of the HLC PSF, based on the calibration PSF files.

   2. [Analysis/official2019/02-HLC_RDI.ipynb](Analysis/official2019/02-HLC_RDI.ipynb) - Reference differential imaging.

   3. -- 6. Astrometry and photometry for the 4 epochs of HLC images.
   
   7. Astrometry and photometry for one of the starshade images (only one of two starshade epochs has a detection for the demonstration planet).

   8. Radial velocity analysis (with radvel).

   9. Orbit fitting (with orbitize).

   10. Phase curve analysis and albedo retrieval.

