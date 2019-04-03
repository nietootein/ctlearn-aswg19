if [ "$#" -ne 1 ]; then
    echo "Choose your OS: {linux|macos}"
    echo " e.g. $> bash autosetup.sh linux"
fi

mydir=`pwd`
dl1dh_ver="v0.7.2"
ctlearn_ver="v0.3.0"
data_web="http://sagan.gae.ucm.es/~nieto/tmp2/ctlearn-aswg19/"

#Create and activate conda environment

if [[ $1 == "linux" ]]; then
    conda env create -f environment-linux.yml
    data_file="data-linux.tgz"
elif [[ $1 == "macos" ]]; then
    conda env create -f environment-macos.yml
    data_file="data-macos.tgz"
else
    echo "Supported OS: linux, macos"
    exit
fi
source activate ctlearn-aswg19

#Create some useful folders
mkdir -p $mydir"/logs"
mkdir -p $mydir"/code"
cd $mydir"/code"

#Install dl1-data-handler (only under linux)

if [[ $1 == "linux" ]]; then
    if [ ! -d $mydir"/code/dl1-data-handler" ]; then
	git clone https://github.com/cta-observatory/dl1-data-handler.git
    fi
    cd $mydir"/code/dl1-data-handler"
    git pull
    git checkout $dl1dh_ver
    pip install --upgrade .
    cd $mydir"/code"
fi

#Install ctlearn
if [ ! -d $mydir"/code/ctlearn" ]; then
    git clone https://github.com/ctlearn-project/ctlearn.git
fi
cd $mydir"/code/ctlearn"
git pull
git checkout $ctlearn_ver
pip install --upgrade .

#Download sample data
mkdir -p $mydir/data
cd $mydir/data/
if [ ! -e $mydir/data/$data_file ]; then 
    wget $data_web/$data_file
fi
tar -xvzf $mydir/data/$data_file
cd $mydir

#Generate ctlearn files list 
ls $mydir/data/ctlearn/*h5 > $mydir/data/ctlearn/ctlearn_input.txt

#Check versions
echo " "
echo "Checking installed version(s)"
if [[ $1 == "linux" ]]; then
    echo "dl1-data-handler: "`conda list|grep 'dl1-data-handler'`
fi
echo "ctlearn: "`conda list|grep 'ctlearn'`
echo "Done"
