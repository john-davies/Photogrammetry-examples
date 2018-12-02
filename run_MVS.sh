#!/bin/bash

# run_MVS.sh - Script to run MVS, run it from the top level of the model
#              directory, after run_MVG.sh
# Copyright (C) 2018 John Davies
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

model_name=${PWD##*/}
log_file=`pwd`/${model_name}_MVS.log

openMVG_path=/home/john/projects/openMVG_Build/Linux-x86_64-RELEASE
openMVS_path=/home/john/projects/openMVS_build/bin

# Default settings:

# Check for a config override file
if [ -f ${model_name}.cfg ]
then
  source ${model_name}.cfg
fi

echo "Starting MVS calculations" > $log_file
echo "=========================" >> $log_file

cd SfM/reconstruction/dense/MVS

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": openMVG_main_openMVG2openMVS" >> $log_file
echo "${openMVG_path}/openMVG_main_openMVG2openMVS -i ../../../../SfM/reconstruction/global/sfm_data.bin -o scene.mvs -d images" >> $log_file

${openMVG_path}/openMVG_main_openMVG2openMVS -i ../../../../SfM/reconstruction/global/sfm_data.bin -o scene.mvs -d images

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": DensifyPointCloud" >> $log_file
echo "${openMVS_path}/DensifyPointCloud scene.mvs" >> $log_file
${openMVS_path}/DensifyPointCloud scene.mvs

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": ReconstructMesh" >> $log_file
echo "${openMVS_path}/scene_dense.mvs" >> $log_file
${openMVS_path}/ReconstructMesh scene_dense.mvs

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": TextureMesh" >> $log_file
echo "${openMVS_path}/TextureMesh scene_dense_mesh.mvs" >> $log_file
${openMVS_path}/TextureMesh scene_dense_mesh.mvs

cd ../../../..

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": End" >> $log_file
