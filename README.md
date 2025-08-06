# SystemVerilog ALU UVM-style Testbench

This repository contains a UVM-style SystemVerilog testbench for a 16-bit Arithmetic Logic Unit (ALU). It includes complete verification infrastructure with support for functional coverage and scoreboard-based validation.

---

## 🔧 Features

- 16-bit ALU supporting 16 operations:
  - Arithmetic: ADD, SUB, MUL, DIV
  - Logical: AND, OR, NAND, NOR, XOR, XNOR
  - Shift/Rotate: SHL, SHR, ROTL, ROTR
  - Comparison: Greater, Equal
- Modular UVM-style testbench:
  - Generator
  - Driver
  - Monitor
  - Scoreboard
  - Coverage
- Functional coverage collection for all operations
- Reference model-based checking in the scoreboard
- Compatible with Vivado simulator

---

## 📁 File Structure

```
├── alu.v              # ALU design (DUT)
├── interface.sv       # Interface for connecting DUT and TB
├── transaction.sv     # Transaction class (input/output abstraction)
├── generator.sv       # Random test vector generator
├── driver.sv          # Drives DUT with generated inputs
├── monitor.sv         # Observes DUT outputs
├── scoreboard.sv      # Compares DUT outputs with expected outputs
├── coverage.sv        # Functional coverage model
├── environment.sv     # Instantiates and connects all components
├── test.sv            # Test program
├── top.sv             # Top-level module for simulation
├── README.md          # Project overview (this file)
```

## ▶️ Simulation Instructions (Vivado)

1. Open **Vivado** and create a new project.
2. Add all `.sv` and `.v` files to the simulation sources.
3. Set `top.sv` as the top-level module.
4. Run the behavioral simulation.
5. View waveforms in the waveform viewer.

> **Tip:** Uncomment the `$dumpfile` and `$dumpvars` lines in `top.sv` to generate VCD waveform dumps.

---

## 📌 Requirements

- Vivado 2020.1+ or compatible simulator with SystemVerilog support
- Optional: GTKWave for viewing VCD waveforms

---

## 📦 Repository Description

> A SystemVerilog UVM-style testbench for verifying a 16-bit ALU. Includes generator, driver, monitor, scoreboard, and functional coverage for 16 operations (arithmetic, logical, shift, rotate, compare). Designed for simulation and waveform viewing in Vivado.
