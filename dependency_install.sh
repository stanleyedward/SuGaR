#!/bin/bash
conda env create -f environment.yml
conda activate sugar

cd gaussian_splatting/submodules/diff-gaussian-rasterization/
pip install -e .
cd ../simple-knn/
pip install -e .
cd ../../../

sudo apt install -y gltfpack unzip nano
