# iNAS : Intermittent-Aware Neural Architecture Search

<!-- ABOUT THE PROJECT -->
## Overview

This repository contains iNAS, a neural architecture search (NAS) framework which finds deep neural networks (DNNs) that can be feasibly deployed and executed on *intermittently-powered* systems. iNAS co-explores the neural architecture, execution design and preservation design spaces to find highly accurate DNNs that can *safely* and *efficiently* execute under intermittent power.


We develop iNAS on top of an existing [hardware-aware NAS](https://github.com/PITT-JZ-COOP/FPGA-implementation-Aware-Neural-Architecture-Search), where we adapt the NAS controller and DNN Trainer, as well as introduce the following two key components to introduce *intermittent execution behavior* into NAS: 

* Intermittent-aware Execution Design Explorer (iNAS-Exp)
* Intermittent-aware Abstract Performance Model (iNAS-PMod)

NAS iteratively generates child networks. For each child network, iNAS-Exp explores the execution design and preservation design spaces, and uses the energy budget, hardware specification and latency requirement as search constraints. iNAS-PMod derives the end-to-end inference latency of a the child network and corresponding intermittent execution design, by considering all additional key costs related to progress preservation and progress recovery. 


The derived iNAS solutions (i.e., network models with associated intermittent execution designs) are deployed on the Texas Instruments MSP430FR5994 LaunchPad and executed using an intermittent inference library that is also included in this repository. 


<!-- TABLE OF CONTENTS -->
## Table of Contents
* [Directory/File Structure](#directory/file-structure)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Setup and Build](#setup-and-build)
* [Using iNAS](#using-inas)
  


## Directory/File Structure
Below is an explanation of the directories/files found in this repository. 


`iNAS/NASBase` contains the implementation for the NAS Controller and DNN Trainer, adapted from the [hardware-aware NAS engine](https://github.com/PITT-JZ-COOP/FPGA-implementation-Aware-Neural-Architecture-Search).<br/>
`iNAS/IEExplorer` contains the implementation for the iNAS-Exp<br/>
`iNAS/CostModel` contains the implementation for the iNAS-PMod<br/>
`iNAS/DNNDumper` is a helper module used to convert the derived solutions into a custom C data structure recognizable by the intermittent inference runtime library<br/>
`iNAS/misc_scripts` contains miscellaneous helper scripts<br/>
`iNAS/run_scripts` contains scripts to help deploy and execute iNAS and related experiments on a GPU server
`iNAS/settings_files` contains the settings used for evaluation (on 3 datasets)
`iNAS/solution_dump` is the solution output directory
`iNAS/trial_log` is the directory used to output log info per trial
`iNAS/main.py` is the iNAS main entry file
`iNAS/settings.py` contains the implementation for managing/loading settings files
`iNAS/clean_all.sh` is a script to clear all temporary files generated by iNAS 
`iNAS/example_run.sh` is an example script that shows an iNAS run
`iNAS/requirements_pip.txt` contains the dependencies required to run iNAS
`intermittent-inference-library` contains the intermittent inference runtime library developed for the TI-MSP430FR5994 (currently supports convolution, global pooling and fully connected layers)


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

###### iNAS
iNAS is implemented using Python 3.7 and so we recommend installing the [Anaconda](https://docs.anaconda.com/anaconda/install/) distribution of Python and related packages. The required dependencies to run iNAS can be found in the included `iNAS/requirements_pip.txt` file. 

###### Intermittent Inference Library
Here is the basic software and hardware needed to build/run the intermittent inference runtime library. 
* [Code composer studio](http://www.ti.com/tool/CCSTUDIO "link") (recommended versions: > 7.0)
* [MSP Driver Library](http://www.ti.com/tool/MSPDRIVERLIB "link")
* [MSP DSP Library](http://www.ti.com/tool/MSP-DSPLIB "link")
* [MSP-EXP430FR5994 LaunchPad](http://www.ti.com/tool/MSP-EXP430FR5994 "link")

### Setup and Build

###### iNAS
1. Download/clone this repository
2. Install [Anaconda](https://docs.anaconda.com/anaconda/install/) Python distribution 
3. [Create and activate] (https://conda.io/projects/conda/en/latest/user-guide/getting-started.html) virtual environment
4. Install dependencies `pip install -r requirements.txt`
5. Run iNAS example: `iNAS/example_run.sh`

###### Intermittent Inference Library
1. Download/clone this repository
2. Download `Driver` & `DSP` library from http://www.ti.com/ 
3. Import this project to your workspace of code composer studio (CCS). 
4. Add `PATH_TO_DSPLIB` & `PATH_TO_DIRVERLIB` to library search path


