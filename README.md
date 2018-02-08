# qe-gpu-benchmarks
Benchmark repository for qe-gpu (https://github.com/fspiga/qe-gpu)

## Getting qe-gpu:
- Clone the qe-gpu repository:
`git clone https://github.com/fspiga/qe-gpu`

- Create a `make.inc` file in the top qe-gpu directory. Examples for the tested systems can be found in the `makeincs/` subdirectory of this repository. *Note*: For accurate timings, ensure the `-DUSE_NVTX` flag is included in the list of `DFLAGS`.

- See `README.md` in main qe-gpu repository for further details on installation.

## Running benchmark cases:
- **Important**: Before running any of the scripts in this repository, export environment variable `QE_GPU = <path to pw.x executable>`
- Within the testcase directories, there are sample run/batch scripts `run.sh` and expected output in files titled `output_*GPU_*POOL.txt` for several tested systems. If you are running on one of those systems, running/submitting these scripts from the directory they are located should work without any need to modify paths in the input files. 

# Benchmark Results
### AUSURF112 (k-points = 2)

| System | GPU | CPU | NGPU | NPOOL | PWSCF (sec) |
| :--- | :---: | :---: | :---: | :---:| :---: | 
| DGX-1 (Pascal) | NVIDIA Pascal P100 SXM2 | Intel Xeon E5-2698 v4 | 8 | 2 | 89.38 |
| Piz Daint | NVIDIA Pascal P100 PCIe | Intel Xeon E5-2690 v3 | 8 | 2 | 110.64 |

### Si63Ge-vc-relax (k-points = 10)

| System | GPU | CPU | NGPU | NPOOL | PWSCF (sec) |
| :--- | :---: | :---: | :---: | :---:| :---: |
| Piz Daint | NVIDIA Pascal P100 PCIe | Intel Xeon E5-2690 v3 | 10 | 10 | 138.08 |
| DGX-1 (Pascal) | NVIDIA Pascal P100 SXM2 | Intel Xeon E5-2698 v4 | 5 | 5 | 261.33 |
 
### Ta2O5 (k-points = 26)

| System | GPU | CPU | NGPU | NPOOL | PWSCF (sec) |
| :--- | :---: | :---: | :---: | :---:| :---: |
| Piz Daint | NVIDIA Pascal P100 PCIe | Intel Xeon E5-2690 v3 | 104 | 26 | 307.63 |
