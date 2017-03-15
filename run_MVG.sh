#!/bin/bash

# run_MVG.sh - Script to run openMVG, run it from the top level of the model
#              directory, after init_project.sh
# Copyright (C) 2017 John Davies
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
log_file="${model_name}_MVG.log"

camera_DB_path=/home/john/projects/openMVG/src/openMVG/exif/sensor_width_database
openMVG_path=/home/john/projects/openMVG_Build/Linux-x86_64-RELEASE

# Default settings:
#Option for openMVG_main_ComputeFeatures
describerPreset=NORMAL
# option for reconstruction file extension
recon_ext=bin

# Check for a config override file
if [ -f ${model_name}.cfg ]
then
  source ${model_name}.cfg
fi

echo "Starting openMVG calculations" > $log_file
echo "=============================" >> $log_file
echo "Config settings" >> $log_file
echo "describerPreset: $describerPreset" >> $log_file
echo "recon_ext: $recon_ext" >> $log_file

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": openMVG_main_SfMInit_ImageListing" >> $log_file
echo "${openMVG_path}/openMVG_main_SfMInit_ImageListing -i images -o SfM/matches -d ${camera_DB_path}/sensor_width_camera_database.txt" >> $log_file
${openMVG_path}/openMVG_main_SfMInit_ImageListing -i images -o SfM/matches -d ${camera_DB_path}/sensor_width_camera_database.txt

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": openMVG_main_ComputeFeatures" >> $log_file
echo "${openMVG_path}/openMVG_main_ComputeFeatures -i SfM/matches/sfm_data.json -o SfM/matches --describerPreset ${describerPreset}" >> $log_file
${openMVG_path}/openMVG_main_ComputeFeatures -i SfM/matches/sfm_data.json -o SfM/matches --describerPreset ${describerPreset}

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": openMVG_main_ComputeMatches" >> $log_file
echo "${openMVG_path}/openMVG_main_ComputeMatches -i SfM/matches/sfm_data.json -o SfM/matches -g e" >> $log_file
${openMVG_path}/openMVG_main_ComputeMatches -i SfM/matches/sfm_data.json -o SfM/matches -g e

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": openMVG_main_GlobalSfM" >> $log_file
echo "${openMVG_path}/openMVG_main_GlobalSfM -i SfM/matches/sfm_data.json -m SfM/matches -o SfM/reconstruction/global" >> $log_file
${openMVG_path}/openMVG_main_GlobalSfM -i SfM/matches/sfm_data.json -m SfM/matches -o SfM/reconstruction/global

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": openMVG_main_ComputeSfM_DataColor" >> $log_file
echo "${openMVG_path}/openMVG_main_ComputeSfM_DataColor -i SfM/reconstruction/global/sfm_data.${recon_ext} -o SfM/reconstruction/global/colorized.ply"  >> $log_file
${openMVG_path}/openMVG_main_ComputeSfM_DataColor -i SfM/reconstruction/global/sfm_data.${recon_ext} -o SfM/reconstruction/global/colorized.ply

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": openMVG_main_openMVG2MVE2" >> $log_file
echo "${openMVG_path}/openMVG_main_openMVG2MVE2 -i SfM/reconstruction/global/sfm_data.${recon_ext} -o SfM/reconstruction/dense" >> $log_file
${openMVG_path}/openMVG_main_openMVG2MVE2 -i SfM/reconstruction/global/sfm_data.${recon_ext} -o SfM/reconstruction/dense
