#!/bin/bash

#colmap and dataset prep
bash colmap_setup.sh
bash miniconda_install.sh
bash preprocessing.sh inputs/ 3

#conda install
source dependency_install.sh

#train
mkdir outputs/
bash start_train.sh

#mv mesh to home
mkdir output_mesh
cp -r output/refined_mesh/inputs/* output_mesh/. 

#convert .obj to .glb
gltfpack -i output_mesh/*.obj -o output_mesh/   model.glb
#clean
rm -r outputs/ output/ inputs/

#copy frmo remote ssh to local
#scp -P 49778 root@ip_address:~/SuGaR/output_mesh/model.glb

