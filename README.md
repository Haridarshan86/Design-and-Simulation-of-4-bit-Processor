# 🚀 4-Bit Single-Cycle Processor using Verilog HDL

<p align="center">
  <img src="https://img.shields.io/badge/Language-Verilog-blue?style=for-the-badge&logo=verilog" />
  <img src="https://img.shields.io/badge/Tool-Xilinx%20Vivado-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Architecture-Single%20Cycle-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Simulation-Passed-success?style=for-the-badge" />
  
</p>

---

## 📖 Overview

This project implements a **custom 4-bit Single-Cycle Processor** using **Verilog HDL**. The processor demonstrates the core concepts of computer architecture by integrating a **Program Counter**, **Instruction Memory**, **Control Unit**, **Register File**, **Arithmetic Logic Unit (ALU)**, and **Data Memory** into a complete CPU.

The processor fetches instructions from memory, decodes them, performs arithmetic or logical operations, accesses data memory when required, writes results back into registers, and halts execution using a dedicated **HALT** instruction.

The complete design is modular, making it easy to understand, extend, and implement on FPGA platforms.

---

# ✨ Features

- ✅ Custom 4-bit Processor
- ✅ Single-Cycle Architecture
- ✅ Modular Verilog Design
- ✅ Program Counter (PC)
- ✅ Instruction Memory
- ✅ Control Unit
- ✅ Register File (4 Registers)
- ✅ Arithmetic Logic Unit (ALU)
- ✅ Data Memory
- ✅ Arithmetic Instructions
- ✅ Logical Instructions
- ✅ LOAD / STORE Instructions
- ✅ HALT Instruction
- ✅ Zero Flag
- ✅ Carry Flag
- ✅ Behavioral Simulation in Vivado

---

# 🏗 Processor Architecture

```
                    +----------------------+
                    |   Program Counter    |
                    +----------+-----------+
                               |
                               ▼
                    +----------------------+
                    | Instruction Memory   |
                    +----------+-----------+
                               |
                    Instruction Decode
                               |
             +-----------------+-----------------+
             |                                   |
             ▼                                   ▼
      +---------------+                 +----------------+
      | Control Unit  |                 | Register File  |
      +-------+-------+                 +-------+--------+
              |                                 |
              +---------------+-----------------+
                              |
                              ▼
                       +--------------+
                       |     ALU      |
                       +------+-------+
                              |
                 +------------+-------------+
                 |                          |
                 ▼                          ▼
          Data Memory               Write Back


```
<img width="1827" height="529" alt="Screenshot 2026-08-01 102553" src="https://github.com/user-attachments/assets/65829fad-c93b-40b0-9031-50a43e435909" />


---
**Clocked (Sequential) Modules**
- Program Counter
- Register File (Write Operation)
- Data Memory (Write Operation)

**Combinational Modules**
- Instruction Memory
- Control Unit
- ALU
- Write-Back Multiplexer

# 🧩 Modules

## 1️⃣ Program Counter

Maintains the address of the next instruction.

### Responsibilities

- Reset PC
- Increment PC
- Stop execution during HALT

---

## 2️⃣ Instruction Memory

Stores the processor program.

---

## 3️⃣ Control Unit

Decodes the opcode and generates all processor control signals.

### Outputs

- Register Write Enable
- Memory Write Enable
- ALU Operation Select

---

## 4️⃣ Register File

Contains four 4-bit general-purpose registers.

| Register | Initial Value |
|----------|---------------|
| R0 | 1 |
| R1 | 2 |
| R2 | 0 |
| R3 | 0 |

Supports

- Asynchronous Read
- Synchronous Write

---

## 5️⃣ Arithmetic Logic Unit (ALU)

Performs arithmetic and logical operations.

### Supported Operations

| ALU Select | Operation |
|------------|-----------|
|000|Addition|
|001|Subtraction|
|010|AND|
|011|OR|
|100|XOR|
|0101|LOAD|Load data from memory|
|0110|STORE|Store data into memory|
|1111|HALT|Stop processor execution|

### Flags

- Carry Flag
- Zero Flag

---

## 6️⃣ Data Memory

- 16 Memory Locations
- 4-bit Data Width

### Initial Memory Contents

| Address | Value |
|---------|-------|
|0|5|
|1|3|
|2|8|
|3|10|

---

# 📝 Instruction Format

```
 7      4 3    2 1    0
+---------+------+------+
| Opcode  |  RD  |  RS  |
+---------+------+------+
```

---

# 💻 Instruction Set

| Opcode | Instruction | Description |
|---------|-------------|-------------|
|0000|ADD|R[RD] ← R[RD] + R[RS]|
|0001|SUB|R[RD] ← R[RD] − R[RS]|
|0010|AND|R[RD] ← R[RD] & R[RS]|
|0011|OR|R[RD] ← R[RD] \| R[RS]|
|0100|XOR|R[RD] ← R[RD] ^ R[RS]|
|0101|LOAD|R[RD] ← Memory[RS]|
|0110|STORE|Memory[RS] ← R[RD]|
|1111|HALT|Stops Processor Execution|

---

# 📜 Example Program

| PC | Instruction |
|----|-------------|
|0|LOAD R0 ← MEM[0]|
|1|LOAD R1 ← MEM[1]|
|2|ADD R2,R1|
|3|SUB R2,R1|
|4|AND R2,R1|
|5|OR R2,R1|
|6|XOR R2,R1|
|7|STORE R0 → MEM[2]|
|8|HALT|

---


# 🖥 Simulation Results

<img width="1455" height="865" alt="image" src="https://github.com/user-attachments/assets/cc5b0bac-19b8-4962-a21e-3990103d55c4" />
<img width="1258" height="378" alt="image" src="https://github.com/user-attachments/assets/d7aca953-90a5-4b9a-a39d-cf1cd7968951" />
<img width="1467" height="468" alt="image" src="https://github.com/user-attachments/assets/f8736fc2-9e95-4b1c-8a23-60b11d814bff" />


The processor was successfully simulated using **Xilinx Vivado**.

### Execution

| PC | Instruction | Result |
|----|-------------|--------|
|0|LOAD R0|PASS|
|1|LOAD R1|PASS|
|2|ADD|PASS|
|3|SUB|PASS|
|4|AND|PASS|
|5|OR|PASS|
|6|XOR|PASS|
|7|STORE|PASS|
|8|HALT|PASS|

---
##  Working Of Processor

Before Execution Starts
Register File
| Register | Value |
| -------- | ----: |
| R0       |     1 |
| R1       |     2 |
| R2       |     0 |
| R3       |     0 |

These are the initial values
Data Memory
| Address | Value |
| ------- | ----: |
| MEM[0]  |     5 |
| MEM[1]  |     3 |
| MEM[2]  |     8 |
| MEM[3]  |    10 |

These values come from data_memory.v.

## In step1:Time = 0 ns,PC = 0,Instruction = 01010000,Opcode = 0101

## What is PC?
PC means Program Counter.
It tells the processor which instruction to execute.
Since,PC = 0 the processor goes to Instruction Memory memory[0] which contains 01010000.
Decode the instruction
01010000 means 0101 00 00
0101 = LOAD
00 = R0
00 = Memory Address 0
LOAD R0, MEM[0]
it means Copy the value stored in Memory Address 0 into Register R0.
Memory has MEM[0] = 5 Therefore R0 = 5  Now the registers become
| Register | Value |
| -------- | ----: |
| R0       |     5 |
| R1       |     2 |
| R2       |     0 |
| R3       |     0 |

## Why is ALU Result = 2?
Your ALU is always ON.
Even though we're doing a LOAD, it still receives inputs.
At this time A = R0 = 1 ,B = R0 = 1  Control Unit keeps ALU_Sel = ADD Therefore 1 + 1 = 2 so Alu result=2.
But this result is ignored because LOAD uses memory, not the ALU result.

## STEP 2:Time = 25000 ns,PC = 1,Instruction = 01010101

Go to Instruction Memory[1] Instruction 01010101 Break it
0101 = LOAD
01 = R1
01 = Memory Address 1
Meaning LOAD R1 <- MEM[1] Memory MEM[1] = 3
Now R1 = 3 Registers become 
| Register | Value |
| -------- | ----: |
| R0       |     5 |
| R1       |     3 |
| R2       |     0 |
| R3       |     0 |
## Why ALU Result = 4?
Again ALU is still running.Before R1 is updated,
R1 = 2 ALU receives A = 2, B = 2
Therefore 2 + 2 = 4
So ALU Result = 4 Again ignored.

## STEP 3:Time = 35000,PC = 2,Instruction = 00001001

Instruction 0000 = ADD 
10 = R2
01 = R1  Meaning  R2 = R2 + R1
Current registers
R2 = 0
R1 = 3
Processor does   0 + 3 = 3
Therefore
ALU Result = 3
Now
R2 = 3
| Register | Value |
| -------- | ----: |
| R0       |     5 |
| R1       |     3 |
| R2       |     3 |
| R3       |     0 |

## STEP 4 PC = 3

Instruction = 00011001
Decode
0001 = SUB
10 = R2
01 = R1
Meaning
R2 = R2 - R1
Current
R2 = 3
R1 = 3
Processor
3 - 3 = 0
So
ALU Result = 0
Now
R2 = 0

## STEP 5 PC = 4
Instruction = 00101001  Decode
0010 = AND
R2 = R2 & R1
Current
R2 = 0
R1 = 3
Processor
0 AND 3 = 0
So
ALU Result = 0
R2 remains
0

## STEP 6 PC = 5
Instruction = 00111001
Decode
0011 = OR
Processor
0 OR 3 = 3
Therefore
ALU Result = 3
Now
R2 = 3

## STEP 7 PC = 6
Instruction = 01001001
Decode
0100 = XOR
Processor
3 XOR 3 = 0
Therefore
ALU Result = 0
Now
R2 = 0


## STEP 8 PC = 7

Instruction = 01100010
Decode
0110 = STORE
00 = R0
10 = Memory Address 2
Meaning
Store R0 into Memory[2]
Current
R0 = 5
Therefore
MEM[2] = 5

Memory becomes
| Address | Value |
| ------- | ----: |
| MEM0    |     5 |
| MEM1    |     3 |
| MEM2    |     5 |
| MEM3    |    10 |

## STEP 9 PC = 8

Instruction = 11110000
Decode
1111 = HALT
Processor says Stop executing.
The Program Counter stops at 8.

## Final Registers
| Register | Value | Why?                             |
| -------- | ----: | -------------------------------- |
| R0       |     5 | Loaded from MEM[0]               |
| R1       |     3 | Loaded from MEM[1]               |
| R2       |     0 | ADD→3, SUB→0, AND→0, OR→3, XOR→0 |
| R3       |     0 | Never used                       |

## Final Memory
| Address | Initial | Final | Reason                     |
| ------- | ------: | ----: | -------------------------- |
| MEM[0]  |       5 |     5 | Not changed                |
| MEM[1]  |       3 |     3 | Not changed                |
| MEM[2]  |       8 |     5 | STORE wrote R0 into MEM[2] |
| MEM[3]  |      10 |    10 | Not changed                |

# 📊 Design Specifications

| Feature | Value |
|----------|-------|
|Architecture|Single Cycle|
|Instruction Width|8-bit|
|Data Width|4-bit|
|Address Width|4-bit|
|Registers|4|
|Instruction Memory|16 × 8|
|Data Memory|16 × 4|
|Clock|Synchronous|


---

# 🛠 Tools Used

| Software | Purpose |
|----------|----------|
|Xilinx Vivado|Design & Simulation|
|Verilog HDL|Hardware Description|
|Behavioral Simulation|Verification|

---

# 📈 Future Enhancements

This processor can be extended by implementing:

- Multiply (MUL)
- Divide (DIV)
- Shift Left (SHL)
- Shift Right (SHR)
- Rotate Instructions
- Immediate Instructions
- Jump (JMP)
- Branch Instructions (BEQ/BNE)
- Compare (CMP)
- Flags Register
- Pipeline Architecture
- Interrupt Handling
- UART Interface
- FPGA Implementation
- Self-Checking Testbench
- 8-bit / 16-bit Processor Version

---

# 🎯 Learning Outcomes

This project demonstrates practical knowledge of:

- Computer Architecture
- Processor Datapath Design
- Control Unit Design
- Instruction Set Architecture (ISA)
- Register File Design
- Arithmetic Logic Unit Design
- Memory Organization
- Sequential Logic
- Combinational Logic
- Verilog HDL
- Digital System Design
- Functional Simulation

---

## Open in Vivado

1. Open **Vivado**
2. Create a New RTL Project
3. Add all Verilog source files
4. Set **processor_top.v** as the top module
5. Set **processor_tb.v** as the simulation top
6. Run **Behavioral Simulation**

---

---

# 👨‍💻 Author

**Haridarshan B. Kunder**

Electronics and Communication Engineering  
NMAM Institute of Technology, Nitte


### ⭐ If you like this project, don't forget to star the repository! ⭐

</div>
