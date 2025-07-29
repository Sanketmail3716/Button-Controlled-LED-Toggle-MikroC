# Button-Controlled LED Toggle (MikroC)

This project demonstrates how to toggle an LED using a push button with a PIC microcontroller and MikroC compiler. The LED connected to pin **RB1** toggles its state each time the button on **RB5** is pressed and released. Additionally, **PORTC** is initialized with a fixed binary pattern.

---

## 🧠 Features

- Toggle LED on button press (edge detection).
- Debounce logic using `Button()` function from MikroC.
- Initializes `PORTC` with `0xAA` (binary `10101010`) pattern.
- Simple state-tracking mechanism using `oldstate` variable.
- Fully written in MikroC for PIC microcontrollers.

---

## 🛠️ Hardware Requirements

- PIC Microcontroller (e.g., PIC16F877A)
- One push button connected to **RB5** with pull-down resistor
- One LED connected to **RB1** with current-limiting resistor
- Optional LEDs connected to PORTC for visual output

---

## ⚙️ Pin Configuration

| Pin     | Function       | Direction |
|---------|----------------|-----------|
| RB1     | LED Output     | Output    |
| RB5     | Button Input   | Input     |
| PORTC   | Debug Pattern  | Output    |

---

## 🧾 Code Explanation

```c
bit oldstate;            // Stores previous state of the button

sbit Led at RB1_bit;     // LED connected to RB1
sbit Led_Direction at TRISB1_bit;

void main() {
  Led_Direction = 0;     // Set RB1 as output
  TRISB5_bit = 1;        // Set RB5 as input
  TRISC = 0x00;          // Configure PORTC as output
  PORTC = 0xAA;          // Set initial PORTC value (10101010)
  oldstate = 0;

  do {
    if (Button(&PORTB, 5, 1, 1)) {
      oldstate = 1;      // Button press detected
    }
    if (oldstate && Button(&PORTB, 5, 1, 0)) {
      Led = ~Led;        // Toggle LED state
      oldstate = 0;      // Reset state tracker
    }
  } while (1);           // Infinite loop
}
📦 How to Build and Run
Open MikroC and create a new project.

Paste the code into the main source file.

Set the proper device (e.g., PIC16F877A) and clock frequency.

Compile and upload the HEX to your microcontroller using a compatible programmer.

Press and release the button to toggle the LED.

📚 Dependencies
MikroC PRO for PIC compiler

PIC microcontroller (tested with 16F877A)

🔖 License
This project is open-source and free to use under the MIT License.

👨‍💻 Author
Your Name
Email or GitHub (optional)

yaml
Copy
Edit

---

Let me know if you'd like the `.hex` file generation steps or a Proteus simulation setup too. 