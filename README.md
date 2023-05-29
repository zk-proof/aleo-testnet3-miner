# Aleo Miner

## Introduction
Aleo Miner, more informations on https://zkpros.com

## Usage

Please refer to the usage help (`zkpros-aleo-miner --help`):

```
0.2.0

Usage: zkpros-aleo-miner [OPTIONS]

Options:
  -d, --debug                 Enable debug logging
  -a, --address <ADDRESS>     Prover address (aleo1...)
  -s, --server <SERVER>       Server node
  -p, --pools <POOLS>         Number of thread pools, default cpus / threads on cpu module or gpu numbers on gpu module
  -t, --threads <THREADS>     Number of threads each pool, default 1
  -o, --log <LOG>             Output log to file
  -g, --cuda <CUDA>           Indexes of GPUs to use
                              Example: -g 0 -g 1 -g 2
  -f, --full                  Enable use free cpu resource when gpu model,and only working on gpu model
  -b, --batch <BATCH_SIZE>    Proof batch size, larger number means more gpu memory required.
                              If not set or set to 0, will using recommended batch size(the recommended size is output on the screen);
                              If recommended batch size excceeds the memory size, you should reduce it(refer the recommended size output on the screen).
                              Example : -b 0 (use recommended batch size)
                                        -b 1000 (please ensure your gpu memory can afford it) 
  -c, --cpu_resource_limited  default is false, true means cpu resource is very poor, so use gpu to instead it
  -r, --report                disable report to web
  -l, --solo                  Enable solo module, default is pool module
  -h, --help                  Print help information

```
## Install

1. Install cuda

   [Download links](https://developer.nvidia.com/cuda-11-6-2-download-archive)


2. Download miner

   [https://github.com/zk-proof/aleo-testnet3-miner/releases](https://github.com/zk-proof/aleo-testnet3-miner/releases)

## Quick start

1. ubuntu os

 - cpu model
    ```
    ./zkpros-aleo-miner-cpu  -a <address>  
    ```
 - gpu model
    ```
    ./zkpros-aleo-miner-gpu  -a <address>  -g 0 
    ```

2. hiveon os
- Wallet
    ```
       Coin: ALEO
       Address: xxx
       Name: xx
     ```

- Flight Sheets
   
  Miner:  Custom

  Custom configuration
    ```
       Miner name:                    zkpros-aleo-miner
       Installation URL:              https://github.com/zk-proof/aleo-testnet3-miner/releases/download/vx.x.x/zkpros-aleo-miner-hiveos.tar.gz
       Hash algorithm:                 ----
       Wallet and worker template:    %WAL%
       Pool URL:                      solo.zk-proof.xyz:8888  (solo: solo.zk-proof.xyz:9999)
       Pass:
       Extra config arguments:        -g 0
     ```
## Parameters
- gpu model
1. use " -l " to miner on solo module
    ```
    ./zkpros-aleo-miner-gpu  -a <address>  -g 0  -l
    ```
2. use " -g  " to miner on multiple gpus

    ```
    ./zkpros-aleo-miner-gpu  -a <address>  -g 0 -g 1 -g 2  -l
    ```
3. use " -c  " to limited use cpu resource when cpu resources less and gpu resources more

    ```
    ./zkpros-aleo-miner-gpu  -a <address>  -g 0 -g 1 -g 2  -l  -c
    ```
4. use " -s  " to specifies the server ip

    ```
    ./zkpros-aleo-miner-gpu  -a <address>  -g 0 -g 1 -g 2  -l  -c  -s <ip:port>
    ```
5. use " -b  " to specifies the batch size

    ```
    ./zkpros-aleo-miner-gpu  -a <address>  -g 0 -g 1 -g 2  -l  -c  -s <ip:port> -b 1000
    ```

- cpu model
1. use " -l " to miner on solo module
    ```
    ./zkpros-aleo-miner-cpu  -a <address>  -l
    ```
2. use " -p  -t " to modify the default pool nums and each pool threads
    ```
    ./zkpros-aleo-miner-cpu  -a <address>  -l  -p 10 -t 1
    ```

## Information
```
████████████████████████████████████████████████████████████████████████████████████████████
█░                                                                                        ░█
█░    ───────▓▓╬▓─────────      OS  : Linux 20.04 Ubuntu                                  ░█
█░    ─────▓▓▓▓╬▓▓▓▓──────      CPU : physical cores: 64   logical cores: 128             ░█
█░    ░░▄░▓▓▓▓▓║▓▓▓▓▓░░░░░            [1] AMD EPYC 7542 32-Core Processor(128)            ░█
█░    ░▀████████████████▀░░                                                               ░█
█░    ░ https://zkpros.com ░    GPU : working gpus: 1                                     ░█
█░                                    [1] NVIDIA GeForce RTX 3090 ^ 24G                   ░█
█░                              RAM : 126 G                                               ░█
█░    ================================================================================    ░█
█░                                                                                        ░█
█░    GPU    |     Speed(30s)        |       Speed(1min)       |        Speed(5min)       ░█
█░    1      |     -- c/s            |       -- c/s            |        -- c/s            ░█
█░    total  |     -- c/s            |       -- c/s            |        -- c/s            ░█
█░                                                                                        ░█
█░    Last 10s CPU usage avg(%) : 200.4                                                   ░█
█░    Last 10s GPU usage avg(%) : 99                                                      ░█
█░    Last 10s ARM usage avg(M) : 222 Mb/128750 Mb                                        ░█
█░                                                                                        ░█
█░    --------------------------------Environment Detail------------------------------    ░█
█░     Thread Pools:   1 x 1          Cpu limited: false          Model: cpu (pool)       ░█
█░                                                                                        ░█
████████████████████████████████████████████████████████████████████████████████████████████
```
