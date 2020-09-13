#!/bin/bash

# To run this installer you can open a Terminal window and enter the following commands:

# wget https://pdk.libresilicon.com/tools.sh
# bash tools.sh


echo "To install the LibreSilicon Standard Cell Generator toolchain, you need:"
echo "Debian/Ubuntu-18.04 or newer"
echo "at least 1.9 GB RAM"

echo "If the installation interrupts due to a network or power outage, just run the installation script again."

sudo apt-get update

echo "The following packages are optional for documentation and visualisation, you can safely say N if you dont want to install them:"

echo Installing required packages on Debian/Ubuntu:
sudo apt-get -y install qflow imagemagick libcairo2-dev tcllib tklib make g++ libreadline-dev python3-cairosvg python3 python3-numpy libblas-dev ngspice z3 tcl8.6-dev tk8.6-dev python3-scipy python3-matplotlib texlive-latex-recommended unzip glpk-utils libglpk-dev python3-pulp git wget gauche python3-toml python3-pytoml iverilog gtkwave python3-pip mmv libglu1-mesa-dev libcurl4-gnutls-dev pdf2svg python3-yaml python3-cffi python3-pyparsing python3-certifi tcl magic libsqlite3-dev python3-setuptools python3-networkx python3-sympy lsb 


sudo apt-get -y install libngspice0 libngspice0-dev python3-gdspy python3-kiwisolver 
sudo apt-get -y install klayout libopengl-dev opensta opensta-dev

sudo apt-get -y install geda-gschem geda-gnetlist geda-doc geda-gattrib geda-gsymcheck 
sudo apt-get -y install python-z3 
sudo apt-get -y install python3-z3 

echo Installing required packages on FreeBSD:


#echo "Installing Magic since we need magic >= 8.2.145  , as soon as the distribution package is newer than that and comes with cairo support we wont need to compile it ourselves anymore:"
#sudo rm -rf magic-*/
#MAGICVERSION=8.3.27
#wget -c http://opencircuitdesign.com/magic/archive/magic-$MAGICVERSION.tgz
#tar xvzf magic-$MAGICVERSION.tgz
#cd magic-$MAGICVERSION
#./configure --with-cairo
#make
#sudo make install
#cd ..



# Due to problems with the KLayout packages we currently have to install it manually:

git clone https://github.com/KLayout/klayout
cd klayout
sudo python3 setup.py install
cd ..


exit
echo Installing librecell
sudo rm -rf librecell
git clone https://codeberg.org/tok/librecell
echo "Python >= 3.6 is needed!"
python3 --version
cd librecell/librecell-common
sudo python3 setup.py install
cd ../..
cd librecell/librecell-meta
sudo python3 setup.py install
cd ../..
cd librecell/librecell-lib
sudo python3 setup.py install
cd ../..
cd librecell/librecell-layout
sudo python3 setup.py install
cd ../..



echo Installing Circdia
wget -c http://www.taylorgruppe.de/circdia/circdia.zip
sudo mkdir -p /usr/share/texlive/texmf-dist/tex/circdia
sudo unzip -u -o -d /usr/share/texlive/texmf-dist/tex/circdia circdia.zip
sudo mktexlsr

# We try to use libngspice0 and libngspice0-dev perhaps we dont need this code anymore:
#echo Installing ngspice
#wget -O ngspice-31.tar.gz https://sourceforge.net/projects/ngspice/files/ng-spice-rework/31/ngspice-31.tar.gz/download
#tar xvzf ngspice-31.tar.gz
#cd ngspice-31
#./configure --with-ngshared --enable-shared
#make
#sudo make install
#cd ..

#echo "Installing gdspy (GDS for Python), if it has not been installed already"
#sudo pip3 install gdspy

echo "Installing PySpice (SPICE for Python)"
sudo pip3 install PySpice

echo "Installing Sphinx Verilog"
sudo pip4 install sphinxcontrib-verilog-diagrams

echo "Installing netlistsvg"
sudo npm install -g netlistsvg

# If you do not want to generate a standard cell library, then uncomment the following line to stop here
#exit

echo Installing StdCellLib
git clone https://github.com/thesourcerer8/StdCellLib
cd StdCellLib/Catalog
make catalog
make importQflow
make layout
make doc
perl ../Tools/perl/buildreport.pl
#sudo make qflow
cd ..
make dist


