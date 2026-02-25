## Single-Port RAM verification using System Verilog

## Overview
The objective of this project is to verify basic SRAM behavior such as reset, read, and write operations using a simple, structured approach. 
The testbench is written using UVM-inspired concepts, without using the UVM library, to clearly demonstrate core Design Verification fundamentals.

## Summary
Static Random Access Memory (SRAM) is a fast memory used to store data temporarily inside SoCs.
Key characteristics:
 1.Single clock synchronous design
 2.Separate read/write control
 3.Data retained as long as power is supplied
Behaviour:
 1.Reset initializes output signals
 2.Write operation stores data into memory
 3.Read operation outputs stored data from memory.

## DUT concept behaviour
1.Reset active (reset_n = 0)
  Output data is forced to 0
  
2.Write operation (wr_rd_en = 1)
  Data is written to memory
  Output remains 0
  
3.Read operation (wr_rd_en = 0)
  Data is read from memory and driven on data_out
=> All operations are synchronized to the rising edge of the clock.

## Testbench Architecture
 The testbench follows a layered verification structure:
 Interface – Signal abstraction and assertions
 Transaction class – Encapsulates address, data, and control
 Generator – Produces randomized read/write transactions
 Driver – Drives signals to the SRAM DUT
 Monitor – Samples DUT outputs
 Scoreboard – Compares expected vs actual data
 Mailbox-based communication between components.

## Tools used
 System Verilog
 Synposys vcs (2025.06)
 EDA playground

## Run 
 1.Compile SRAM RTL and testbench files
  2.Run tb_top
  3.Observe:
    Assertion results in simulation log
    Data comparisons in scoreboard
    Waveforms for read/write timing

 ## Author
   Dasi Honey
   VLSI Design Verificaton Trainee
 
 
 


