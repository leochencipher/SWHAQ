#!/bin/bash
#PBS -Pw85
#PBS -qexpress
#PBS -N tc-006-05866
#PBS -m ae
#PBS -M craig.arthur@ga.gov.au
#PBS -lwalltime=01:00:00
#PBS -lmem=32GB,ncpus=1,jobfs=4000MB
#PBS -joe

module purge
module load pbs
module load dot
module load openmpi/1.8.4
module load python/2.7.11
module load python/2.7.11-matplotlib
module load pypar/26Feb15-2.7.6-1.8.4
module load geos
module load gdal/1.11.1-python

module list
DATE=`date +%Y%m%d%H%M`
SIMULATION=006-05866
OUTPUT=/g/data/w85/QFES_SWHA/wind/local/$SIMULATION
CONFIGFILE=/g/data/w85/QFES_SWHA/configuration/pm/QLD_$SIMULATION\_pm.ini
PYTHONPATH=$PYTHONPATH:$HOME/tcrm:$HOME/tcrm/Utilities
echo $PYTHONPATH
echo $CONFIGFILE
echo $OUTPUT
echo $GEOS_ROOT
# Run the complete simulation:
python $HOME/tcrm/ProcessMultipliers/processMultipliers.py -c $CONFIGFILE > $OUTPUT/$SIMULATION.stdout.$DATE 2>&1

cd $OUTPUT
cp $CONFIGFILE ./$SIMULATION.$DATE.ini