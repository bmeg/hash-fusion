# hash-fusion

This repository acts as a simple example of using CWL to drive a pipeline of tasks.

It will take an input file and hash it three different ways, then concatenate the results of these together into a single file.

## setup

In the Google Cloud Console, create a new disk image from the Dream SMC RNA Challenge:

    dream-smc-rna/images/dream-smcrna-06242016.tar.gz

Then, create a new VM instance and add the new disk image as the boot disk. Give it at least 8GB RAM. 

Once it is created, SSH into the machine and log in as the `ubuntu` user:

    sudo su -l ubuntu

Now you can clone this repo:

    git clone https://github.com/bmeg/hash-fusion.github
    cd hash-fusion

And finally, run the workflow! You can use this README as an input:

    cwl-runner hash-fusion-workflow.cwl --input README.md