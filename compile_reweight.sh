#!/bin/bash

 source  /usr/local/Modules/3.2.6/init/bash
 module load intel-fc/10.1.015

 ifort -O3 reweight.f90 -o reweight
