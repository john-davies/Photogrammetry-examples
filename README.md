# Photogrammetry-examples

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License</a>.](http://creativecommons.org/licenses/by-sa/4.0/)

### Links

* Related posts on my blog - https://theretiredengineer.wordpress.com/category/photogrammetry/
* Online viewer for some of the models below - http://thereteng.appspot.com/photogrammetry.html


### Tools used

* [openMVG](https://github.com/openMVG/openMVG) - open Multiple View Geometry library
* [mve](https://github.com/simonfuhrmann/mve) - Multi-View Environment
* [mvs](https://github.com/cdcseacave/openMVS) - open Multi-View Stereo reconstruction library

### Scripts

* **init_project.sh** - sets up the directory structures to run the rest of the scripts
* **run_MVG.sh** - script to run openMVG, run it from the top level of the model directory, after init_project.sh
* **run_MVE.sh** - script to run MVE, run it from the top level of the model directory, after run_MVG.sh
* **run_MVS.sh** - script to run MVS, run it from the top level of the model directory, after run_MVG.sh
* **clear_project.sh** - clears any calculation data and restores a blank set of directories

_Note: default configuration is:_
* _MVG - describerPreset=HIGH_
* _MVE - filterWidth=7, componentSize=1000_
* _MVS - no configuration_

_but this may be overwritten by the .cfg file in the each model's subdirectory_

### Details of each directory

##### Stone Mask

* **Location** - Stone mask on my neighbour's wall
* **Camera** - Canon IXUS 70
* **Web link** - http://thereteng.appspot.com/stone_mask_dense.html

##### Gorsedd Stone

* **Location** - The stone circle erected for the 1962 National Eisteddfod in the grounds of Parc Howard, Llanelli, Wales. See http://www.megalithic.co.uk/article.php?sid=36840 for details. The stone is the leftmost in the image on that page.
* **Camera** - Canon IXUS 70
* **Comment** - Extraneous details edited out of the dense reconstruction using Meshlab. Sparse reconstruction left unchanged.
* Sketchfab model - https://sketchfab.com/3d-models/gorsedd-stone-bc05d14bda0d45c1a58a1d2254a3fb69

##### Fox

* **Location** - A small stone fox model belonging to my wife
* **Camera** - Nikon D3100
* **Comment** - Extraneous details edited out of the dense reconstruction using Meshlab. Sparse reconstruction left unchanged.
* **Web links**
    * Blog post on how the model was created - https://theretiredengineer.wordpress.com/2018/01/07/photogrammetry-using-a-turntable/
    * Software to process the model for 3D printing - https://github.com/john-davies/lidar-ply
    * Sketchfab model - https://sketchfab.com/3d-models/fox-0522a77b85654c61b27128fedfdbb582

##### Cottage

* **Location** - A small plaster model of a cottage
* **Camera** - Nikon D3100
* **Comment** - Extraneous details edited out of the dense reconstruction using Meshlab. Sparse reconstruction left unchanged.
* **Web links**
    * Blog post on how the model was created - https://theretiredengineer.wordpress.com/2018/08/19/model-house-photogrammetry/
    * Sketchfab model - https://sketchfab.com/3d-models/model-cottage-e379cffc16704d6c9701f0cd4417cdec

##### Pear

* **Location** - A full 360&deg; model of a pear
* **Camera** - Nikon D3100
* **Comment** - Extraneous details edited out of the dense reconstruction and number of verticies reduced using Quadratic Edge Decimation in Meshlab. Sparse reconstruction left unchanged.
* **Web links**
    * Blog post on how the model was created - https://theretiredengineer.wordpress.com/2018/12/16/full-object-photogrammetry/
    * Sketchfab model - https://sketchfab.com/3d-models/pear-6cebf458de3c49ffab3bd78dca6a4c85

##### Hedgehog

* **Location** - A small plaster model of a hedgehog
* **Camera** - Nikon D3100
* **Comment** - Extraneous details edited out of the dense reconstruction and number of verticies reduced using Quadratic Edge Decimation in Meshlab. Sparse reconstruction left unchanged.
* **Web links**
    * Blog post on how the model was created - TBD
    * Sketchfab model - https://sketchfab.com/3d-models/hedgehog-660641108abb49e3af3ef4addadfbbf9
