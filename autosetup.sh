mydir=`pwd`
dl1dh_ver="master"
ctlearn_ver="tf-cv-upgrade"
data_file="data.tgz"
data_web="http://sagan.gae.ucm.es/~nieto/tmp2/ctlearn-aswg19/"

#Create and activate conda environment

conda env create -f environment.yml
source activate ctlearn-aswg19

mkdir -p $mydir"/code"
cd $mydir"/code"

#Install dl1-data-handler
if [ ! -d $mydir"/code/dl1-data-handler" ]; then
    git clone https://github.com/cta-observatory/dl1-data-handler.git
fi
cd $mydir"/code/dl1-data-handler"
git pull
git checkout $dl1dh_ver
pip install --upgrade .
cd $mydir/code

#Install ctlearn
if [ ! -d $mydir"/code/ctlearn" ]; then
    git clone https://github.com/ctlearn-project/ctlearn.git
fi
cd $mydir"/code/ctlearn"
git pull
git checkout $ctlearn_ver
pip install --upgrade .

#Donwload sample data
mkdir -p $mydir/data
cd $mydir/data/
if [ ! -e $mydir/data/$data_file ]; then 
    wget http://sagan.gae.ucm.es/~nieto/tmp2/ctlearn-aswg19/data.tgz
fi
tar -xvzf $mydir/data/$data_file

#Check versions
echo " "
echo "Checking installed versions"
echo "dl1-data-handler: "`conda list|grep 'dl1-data-handler'`
echo "ctlearn: "`conda list|grep 'ctlearn'`
echo "Done"
