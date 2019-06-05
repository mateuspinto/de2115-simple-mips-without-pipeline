# Data Path Part 1 and 2: MIPS of Integers complete, without pipeline, in SystemVerilog and implemented in FPGA DE2-115 Altera

**Leandro Lazaro Araújo Vieira, Mateus Pinto da Silva**

**Computer Science - Federal University of Viçosa - Campus Florestal (UFV-caf) - Florestal - MG - Brazil**

**Abstract.** This work consists of architecting a non-pipeline MIPS processor in SystemVerilog that can execute the proposed and several additional instructions and implement it on the Altera DE2-115 FPGA. For this, we take as base the division of the processor with pipeline and we apply an additional module of division and multiplication. We also created a small Python makefile to execute the commands, due to the absence of native make for Windows, the operating system that runs the vast majority of architectural design software, including the ones we use.


# How to simulate and work on the FPGA

To perform the job correctly, you must:

● Quartus Prime Lite Edition (for testing on DE2-115)
● FPGA DE2-115 Altera
● Python 3 (for running the makefile)
● Windows (all tests were done using version 10 PRO)

To run, just double-click the "make.py" file.

**![](https://lh3.googleusercontent.com/NXT9BuIG0IPm3m0CNUjzwH_fJwejijwk6oN4IfZk6i5iyEe51KjBmMeG-U9c9T6hFK3GsUu26n6870IhsganaMJY4biuvzrBm5_bs28D_fvGueDcSW3TywyMCmPqnQ)**
--
After transferring the synthesized file to the FPGA via Quartus Prime, the board should behave as follows:
**![](https://lh4.googleusercontent.com/Ioqm5VQQNM0tBYlb54g0spDSuwlhWlDgLFcArlO1gjid1ZkZm3kGKLKg3nJ5bjB_pM1GzTrBFlWOMtkGUeWfEPeXvfcXC0PkedJNl2gRVuiIHpDfukloQjz7GPDTFw)**

