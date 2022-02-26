#!/usr/bin/env bash
# Install CUDA Toolkit
sudo apt install nvidia-cuda-toolkit
# Install anaconda from https://www.anaconda.com/products/individual
conda activate base
conda install -c pytorch pytorch
conda install -c pytorch torchvision
conda install numpy jupyter notebook
