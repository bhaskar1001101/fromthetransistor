# FPGAs and Transistors: Building Blocks of Modern Electronics

## Transistors: The Fundamental Building Block
Transistors come in two main types: NPN and PNP, which refer to the configuration of the semiconductors within. When properly arranged in circuits, these transistors can create logic gates.

## How do Transistors work ?
Transistors operate as switches by controlling the flow of electrical current through a semiconductor material. In digital circuits, this on/off switching behavior is used to represent binary states (0 and 1). When combined into logic gates, transistors can perform any logical operation, forming the basis of all computing.

However, building a transistor from scratch involves complex processes, including doping semiconductor materials and forming precise connections, which goes beyond the scope of most digital design projects. Instead, in this course, you'll leverage the power of pre-built ICs and FPGAs, which package these transistors into reliable, ready-to-use forms.
## Integrated Circuits (ICs): Collections of Transistors
Integrated Circuits, or ICs, are collections of transistors organized into functional circuits within a single chip. ICs package these transistors in a reliable, compact form, making them suitable for production. The transistors within an IC are connected to perform specific functions, such as processing data, storing information, or managing power.

## FPGAs: Field Programmable Gate Arrays
A Field-Programmable Gate Array (FPGA) is a type of IC designed to be configured by the user after manufacturing. Unlike fixed-function ICs, which are pre-wired to perform a specific task, FPGAs consist of an array of programmable logic blocks (PLBs) that can be configured to perform virtually any digital function.

At a high level, an FPGA is built from:

    Look-Up Tables (LUTs): These are small memory arrays that can implement any combinational logic function. By programming the LUTs, you define how input signals should map to output signals, effectively creating custom logic gates.

    Flip-Flops: These are basic memory elements used to store binary data. In an FPGA, flip-flops are used to build sequential logic, such as counters or state machines.

    Routing Resources: These are programmable interconnections that allow the logic blocks to be connected in different ways. By configuring these connections, you define the data paths between the logic blocks.

    I/O Blocks: These manage the interface between the FPGA and the external world, allowing the FPGA to communicate with other devices.

The programmability of FPGAs comes from their architecture. Instead of being hardwired, the logic gates inside an FPGA are formed by configuring its LUTs and routing resources. This allows the FPGA to be reprogrammed for different tasks even after it has been deployed in a device.

Look into LUTS into more detail and how they are used.
## Further Reading
- Guide to Computer Processor Architecture A RISC-V Approach, with High-Level Synthesis (Bernard Goossens)
