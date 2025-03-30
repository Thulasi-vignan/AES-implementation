# AES-implementation
# AES Algorithm Implementation on FPGA

## Overview
This repository contains a **Hardware Implementation of the AES (Advanced Encryption Standard) Algorithm** on an FPGA using Verilog. AES is a symmetric encryption algorithm widely used for securing digital data.

---

## Features
- **Supports AES-128 Encryption** (Can be extended to AES-192 and AES-256)
- **Implemented in Verilog** for FPGA acceleration
- **Fully Synchronous Design** optimized for performance
- **Key Expansion, SubBytes, ShiftRows, MixColumns, and AddRoundKey stages included**
- **Can be integrated with other hardware systems for secure communication**

---

## AES Algorithm Overview
AES operates on a **128-bit block of data** and uses a key size of **128, 192, or 256 bits**. It consists of several processing rounds, each including:

1. **SubBytes** - Byte substitution using an S-box.
2. **ShiftRows** - Row-wise shifting in the state matrix.
3. **MixColumns** - Mixing of column data.
4. **AddRoundKey** - XORing with the round key.

For AES-128, the process involves **10 rounds** of transformations.

---

## FPGA Implementation Details
### **Modules & Files**
| File | Description |
|------|-------------|
| `aes_top.v` | Top module integrating AES encryption |
| `key_expansion.v` | Generates round keys from the main key |
| `sub_bytes.v` | Implements AES S-Box substitution |
| `shift_rows.v` | Performs row shifts on the state matrix |
| `mix_columns.v` | Implements the MixColumns transformation |
| `add_round_key.v` | XORs the round key with the state matrix |
| `testbench.v` | Testbench for simulation and verification |

### **Design Considerations**
- Uses **Finite State Machines (FSMs)** for controlling encryption steps.
- Optimized for **resource efficiency and speed** on FPGA.
- **Pipelined architecture** for higher throughput.
- Can be extended to support **decryption and higher key sizes**.

---

## Simulation & Synthesis
### **Simulation Steps (ModelSim/Vivado)**
1. Load all Verilog files into the simulator.
2. Run the testbench (`testbench.v`).
3. Verify the encrypted output matches expected AES encryption results.
4. Check timing diagrams and register values.

### **Synthesis on FPGA (Vivado/Quartus)**
1. Create a new project in Vivado/Quartus.
2. Add all Verilog source files.
3. Set the FPGA board (e.g., **Nexys A7, Basys 3, or any Xilinx/Altera board**).
4. Synthesize and generate the bitstream.
5. Program the FPGA and test the AES implementation.

---

## Example Test Case
### **Inputs**
```
Plaintext:  54776F204F6E65204E696E652054776F
Key:        5468617473206D79204B756E67204675
```
### **Expected AES-128 Output**
```
Ciphertext:29C3505F571420F6402299B31A02D73A
```

---

## Future Enhancements
- **Support for AES-192 and AES-256**
- **Hardware AES Decryption Module**
- **Integration with SPI/UART for communication**
- **Power-efficient optimizations**

---

## Contributors
- **Your Name** - Bolisetty Thulasi Vignan

---

## License
This project is open-source and licensed under the MIT License.

