#!/bin/bash

# run_MVE.sh - Script to run MVE, run it from the top level of the model
#              directory, after run_MVG.sh
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
log_file=${model_name}_MVE.log

MVE_dmrecon_path=/home/john/projects/mve/apps/dmrecon
MVE_scene2pset_path=/home/john/projects/mve/apps/scene2pset
MVE_fssrecon_path=/home/john/projects/mve/apps/fssrecon
MVE_meshclean_path=/home/john/projects/mve/apps/meshclean

# Default settings:
#Option for dmrecon
filterWidth=7

# Check for a config override file
if [ -f ${model_name}.cfg ]
then
  source ${model_name}.cfg
fi

echo "Starting MVE calculations" > $log_file
echo "=========================" >> $log_file
echo "Config settings" >> $log_file
echo "filterWidth: $filterWidth" >> $log_file

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": dmrecon" >> $log_file
echo "${MVE_dmrecon_path}/dmrecon -s2 -f ${filterWidth} SfM/reconstruction/dense/MVE" >> $log_file
${MVE_dmrecon_path}/dmrecon -s2 -f ${filterWidth} SfM/reconstruction/dense/MVE

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": scene2pset" >> $log_file
echo "${MVE_scene2pset_path}/scene2pset -ddepth-L2 -iundist-L2 -n -s -c SfM/reconstruction/dense/MVE SfM/reconstruction/dense/MVE/OUTPUT.ply" >> $log_file
${MVE_scene2pset_path}/scene2pset -ddepth-L2 -iundist-L2 -n -s -c SfM/reconstruction/dense/MVE SfM/reconstruction/dense/MVE/OUTPUT.ply

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": fssrecon" >> $log_file
echo "${MVE_fssrecon_path}/fssrecon SfM/reconstruction/dense/MVE/OUTPUT.ply SfM/reconstruction/dense/MVE/OUTPUT_MESH.ply" >> $log_file
${MVE_fssrecon_path}/fssrecon SfM/reconstruction/dense/MVE/OUTPUT.ply SfM/reconstruction/dense/MVE/OUTPUT_MESH.ply

echo "********************************************************************" >> $log_file
echo `date "+%H:%M:%S"` ": meshclean" >> $log_file
echo "${MVE_meshclean_path}/meshclean SfM/reconstruction/dense/MVE/OUTPUT_MESH.ply SfM/reconstruction/dense/MVE/OUTPUT_MESH_CLEAN.ply" >> $log_file
${MVE_meshclean_path}/meshclean SfM/reconstruction/dense/MVE/OUTPUT_MESH.ply SfM/reconstruction/dense/MVE/OUTPUT_MESH_CLEAN.ply
