#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=gpu6,gpu5,gpu4,gpu3,gpu2,gpu1,cpu1
#SBATCH --cpus-per-task=16
#SBATCH --gres=gpu:0
#SBATCH --job-name=HARRY
#SBATCH -o ./log/SLURM.%N.%j.out         # STDOUT
#SBATCH -e ./log/SLURM.%N.%j.err         # STDERR
#SBATCH --time=1-00:00:00    # D-HH:MM:SS 포맷

module purge

source $HOME/PythonProjects/.venv_g/bin/activate

module load ansys-electronics/v242

# export ANSYSEM_ROOT242=/opt/ohpc/pub/Electronics/v242/Linux64
# export PATH=$ANSYSEM_ROOT242/ansysedt/bin:$PATH
# export ANSYSLMD_LICENSE_FILE=1055@172.16.10.81

# unset DISPLAY
# export QT_QPA_PLATFORM=offscreen


# export HOME=/gpfs/home2/wjddn5916
# cd /gpfs/home2/wjddn5916/ANSYS

$HOME/PythonProjects/.venv_g/bin/python3 run_N.py
sleep 86400
