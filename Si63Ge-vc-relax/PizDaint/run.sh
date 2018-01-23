#!/bin/bash -l
#SBATCH --nodes=10
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --constraint=gpu
#SBATCH --contiguous
#SBATCH --time=00:10:00

# Load required modules
module load PrgEnv-pgi
module load intel  
module load cudatoolkit 

if [ -z "${QE_EXE}" ]; then echo "ERROR: Please export QE_EXE before running script." ; exit; fi

# QE run parameters
NGPU=10
NPOOL=10

# Node-specific parameters
GPU_PER_SOCKET=1
CORES_PER_SOCKET=12

NCORE_PER_RANK=$((${CORES_PER_SOCKET}/${GPU_PER_SOCKET}))

export OMP_NUM_THREADS=${NCORE_PER_RANK}
export MKL_NUM_THREADS=${NCORE_PER_RANK}

srun -n ${NGPU} -c ${CORES_PER_SOCKET} --cpu_bind=none ${QE_EXE} -input ../pw.in -npool ${NPOOL} | tee output_${NGPU}GPU_${NPOOL}POOL.txt
