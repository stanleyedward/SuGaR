#!/bin/bash

#colmap and dataset prep
bash colmap_setup.sh
bash miniconda_install.sh
bash preprocessing.sh inputs/ 3

#conda install
bash dependency_install.sh

#train
bash start_train.sh

