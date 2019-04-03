# ctlearn-aswg19

This repository contains some tools that intend to automate the installation of [CTLearn](https://github.com/ctlearn-project/ctlearn) on your system and the retrieval of some data sets for [CTLearn](https://github.com/ctlearn-project/ctlearn) demonstration purposes. Both linux and macOS are supported. If installing on a linux machine, [Dl1-data-handler](https://github.com/cta-observatory/dl1-data-handler) will also be installed and additional data sets will be retrieved for [Dl1-data-handler](https://github.com/cta-observatory/dl1-data-handler) demostration purposes. 

These tools assume a **working anaconda3 installation** on the target machine. 

**Note:** The linux installation, including the example data sets, takes ~3GB of disk space. The macos installation, including the example data sets, takes ~2GB of disk space.

## Installation

Clone the repository:

```console
$ git clone https://github.com/nietootein/ctlearn-aswg19.git
```
Change directory into the cloned repository:

```console
$ cd ctlearn-aswg19
```
Run the autosetup.sh script, selecting your OS:

For linux:

```console
$ bash autosetup.sh linux
```

For macOS:

```console
$ bash autosetup.sh macos
```

## Contact

In case of trouble with the installation please contact Daniel Nieto (d.nieto at ucm dot es).

