# split_dataset
Randomly split dataset into train and test according to the ratio specified using Matlab. 
Create new dataset that can be fed into Pytorch Imagefolder.

## Features
1. uses ImageDataStore
2. ratio is maintained across all labels.
3. resize images
4. ignore corrupt images

## Usage

split_dataset('path_to_data',0.6,[224,224])


