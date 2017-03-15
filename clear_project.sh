#!/bin/bash

# clear_project.sh - clears any calculation data and restores a blank set of directories 
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

rm ${projectPath}/SfM/matches/*
rm ${projectPath}/SfM/reconstruction/global/*
rmdir ${projectPath}/SfM/reconstruction/global
rm -r ${projectPath}/SfM/reconstruction/dense/*
