# CapSwey's Sync Calculator (CSSC)

A lightweight, zero-dependency Windows batch utility for calculating exact audio, subtitle, and Dolby Vision RPU sync delays between two video sources of the same frame rate. Built specifically for **MKVToolNix** and **DDVT** workflows.

### Why use CSSC?
When muxing tracks or RPU metadata from Movie B onto a target video from Movie A, differences in studio logos or black leader frames often cause sync offsets. Instead of doing manual frame-to-millisecond math, enter the matching frame numbers of a hard cut from both sources to get:

* **Delay Direction:** Instantly tells you whether you need a Positive or Negative delay.
* **Exact Frame Difference:** Ready for frame-based tools like **DDVT**.
* **Exact Millisecond Delay:** Calculated using true broadcast frame-rate fractions (e.g., `24000/1001` for `23.976 fps`).
* **Auto-Clipboard:** Automatically copies the clean millisecond value (e.g., `-1001`) to your clipboard—just press `Ctrl+V` straight into MKVToolNix.

### Supported Frame Rates
* `23.976 fps` (Default - `24000/1001`)
* `24.000 fps` (`1000/24`)
* `25.000 fps` (`1000/25`)
* `29.970 fps` (`30000/1001`)
* `50.000 fps` (`1000/50`)
* `59.940 fps` (`60000/1001`)

### Quick Start
1. Find the exact frame number of a matching hard cut in both **Movie A** (Target Video) and **Movie B** (Source Audio/Subs/RPU) using a frame-accurate player (Avidemux, VirtualDub2, MPC, VapourSynth/AviSynth, etc.).
2. Double-click `CSSC.bat`.
3. Select your frame rate (or press `Enter` for `23.976 fps`).
4. Enter the frame number for Movie A, then Movie B.
5. Paste the auto-copied delay (`Ctrl+V`) directly into MKVToolNix or use the frame offset in DDVT.

*(Note: Always verify sync at both the start and end of the film to ensure there are no mid-movie edit differences.)*

### Safety & Requirements
* **OS:** Windows 10 / 11 (uses native CMD & PowerShell; no Python or external tools required).
* **100% Transparent:** Distributed as a plain `.bat` file—right-click and open in Notepad to inspect the code before running.

