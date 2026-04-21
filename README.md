# Snake

A terminal-based Snake game written in Common Lisp. The game runs entirely in the command line with no external dependencies beyond a Common Lisp implementation.

---

## Requirements

- [Steel Bank Common Lisp (SBCL)](http://www.sbcl.org/) version 2.0 or later

### Installing SBCL

**Windows:**
Download the installer from the official SBCL releases page:
https://sourceforge.net/projects/sbcl/files/sbcl/2.6.3/sbcl-2.6.3-x86-64-windows-binary.msi/download

**Linux (Debian/Ubuntu):**
```
sudo apt install sbcl
```

**macOS:**
```
brew install sbcl
```

---

## How to Run

1. Clone or download this repository
2. Open a terminal or command prompt
3. Navigate to the folder containing `snake.lisp`
4. Run the following command:

```
sbcl --script snake.lisp
```

---

## Controls

| Key | Action     |
|-----|------------|
| W   | Move up    |
| S   | Move down  |
| A   | Move left  |
| D   | Move right |
| Q   | Quit       |

Type a key and press **Enter** to submit your move. The game is turn-based, meaning the snake moves one step each time you enter a command.

---

## Board Layout

```
+--------------------+
|                    |
|      @oo           |
|                    |
|           *        |
|                    |
+--------------------+
Score: 1
```

| Symbol | Meaning     |
|--------|-------------|
| @      | Snake head  |
| o      | Snake body  |
| *      | Food        |

The snake wraps around the edges of the board. The game ends when the snake collides with itself.

---

## Project Structure

```
snake.lisp    # Main game file
README.md     # This file
```

---

## Language

Written in **Common Lisp**, one of the oldest and most powerful programming languages, originally developed in the 1980s for artificial intelligence research. This project demonstrates Lisp's list manipulation capabilities, which make it well suited for representing and updating the snake's body as a sequence of positions.

---

## License

This project is open source and available under the MIT License.
