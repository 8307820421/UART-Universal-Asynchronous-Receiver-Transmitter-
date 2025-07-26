# UART (Universal-Asynchronous-Receiver-Transmitter)
#Objective :- The primary objective of UART protocol is used for short distance communication between the input peripherals and output devices.

🔍 Problem Statement:

✅ Gained hands-on familiarity with UART protocol by developing transmitter and receiver modules.

🧪 Implemented UART-based data transmission to display:

✅Single-digit data (0–9)

✅Double-digit data (00–99)

✅Triple-digit data (000–999) on serial monitors like PuTTY or Arduino Serial Monitor.

🔁 Extended the design using a FIFO buffer to receive and display each pressed value from PC input in real-time.

============================================================================================

💡 Solution & Learning Outcome:

-------------------------------------

📶 Optimized UART communication using UARTLite 166500 IP, AXI Interconnect, and MicroBlaze Processor on Basys 3 FPGA.

🧩 Focused on transmitter-side logic, refining it per feedback and technical lead requirements

🖥️ Displayed real-time data output on serial monitor and analyzed behavior through graphical visualization.

🔤 Learned the relationship between ASCII values and UART encoding, and explored its relevance in long-distance serial communication.

🛰️ Understood how UART is used in sensor systems for data acquisition over extended distances.

------------------------------------------------------------------------------------------------

• Researched the UART (Universal Asynchronous Receiver Transmitter) protocol and developed a pipelined architecture from child to parent modules for efficient data handling.
 
• Designed a 100MHz UART-compatible clock generator module with a 10ns period, and implemented and optimized asynchronous counter-based baud rate generator while 
  adhering to UART protocol requirements.
  
• Configured and tested UART data transmission for 8-bit values (0–99) at standard baud rates of 9600 and 115200bps, using baud count logic synchronized with the 100MHz system clock.

• Refined and applied FPGA constraints for Basys3 board to support UART communication, and verified functionality using serial monitoring tools such as Tera Term, PuTTY, and Arduino IDE.

• Implemented a FIFO (queue) structure to manage TX and RX data flow and explored Xilinx IP cores like UARTLite 16550 and GPIO interfaces within a custom 32-bit MicroBlaze processor, enabling data I/O
through Vitis software.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

💡Diagram: 

----------------
   
#1) Solution for First problem:-(Transmitter)

![Screenshot 2024-01-28 191307](https://github.com/8307820421/UART-Universal-Asynchronous-Receiver-Transmitter-/assets/110840084/f0b841bd-b4c1-4c14-88ff-981b224f2ed2)


![Screenshot 2024-01-29 121843](https://github.com/8307820421/UART-Universal-Asynchronous-Receiver-Transmitter-/assets/110840084/2e726b13-d880-496b-96ce-cda71fcd5d37)


![Screenshot 2024-01-29 154424](https://github.com/8307820421/UART-Universal-Asynchronous-Receiver-Transmitter-/assets/110840084/1b9d863f-d963-45dc-970b-a4c04cac80eb)


![Screenshot 2024-02-01 110524](https://github.com/8307820421/UART-Universal-Asynchronous-Receiver-Transmitter-/assets/110840084/0efb9215-ea15-493f-8905-f48493a8576e)


![Screenshot 2024-01-31 233620](https://github.com/8307820421/UART-Universal-Asynchronous-Receiver-Transmitter-/assets/110840084/d6cfc6d9-8cea-4d44-8638-b82206d4471b)


![Screenshot 2024-02-02 102105](https://github.com/8307820421/UART-Universal-Asynchronous-Receiver-Transmitter-/assets/110840084/8f596b45-e64f-4a30-8c18-4138bc18b709)


![Screenshot 2024-02-02 102136](https://github.com/8307820421/UART-Universal-Asynchronous-Receiver-Transmitter-/assets/110840084/fc2be496-7ac5-49f0-add8-bf3f4b381d42)

#2) (solution For firstProblem Using Receiver) :-
![Screenshot 2024-02-03 102836](https://github.com/8307820421/UART-Universal-Asynchronous-Receiver-Transmitter-/assets/110840084/69263954-e49e-4366-9ebf-9110a4f32974)

# Solution For ASCII Character :-

![Screenshot 2024-02-03 153533](https://github.com/8307820421/UART-Universal-Asynchronous-Receiver-Transmitter-/assets/110840084/b3c15984-e324-4314-8423-470c4214df09)

#Observation :-
![Screenshot 2024-02-03 164113](https://github.com/8307820421/UART-Universal-Asynchronous-Receiver-Transmitter-/assets/110840084/1a22d851-4edc-4d9b-bb69-f2b6924a0677)

![Screenshot 2024-02-03 190243](https://github.com/8307820421/UART-Universal-Asynchronous-Receiver-Transmitter-/assets/110840084/ba16aad8-2cbc-4b3f-92ca-657d9e90f3af)









