Booth’s Multiplication Algorithm (MIPS32)
Project Overview

This project is a MIPS32 assembly implementation of Booth’s Multiplication Algorithm, designed to handle 8-bit signed integers. Booth's algorithm is an efficient method for multiplying signed binary numbers in two's complement notation, reducing the number of required additions and subtractions by analyzing bit pairs.
Features

    Algorithmic Efficiency: Implements the Booth encoding logic (look-up table approach) to optimize arithmetic operations.

    Signed Integer Support: Native handling of 8-bit signed integers (-128 to 127).

    I/O Integration: Includes a console-based interface for user input and result visualization.

Current Implementation Details

    Architecture: MIPS32 (tested QT+SPIM simulators).

    Look-Up Table (LUT) Logic: Analyzes the multiplier bits to determine whether to add the multiplicand, subtract it, or shift the partial product.

    Bit-Width: Optimized for 8-bit operations, providing a clear view of register-level data flow.

Development Roadmap

I am currently refining the implementation to increase robustness and educational value:

    Strict Input Validation: Implementing boundary checks to ensure user input remains within the 8-bit signed range (−128 to 127).

    Binary Visualization: Adding a conversion routine to print internal register states in binary format, allowing for step-by-step debugging and algorithmic transparency.

    Process Lifecycle Management: Implementing a program loop with "Restart" and "Exit" events to allow for multiple consecutive calculations without restarting the simulator.
