#!/bin/bash

python gaussian_splatting/train.py -s inputs/ --iterations 7000 -m outputs/
python train.py -s inputs/ -c outputs/ -r "density" --low_poly True --refinement_time "short" --export_uv_textured_mesh True --white_background True


