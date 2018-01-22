#!/bin/bash
if [ -z "${QE_EXE}" ]; then echo "ERROR: Please export QE_EXE before running script." ; exit; fi

# QE run parameters
NGPU=8
NPOOL=2

# Node-specific parameters
GPU_PER_SOCKET=4
CORES_PER_SOCKET=20

NCORE_PER_RANK=$((${CORES_PER_SOCKET}/${GPU_PER_SOCKET}))
echo $NCORE_PER_RANK

export OMP_NUM_THREADS=${NCORE_PER_RANK}
export MKL_NUM_THREADS=${NCORE_PER_RANK}

mpirun -np ${NGPU} --map-by ppr:${GPU_PER_SOCKET}:socket ${QE_EXE} -input ../pw.in -npool ${NPOOL} | tee output_${NGPU}GPU_${NPOOL}POOL.txt
