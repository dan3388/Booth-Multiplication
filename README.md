# Booth’s Multiplication Algorithm (MIPS32)
## Project Overview

This project is a MIPS32 assembly implementation of Booth’s Multiplication Algorithm, designed to handle 8-bit signed integers. Booth's algorithm is an efficient method for multiplying signed binary numbers in two's complement notation, reducing the number of required additions and subtractions by analyzing bit pairs.

### Current Implementation Details
- Architecture: MIPS32 (tested QT+SPIM simulators).
- Look-Up Table (LUT) Logic: Analyzes the multiplier bits to determine whether to add the multiplicand, subtract it, or shift the partial product.
- I/O Integration: Includes a console-based interface for user input and result visualization.

### Development Roadmap

These are some things I would love to implement as I learn more about Assembly Language and MIPS:
- Strict Input Validation: Implementing boundary checks to ensure user input remains within the 8-bit signed range (−128 to 127).
- Binary Visualization: Adding a conversion routine to print internal register states in binary format, allowing for step-by-step debugging and algorithmic transparency.
- Process Lifecycle Management: Implementing a program loop with "Restart" and "Exit" events to allow for multiple consecutive calculations without restarting the simulator.
