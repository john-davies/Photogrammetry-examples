#!/bin/bash

# init_project.sh - sets up the directory structures
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

projectPath=`pwd`
mkdir ${projectPath}/images
mkdir ${projectPath}/SfM
mkdir ${projectPath}/SfM/matches
mkdir ${projectPath}/SfM/reconstruction
mkdir ${projectPath}/SfM/reconstruction/dense
mkdir ${projectPath}/SfM/reconstruction/dense/MVS
mkdir ${projectPath}/SfM/reconstruction/dense/MVS/images

