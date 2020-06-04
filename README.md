# Event Generation and Analysis for Neutral Pion Polarizability

## Instructions

### 1) To get the programs

```
cd /home/username
git clone https://github.com/jeffersonlab/npp_analysis
```

### 2) To setup the environment

```
setenv NPP /home/username/npp_analysis
source $NPP/setup
```

### 3) To configure the software

```
mkdir -p /work/halld/username/npp_work
cd /work/halld/username/npp_work
cp $NPP/example.nppcfg my.nppcfg
```

Edit my.nppcfg to indicate your preferences.
* number_of_events: number of events to generate for each of signal and phase space
* mc_outout_dir: Directory where MCwrapper should put its output.
* npp_analysis_dir: The directory defined as $NPP (see above).
* generator_config_file_phase_space: Name of file in $NPP_gen_config for generating phase space events
* generator_config_file_signal: Name of file in $NPP/gen_config for generating signal events.
* batch: whether simulation should be run in batch (batch=1) or in interactive (batch=0) mode. (default: 0)
* base_file_number: if simulation will produce multiple output files, the serial number of the first file. (default: 0).
* environment_setup_file: file to use to setup the shell environment (default: $NPP/originals/home_elton/MC_environment.csh)

### 4) Generate the Monte Carlo

```
cd /work/halld/username/npp_work
make -f $NPP/Makefile_mc CONFIG=my.nppcfg
```

Output goes to the directory named in the nppcfg file.

### 5) Analyze the Monte Carlo

```
cd /work/halld/username/npp_work
make -f $NPP/Makefile_analysis CONFIG=my.nppcfg
```

Output goes to the current working directory.

## Notes

### Original files come from:

* /work/halld2/home/elton/gen_2pi0_primakoff - submit jobs to farm
* /work/halld/home/elton/gen_2pi0_primakoff_signal/Z2pi0_trees - analysis streams

### From meeting on April 29, 2020:

* Critical files are that have changed are:
    * Z2pi0_trees/fit_2pi0_primakoff-File_100000.cfg
    * Z2pi0_trees/DSelector_Z2pi0_trees2.C
    * Z2pi0_trees/DSelector_Z2pi0_trees2.h
    * Z2pi0_trees/streamline2.csh
* Also gen_2pi0_primakoff/MC_config now uses random background, not tagger only
