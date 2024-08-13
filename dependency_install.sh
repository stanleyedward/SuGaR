#!/bin/bash
source ~/.bashrc
echo finished sourcing

conda env create -f environment.yml --yes
conda activate sugar

cd gaussian_splatting/submodules/diff-gaussian-rasterization/
pip install -e .
cd ../simple-knn/
pip install -e .
cd ../../../

sudo apt install -y unzip nano 