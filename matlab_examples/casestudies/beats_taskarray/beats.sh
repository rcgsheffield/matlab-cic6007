#!/bin/sh
#$ -cwd
#$ -N beatres
#$ -j y
#$ -t 1-5:1
#$ -l h_rt=00:01:00

module load apps/matlab/2017a
/usr/local/bin/matlab -nojvm -nosplash -nodisplay < beats.m
