   # Aleo_Testnet3_Miner

## Introduction
Aleo Testnet3 Miner, more informations on https://zkpros.com

## Usage

Please refer to the usage help (`zkpros-aleo-miner --help`):

```
0.1.0

Usage: zkpros-aleo-miner [OPTIONS]

Options:
  -d, --debug              Enable debug logging
  -k, --key <KEY>          Prover address (aleo1...)
  -s, --server <SERVER>    Server node
  -p, --pools <POOLS>      Number of thread pools, default cpus / threads
  -t, --threads <THREADS>  Number of threads each pool, default 1
  -o, --log <LOG>          Output log to file
  -r, --report             Enable report to web
  -h, --help               Print help information
```
## Run
1. Install Rust

   We recommend installing Rust using [rustup](https://www.rustup.rs/). You can install `rustup` as follows:

- macOS or Linux:
  ```bash
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  ```

- Windows (64-bit):

  Download the [Windows 64-bit executable](https://win.rustup.rs/x86_64) or
  [Windows 32-bit executable](https://win.rustup.rs/i686) and follow the on-screen instructions.


2. Install cuda

   [Download links](https://developer.nvidia.com/cuda-11-6-2-download-archive)


3. download
  
    ``` 
    git clone https://github.com/zk-proof/aleo-testnet3-miner.git
    ``` 


4. run (solo / pool):

       ``` 
        notice： 
       
        -k: solo (aleo1xxx), pool (xxxx-xxx)

               example: solo: aleo1trp4exvys0w2de7fc002vxycgkpp0zkl2v5lacr6qhctms9z6sgqqqkklc
                        pool: b0ef1ef5-404f-4b2e-9c96-c9736e255824

        -s: ip:port

               example：solo: solo.zk-proof.xyz:9999
                        pool: (unavailable now)
   
        ``` 


   - linux os
     - cpu model:
     ```
       chmod a+x ./zkpros-aleo-miner-cpu
       ./zkpros-aleo-miner-cpu -s "ip:port"  -k "xx" -r
     ```
     - gpu model:
     ```
       chmod a+x ./zkpros-aleo-miner-gpu
       ./zkpros-aleo-miner-gpu -s "ip:port"  -k "xx" -g 0 -g 1 -r
     ```
     
   - windows os:
     - cpu model:
     ```
      zkpros-aleo-miner-cpu.exe -s "ip:port" -k "xx" -r
     ```
     - gpu model:
     ```
      zkpros-aleo-miner-gpu.exe -s "ip:port" -k "xx" -g 0 -g 1 -r
     ```
   
6. information
```
████████████████████████████████████████████████████████████████████████████████████████████
█░                                                                                        ░█
█░    ───────▓▓╬▓─────────      OS  : Linux 20.04 Ubuntu                                  ░█
█░    ─────▓▓▓▓╬▓▓▓▓──────      CPU : physical cores: 12   logical cores: 20              ░█
█░    ░░▄░▓▓▓▓▓║▓▓▓▓▓░░░░░            [1] 12th Gen Intel(R) Core(TM) i7-12700KF(20)       ░█
█░    ░▀████████████████▀░░                                                               ░█
█░    ░ https://zkpros.com ░    GPU : working gpus: 0                                     ░█
█░                                                                                        ░█
█░                              RAM : 31 G                                                ░█
█░    ================================================================================    ░█
█░                                                                                        ░█
█░    Speed(30s) : 76.97 C/S    |  Speed(1min) : 78.22 C/S    |  Speed(5min) : -- C/S     ░█
█░                                                                                        ░█
█░    Last 10s CPU usage avg(%) : 1761.6                                                  ░█
█░    Last 10s GPU usage avg(%) : --                                                      ░█
█░    Last 10s ARM usage avg(M) : 11926 Mb/31911 Mb                                       ░█
█░                                                                                        ░█
█░    --------------------------------Environment Detail------------------------------    ░█
█░    Proofs: 9370               Thread Pools:  20 x 1             model: cpu             ░█
█░                                                                                        ░█
████████████████████████████████████████████████████████████████████████████████████████████
```
