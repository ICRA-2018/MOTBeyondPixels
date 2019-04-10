# MOTBeyondPixels
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/icra2018/motbeyondpixels.svg)](https://hub.docker.com/r/icra2018/motbeyondpixels)
<a href="#how-to-run-with-docker"><img src="https://img.shields.io/badge/Docker-instructions-brightgreen.svg"></a>

<img src="example_image.png" alt="Example image">

This repository contains code and data required to reproduce the results in the ICRA 2018 paper

## Beyond Pixels: Leveraging Geometry and Shape Cues for Online Multi-Object Tracking [(arXiv)](https://arxiv.org/abs/1802.09298)
### Sarthak Sharma<sup>\*</sup>, [Junaid Ahmed Ansari](https://scholar.google.co.in/citations?user=Uc8mKqMAAAAJ&hl=en)<sup>\*</sup>, [J. Krishna Murthy](https://krrish94.github.io), and [K. Madhava Krishna](http://robotics.iiit.ac.in)
> <sup>\*</sup> The first two authors contributed equally to the work.

### [Project Page](https://junaidcs032.github.io/Geometry_ObjectShape_MOT/)
> The project page has more qualitative results, and links to data.

If you find the code/data useful in your experiments, kindly consider citing

```
@inproceedings{BeyondPixels_ICRA2018,
  title={Beyond Pixels: Leveraging Geometry and Shape Cues for Online Multi-Object Tracking},
  author={Sarthak Sharma, Junaid Ahmed Ansari, J. Krishna Murthy, K. Madhava Krishna},
  booktitle = {Procedings of the IEEE International Conference on Robotics and Automation},
  year={2018}
}
```


## Running the demo scripts

We provide demo scripts for running code and visualizing results on sequences from the KITTI Tracking dataset.

To run a demo script that shows representative results on short snippets from the train and test splits run

```
main_script_train.m
main_script_test.m
```
> IMPORTANT: You need to have the `Data` folder initialized, before you can run this demo.
> See below for details.

Before you can run this, however, make sure you download the requisite CNN appearance features and rectified images by running the following script.
```
sh download_data.sh
```
Or you can download it from [here](https://drive.google.com/open?id=1ZR1qEf2qjQYA9zALLl-ZXuWhqG9lxzsM) and place it (after unzipping it) in the parent directory.

## Using our result files

To falcilitate comparision, we have also released our results on the KITTI Tracking benchmark (train and test splits). The result files, in the format specified by the evaluation server, can be downloaded from [here](https://drive.google.com/open?id=0B-9NOTtQ3zTQUTJORXlyTEZzR0M4UG1jUmRvS2ZCcE5ZUFI0)

> DISCLAIMER: The result files have been released *in good faith*, in the spirit of reproducible research.
> No misuse is permitted.

## Misc. Remarks

We release release object detections obtained (and filtering scripts for non-maxima suppression, along with parameters used) for all train and test sequences. We report results obtained by running [RRC-Net](https://arxiv.org/abs/1704.05776) \[[code](https://github.com/xiaohaoChen/rrc_detection)\] on KITTI Tracking data. They can be accessed in the `Data` directory.

We also release odometry estimates obtained from ORB-SLAM. Note that, since we used monocular ORB-SLAM, odometry estimates were obtained *to-scale*. To get rid of the scale factor ambiguity, we empirically estimate a scale factor by four-fold cross-validation over the train set. Once this scale factor is estimated, we use the same factor across all train and test sequences in the results reported. These can be found in the `Data` directory too.

## Autonomous driving software stacks using our method

[AutoWare's](https://autware.ai)(world's first "all-in-one" open-source software for self-driving vehicles) image based object tracker is based on our work. [Link](https://github.com/CPFL/Autoware/tree/master/ros/src/computing/perception/detection/vision_tracker/packages/vision_beyond_track)

# How to Run with Docker
## Linux
#### Prerequisites
* MATLAB

Tested on Ubuntu 16.04.6 with Docker 18.06.1-ce, MATLAB R2017a.

1. Download the file [Data.tar.gz](https://drive.google.com/open?id=0B-9NOTtQ3zTQUTJORXlyTEZzR0M4UG1jUmRvS2ZCcE5ZUFI0) 
and uncompress it in &lt;YOUR_PATH&gt;.

2. Open a terminal and run the command:

```
docker run --rm -p 8888:8888 -v /usr/local/MATLAB/R2017a:/usr/local/MATLAB/R2017a  \
  -v /usr/local/lib/python3.5/dist-packages/matlab:/usr/local/lib/python3.5/dist-packages/matlab \
  -v <YOUR_PATH>/Data:/home/jovyan/motbeyondpixels/Data \
  --mac-address=2c:60:0c:d6:50:36 icra2018/motbeyondpixels:latest
```

3. Run a web browser and open the link: [http://localhost:8888/lab/tree/README.ipynb](http://localhost:8888/lab/tree/README.ipynb)
