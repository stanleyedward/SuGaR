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

# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# download and install Node.js (you may need to restart the terminal)
nvm install 20

npm -i -g gltfpack