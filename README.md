# PIPELINE-PROCESSOR-DESIGN
COMPANY: CODTECH IT SOLUTIONS

NAME: ANANGI MANI VIVEK

INTERN ID: CTIS8564

DOMAIN: VLSI

DURATION: 6 WEEKS

MENTOR: NEELA SANTOSH

DESCRIPTION:

Introduction
A pipelined processor is an important concept in computer architecture that improves the performance of a processor by executing multiple instructions simultaneously in different stages. Instead of completing one instruction before starting the next, pipelining divides instruction execution into several stages, allowing multiple instructions to overlap in execution. This technique increases instruction throughput and improves overall system efficiency. In this project, a simple 4-stage pipelined processor was designed and simulated using VHDL. The processor supports basic instructions such as ADD, SUB, and LOAD and demonstrates the fundamental operation of pipelining.

Objective
The primary objective of this project is to design and implement a 4-stage pipelined processor capable of executing arithmetic and data transfer instructions. The design is verified through simulation to ensure that instructions pass correctly through each pipeline stage and produce the expected outputs.

Tools Used
The following tools and technologies were used during the implementation of this project:

Xilinx Vivado Design Suite 2024.1
VHDL (VHSIC Hardware Description Language)
XSim Simulator
FPGA Design Methodology
Digital Logic Design Concepts
Vivado was used for coding, compilation, simulation, and verification of the processor design.

Working of the Processor
The processor is organized into four pipeline stages:

1. Instruction Fetch (IF)
In this stage, instructions are fetched from the instruction memory using the Program Counter (PC). The fetched instruction is stored in the IF/ID pipeline register.

2. Instruction Decode (ID)
The fetched instruction is decoded to identify the operation type and operands. The decoded information is transferred to the next pipeline stage through the ID/EX register.

3. Execute (EX)
The Arithmetic Logic Unit (ALU) performs the required operation. For ADD and SUB instructions, arithmetic calculations are executed. For the LOAD instruction, data is prepared for transfer.

4. Write Back (WB)
The result generated during execution is written back into the destination register of the register file. This completes the instruction execution cycle.

The pipeline allows different instructions to occupy different stages simultaneously, thereby improving processing efficiency.

Simulation and Verification
The processor design was verified using the XSim simulator available in Vivado. A testbench was created to generate clock signals and stimulate the processor. During simulation, the waveform displayed the movement of instructions through the IF, ID, EX, and WB stages. Signals such as IF_ID, ID_EX, EX_result, WB_dest, and register contents were monitored.

The simulation results confirmed that the ADD, SUB, and LOAD instructions were fetched, decoded, executed, and written back successfully. The waveform also demonstrated overlapping execution of instructions, proving that the pipelining mechanism was functioning correctly.

Applications
Pipelined processor architectures are widely used in modern computing systems because they increase instruction throughput and improve processor performance. Applications include:

Microprocessors and CPUs
Embedded Systems
FPGA-Based Computing Platforms
Digital Signal Processing Systems
Real-Time Control Systems
Computer Architecture Education and Research
Conclusion
The 4-stage pipelined processor was successfully designed, implemented, and simulated using VHDL. The processor correctly executed ADD, SUB, and LOAD instructions while demonstrating the principles of pipelined execution. Simulation results verified proper operation of all pipeline stages and confirmed successful instruction flow through the processor. This project provides a strong foundation for understanding advanced processor architectures and FPGA-based digital system design.

##Output

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/9a7367ff-7a7f-47e8-84f7-2bd932e80cbb" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/9a83bbb5-637d-4709-8936-0ccbdcfdc393" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/2f24af21-6aae-43e4-867d-7fe499289d80" />


