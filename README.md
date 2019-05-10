# RecentVsChronic

Multi-parameter analysis of HCV infection stage classification.

# About
----
This project consists of a multi-parameter model which detets the infection stage of HCV infection via machine learning techniques.
Given different sample sequences from different infection stage - as recent or chronic - a multi-parameter analysis then a machine learning classification training is performed. The training result gives the accuracy of correct classification.

# How to run

 - Parameters_run.m: It is the main script which calls all functions - calculates all parameters - and returns a file consisting of all results.This script takes an input file in fasta format.
- subSVM.m: the output obtained from Parameters_run for both inputs (one recent and chronic data input) is used to feed into SVM classifier. This script allows to choose the kernel and different parameters related to SVM classifier.
- SVMClassifier.m: this script is called from subSVM and it performs the classification. It returns a percentage indicating the accuracy of correct classification
