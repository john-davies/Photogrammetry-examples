# Photogrammetry-examples

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License</a>.](http://creativecommons.org/licenses/by-sa/4.0/)

### Tools used

* [openMVG](https://github.com/openMVG/openMVG) - open Multiple View Geometry library
* [mve](https://github.com/simonfuhrmann/mve) - Multi-View Environment

### Scripts

* **init_project.sh** - sets up the directory structures to run the rest of the scripts
* **run_MVG.sh** - script to run openMVG, run it from the top level of the model directory, after init_project.sh
* **run_MVE.sh** - script to run MVE, run it from the top level of the model directory, after run_MVG.sh
* **clear_project.sh** - clears any calculation data and restores a blank set of directories

_Note: default configuration is:_
* _MVG - describerPreset=HIGH_
* _MVE - filterWidth=11_

_but this may be overwritten by the .cfg file in the each model's subdirectory_

### Details of each directory

##### St_Mary_Warwick

* **Location** - St Mary's Church, Warwick, UK
* **Camera** - Canon IXUS 70
* **Comment** - Probably not quite enough images, some more at either end of the arc would be useful

##### St_Michaels_Budbrooke_1

* **Location** - St Michael's Church, Budbrooke, Warwick, UK
* **Camera** - Canon IXUS 70

##### St_Michaels_Budbrooke_2

* **Location** - St Michael's Church, Budbrooke, Warwick, UK
* **Camera** - Canon IXUS 70

##### Church Ramsau

* **Location** - Evangelischen Pfarrgemeinde, Ramsau am Dachstein, Austria
* **Camera** - Nikon D3100
* **Comment** - The glass in the window is not broken, it's just gaps in the mesh.
