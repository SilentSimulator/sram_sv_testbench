## Single-Port RAM verification using System Verilog

## Overview
The objective of this project is to verify basic SRAM behavior such as reset, read, and write operations using a simple, structured approach. 
The testbench is written using UVM-inspired concepts, without using the UVM library, to clearly demonstrate core Design Verification fundamentals.

## Summary
Static Random Access Memory (SRAM) is a fast memory used to store data temporarily inside SoCs.
Key characteristics are Single clock synchronous design, Separate read/write control, Data retained as long as power is supplied
Behaviour:Reset initializes output signals, Write operation stores data into memory, Read operation outputs stored data from memory.

## Testbench Architecture
 The testbench follows a layered verification structure:
 Signal abstraction and assertions, Transaction class, Generator Produces randomized read/write transactions, Driver drives signals to the SRAM DUT,
 Monitor samples DUT outputs, Scoreboard compares expected vs actual data, Mailbox-based communication between components.

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
 
 
 


